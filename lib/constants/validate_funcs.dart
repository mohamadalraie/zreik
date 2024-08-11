String? passwordValidator(String? value) {
  if (value!.isEmpty) {
    return "can't be empty";
  } else if (value.length < 8) {
    return "the password is wrong";
  } else {
    return null;
  }
}

String? emailValidator(String? value) {
  if (value!.isEmpty) {
    return "can't be empty";
  } else if (!value.contains('@')) {
    return "the email is wrong";
  } else {
    return null;
  }
}

String? emptyValidator(String? value) {
  if (value!.isEmpty) {
    return "can't be empty";
  } else {
    return null;
  }
}
