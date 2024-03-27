import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucaszick/utils/animated_cursor_trail.dart';
import 'package:lucaszick/widgets/copyright_dock.dart';
import 'package:lucaszick/widgets/section_contents/about_content.dart';
import 'package:lucaszick/widgets/guide_dialog.dart';
import 'package:lucaszick/widgets/home_section.dart';
import 'package:lucaszick/widgets/section_contents/contact_content.dart';
import 'package:lucaszick/widgets/section_contents/me_content.dart';
import 'package:lucaszick/widgets/section_contents/skills_content.dart';
import 'package:lucaszick/widgets/section_contents/work_content.dart';

import '../widgets/app_bar.dart';
import '../widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController controller;
  bool _showBackToTopButton = false;

  final Map<String, GlobalKey> sectionKeys = {
    'me': GlobalKey(),
    'about': GlobalKey(),
    'skills': GlobalKey(),
    'work': GlobalKey(),
    'contact': GlobalKey(),
  };

  void _scrollToTop() {
    controller.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _showGuideDialog(context) async {
    String? section = await showDialog(
        context: context, builder: (context) => const GuideDialog());
    _scrollToWidgetBySection(section);
  }

  void _scrollToWidgetBySection(String? section) {
    GlobalKey? scrollKey = sectionKeys[section];
    if (scrollKey != null) {
      Scrollable.ensureVisible(
        scrollKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = ScrollController()
      ..addListener(
        () {
          setState(
            () {
              if (controller.offset >= 300) {
                _showBackToTopButton = true;
              } else {
                _showBackToTopButton = false;
              }
            },
          );
        },
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar(), title: ""),
      drawer: BaseDrawer(sectionKeys: sectionKeys),
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: _showBackToTopButton
          ? FloatingActionButtonLocation.endFloat
          : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _showBackToTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              child: Icon(Icons.arrow_upward_rounded,
                  color: Theme.of(context).textTheme.bodyMedium?.color),
            )
          : FloatingActionButton(
              onPressed: () => _showGuideDialog(context),
              child: Icon(
                Icons.arrow_downward_rounded,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
      body: SingleChildScrollView(
        controller: controller,
        child: AnimatedCursorTrail(
          controller: controller,
          active: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              HomeSection(
                title: "me_title".tr(),
                scrollKey: sectionKeys['me']!,
                child: MeContent(),
              ),
              HomeSection(
                title: 'about_option'.tr(),
                scrollKey: sectionKeys['about']!,
                child: AboutContent(),
              ),
              HomeSection(
                title: 'skills_option'.tr(),
                scrollKey: sectionKeys['skills']!,
                child: SkillsContent(),
              ),
              HomeSection(
                title: 'work_option'.tr(),
                scrollKey: sectionKeys['work']!,
                child: WorkContent(),
              ),
              HomeSection(
                title: 'contact_option'.tr(),
                scrollKey: sectionKeys['contact']!,
                last: true,
                child: ContactContent(),
              ),
              const CopyrightDock()
            ],
          ),
        ),
      ),
    );
  }
}
