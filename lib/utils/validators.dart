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
      return 'Please enter your name';
    }
    if (input.length > 30) {
      return 'Your name is too big, try writing it in a shorter way';
    }
    if (!Validators._isLettersOnly(input)) {
      return 'Your name must contain only letters and name characteres';
    }
    if (!Validators._hasLetters(input)) {
      return 'Your name must contain at least one letter';
    }
    return null;
  }

  static String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter your e-mail';
    }
    if (input.length > 320) {
      return 'Your e-mail exceeds the character limit of e-mail addresses';
    }
    if (!Validators._hasLetters(input)) {
      return 'Your e-mail must contain at least one letter';
    }
    if (!Validators._isValidEmail(input)) {
      return 'Invalid e-mail';
    }
    return null;
  }

  static String? validateMessage(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter some message';
    }
    if (input.length > 2000) {
      return 'Your message exceeds the character limit, try writing it in a shorter way';
    }
    if (!Validators._hasLetters(input)) {
      return 'Your message must contain at least one letter';
    }
    return null;
  }
}
