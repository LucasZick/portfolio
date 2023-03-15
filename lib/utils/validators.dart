import 'package:easy_localization/easy_localization.dart';

class Validators {
  static bool _isLettersOnly(input) {
    return RegExp(r'^[A-Za-z. ]+$').hasMatch(input);
  }

  static bool _hasLetters(input) {
    return RegExp(r'(.*[a-zA-Z].*)').hasMatch(input);
  }

  static bool _isValidEmail(input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }

  static String? validateName(String? input) {
    if (input == null || input.isEmpty) {
      return "validator_empty_name".tr();
    }
    if (input.length > 30) {
      return "validator_big_name".tr();
    }
    if (!Validators._isLettersOnly(input)) {
      return "validator_only_valid_characters_name".tr();
    }
    if (!Validators._hasLetters(input)) {
      return "validator_needs_letter_name".tr();
    }
    return null;
  }

  static String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return "validator_empty_email".tr();
    }
    if (input.length > 320) {
      return "validator_big_email".tr();
    }
    if (!Validators._hasLetters(input)) {
      return "validator_needs_letter_email".tr();
    }
    if (!Validators._isValidEmail(input)) {
      return "validator_invalid_email".tr();
    }
    return null;
  }

  static String? validateMessage(String? input) {
    if (input == null || input.isEmpty) {
      return "validator_empty_message".tr();
    }
    if (input.length > 2000) {
      return "validator_big_message".tr();
    }
    if (!Validators._hasLetters(input)) {
      return "validator_needs_letter_message".tr();
    }
    return null;
  }
}
