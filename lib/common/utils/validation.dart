bool validateNotEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  return true;
}

bool isEmailValid(String email) {
  final emailRegex = RegExp('^\\S+@\\S+\\.\\S+\$');

  if (emailRegex.hasMatch(email)) {
    return true;
  } else {
    return false;
  }
}

bool isPasswordValid(String email) {
  final passwordRegex = RegExp('(?=.*[0-9a-zA-Z]).{6,}');

  if (passwordRegex.hasMatch(email)) {
    return true;
  } else {
    return false;
  }
}
