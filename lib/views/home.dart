import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucaszick/widgets/section_contents/about_content.dart';
import 'package:lucaszick/widgets/guide_dialog.dart';
import 'package:lucaszick/widgets/home_section.dart';
import 'package:lucaszick/widgets/section_contents/contact_content.dart';
import 'package:lucaszick/widgets/section_contents/me_content.dart';
import 'package:lucaszick/widgets/section_contents/skills_content.dart';

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
      floatingActionButtonLocation: _showBackToTopButton
          ? FloatingActionButtonLocation.endFloat
          : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _showBackToTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward_rounded),
            )
          : FloatingActionButton(
              onPressed: () => _showGuideDialog(context),
              child: const Icon(Icons.arrow_downward_rounded),
            ),
      body: SingleChildScrollView(
        controller: controller,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              HomeSection(
                title: "me_title".tr(),
                scrollKey: sectionKeys['me']!,
                spacer: 400,
                child: MeContent(),
              ),
              HomeSection(
                title: 'about_option'.tr(),
                scrollKey: sectionKeys['about']!,
                spacer: 100,
                child: AboutContent(),
              ),
              HomeSection(
                title: 'skills_option'.tr(),
                scrollKey: sectionKeys['skills']!,
                spacer: 100,
                child: const SkillsContent(),
              ),
              HomeSection(
                title: 'work_option'.tr(),
                scrollKey: sectionKeys['work']!,
                spacer: 100,
                child: const Text('work'),
              ),
              HomeSection(
                title: 'contact_option'.tr(),
                scrollKey: sectionKeys['contact']!,
                spacer: 0,
                child: ContactContent(),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SelectableText(
                    '© 2023 Lucas Alexandre Zick',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
