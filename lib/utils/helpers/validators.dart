String? password(String? pass) {
  if (pass != null && pass.trim().length > 5) {
    return null;
  } else {
    return "Invalid Password";
  }
}

String? email(String? email) {
  if (email != null &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+")
          .hasMatch(email.trim())) {
    return null;
  } else {
    return "Invalid Email";
  }
}
