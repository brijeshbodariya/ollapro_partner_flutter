class Validation {
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
    if (value == null || value.isEmpty) {
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

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter Email';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid Email';
      else
        return null;
    }
  }

  String validatePhone(String value) {
    if (value == null || value.length != 13)
      return 'Enter mobile number including +91';
    else
      return null;
  }

  String validateAltPhone(String value) {
    if (value == null || value.length != 13)
      return 'Enter Alternate number including +91';
    else
      return null;
  }

  String validateFullName(String value) {
    if (value == null || value.isEmpty)
      return 'Enter Full name here';
    else
      return null;
  }

  String validateName(String value) {
    if (value == null || value.isEmpty)
      return 'Enter  name here';
    else
      return null;
  }

  String validateFirstName(String value) {
    if (value == null || value.isEmpty)
      return 'Enter First name here';
    else
      return null;
  }

  String validateLastName(String value) {
    if (value == null || value.isEmpty)
      return 'Enter Last name here';
    else
      return null;
  }

  String validateMiddleName(String value) {
    if (value == null || value.isEmpty)
      return 'Enter Middle name here';
    else
      return null;
  }

  String validateFatherName(String value) {
    if (value == null || value.isEmpty)
      return 'Enter Father name here';
    else
      return null;
  }

  String validateAddress1Name(String value) {
    if (value == null || value.isEmpty)
      return 'Enter Address1 name here';
    else
      return null;
  }

  String validateAddress2Name(String value) {
    if (value == null || value.isEmpty)
      return 'Enter Address2 name here';
    else
      return null;
  }

  String validateAddress3Name(String value) {
    if (value == null || value.isEmpty)
      return 'Enter Address3 name here';
    else
      return null;
  }

  String validatePlace(String value) {
    if (value == null || value.isEmpty)
      return 'Enter place here';
    else
      return null;
  }

  String validatePinCode(String value) {
    if (value == null || value.isEmpty)
      return 'Enter pincode here';
    else
      return null;
  }

  String validateAadhar(String value) {
    if (value == null || value.isEmpty)
      return 'Enter Aadhar number';
    else
      return null;
  }

  String validatePAN(String value) {
    if (value == null || value.isEmpty)
      return 'Enter PAN number';
    else
      return null;
  }

  String validateGST(String value) {
    if (value == null || value.isEmpty)
      return 'Enter GST number';
    else
      return null;
  }

  String validateBankName(String value) {
    if (value == null || value.isEmpty)
      return 'Enter Bank Name';
    else
      return null;
  }

  String validateAccount(String value) {
    if (value == null || value.isEmpty)
      return 'Enter Account number';
    else
      return null;
  }

  String validateReAccount(String value) {
    if (value == null || value.isEmpty)
      return 'Enter Re-Account number';
    else
      return null;
  }

  String validateIFSC(String value) {
    if (value == null || value.isEmpty)
      return 'Enter IFSC number';
    else
      return null;
  }

  String validateAccountHolderName(String value) {
    if (value == null || value.isEmpty)
      return 'Enter Account Holder Name';
    else
      return null;
  }
  String validateDob(String value) {
    if (value == null || value.isEmpty) {
      return 'Date of birth is empty';
    } else
      return null;
  }
}
