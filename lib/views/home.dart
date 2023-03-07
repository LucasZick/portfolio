import 'package:flutter/material.dart';
import 'package:lucaszick/widgets/about_content.dart';
import 'package:lucaszick/widgets/guide_dialog.dart';
import 'package:lucaszick/widgets/home_section.dart';
import 'package:lucaszick/widgets/me_content.dart';
import 'package:lucaszick/widgets/skills_content.dart';

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
    controller.dispose(); // dispose the controller
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
                _showBackToTopButton = true; // show the back-to-top button
              } else {
                _showBackToTopButton = false; // hide the back-to-top button
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
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: "",
      ),
      drawer: BaseDrawer(sectionKeys: sectionKeys),
      floatingActionButtonLocation: _showBackToTopButton
          ? FloatingActionButtonLocation.endFloat
          : FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _showBackToTopButton
            ? _scrollToTop
            : () => _showGuideDialog(context),
        child: Icon(
          _showBackToTopButton
              ? Icons.arrow_upward_rounded
              : Icons.arrow_downward_rounded,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              HomeSection(
                title: "Hi! I'm\nLucas Zick,",
                scrollKey: sectionKeys['me']!,
                spacer: 400,
                child: const MeContent(),
              ),
              HomeSection(
                title: 'About',
                scrollKey: sectionKeys['about']!,
                spacer: 100,
                child: const AboutContent(),
              ),
              HomeSection(
                title: 'Skills',
                scrollKey: sectionKeys['skills']!,
                spacer: 100,
                child: const SkillsContent(),
              ),
              HomeSection(
                title: 'Work',
                scrollKey: sectionKeys['work']!,
                spacer: 100,
                child: const Text('work'),
              ),
              HomeSection(
                title: 'Contact',
                scrollKey: sectionKeys['contact']!,
                spacer: 0,
                child: const Text('contact'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
