class Validation{
  String validatePassword(String value) {
    Pattern UPPER = ("[A-Z]");
    Pattern LOWER = ("[a-z]");
    Pattern NUMBER = ("[0-9]");
    Pattern Character = ("[!@#\$&*~]");

    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regex = new RegExp(pattern);
    RegExp regex1 = new RegExp(UPPER);
    RegExp regex2 = new RegExp(LOWER);
    RegExp regex3 = new RegExp(NUMBER);
    RegExp regex4 = new RegExp(Character);
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
//      if (!regex.hasMatch(value))
//        return 'Your password is invalid. Please try again.';
      if (!regex1.hasMatch(value))
        return 'Password must contain at least one upper case letter';
      if (!regex2.hasMatch(value))
        return 'Password must contain at least one lower case letter';
      if (!regex3.hasMatch(value))
        return 'Password must contain at least one digit';
      if (!regex4.hasMatch(value))
        return 'Password must contain at least one Special Character';
      if (!regex.hasMatch(value))
        return 'Password must be at least 6 characters long';
      else
        return null;
    }
  }
}