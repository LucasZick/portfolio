import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MeContent extends StatelessWidget {
  const MeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Text(
        "me_phrase".tr(),
        style: const TextStyle(
          fontSize: 30,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
