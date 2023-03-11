import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/configs.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;

  BaseAppBar({
    Key? key,
    required this.title,
    required this.appBar,
  }) : super(key: key);

  final List<DropdownMenuItem> languageOptions = [
    DropdownMenuItem(
      value: 'br',
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: CircleFlag('br'),
      ),
    ),
    DropdownMenuItem(
      value: 'gb',
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: CircleFlag('gb'),
      ),
    ),
    DropdownMenuItem(
      value: 'de',
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: CircleFlag('de'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Configs configsProvider = Provider.of<Configs>(context, listen: true);
    return AppBar(
      title: Text(title),
      actions: [
        DropdownButton(
          items: languageOptions,
          underline: const SizedBox(),
          focusColor: Colors.transparent,
          onChanged: (lang) {
            configsProvider.changeLanguage = lang;
          },
          value: configsProvider.language,
        ),
        TextButton(
          onPressed: configsProvider.invertDarkMode,
          child: Icon(
            configsProvider.isDark
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
