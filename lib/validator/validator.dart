abstract class Validator {
  String? passwordValidator(String? val);

  String? nameValidator(String? val);
}

class SimpleValidator extends Validator {
  @override
  String? nameValidator(String? val) {
    if (val == null) {
      return "login must not be empty";
    }
    if (val.trim().isEmpty) {
      return "login must not be empty";
    }
    if ((val.length < 3)) {
      return "login must be more than 3 characters";
    }
    if (val.length > 31) {
      return "login must be shorter than 31 characters";
    }
    if (val.contains(' ')) {
      return "login must not contain spaces";
    }
    return null;
  }

  @override
  String? passwordValidator(String? val) {
    if (val == null) {
      return "you must enter a password";
    }
    if (val.length < 8) {
      return "password length at least 8 characters";
    }
    if (!val.contains(RegExp(r'^(.*?[A-Z])'))) {
      return "password must contain uppercase characters";
    }
    if (!val.contains(RegExp(r'^(.*?[a-z])'))) {
      return "password must contain lowercase characters";
    }
    if (!val.contains(RegExp(r'^(.*?[0-9])'))) {
      return "password must contain digits";
    }
    if (!val.contains(RegExp(r'^(.*?[!@#\$&*~])'))) {
      return "password must contain special symbols";
    }
    return null;
  }
}
