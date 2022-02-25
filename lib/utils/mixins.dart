mixin InputValidationMixin {
  bool isFirstName(String firstname) => firstname.isNotEmpty;
  bool isLastName(String lastname) => lastname.isNotEmpty;
  bool isUsername(String username) => username.isNotEmpty;

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }

  bool isPhone(String phone) => phone.length == 10;
  bool isLoginPasswordValid(String password) => password.length > 7;
  bool isSignUpPasswordValid(String password) => password.length > 7;

  bool isSchoolName(String schoolname) =>
      schoolname.isNotEmpty && schoolname.length > 7;
}
