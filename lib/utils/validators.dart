class Validators {
  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
//    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static final RegExp _phoneRegExp = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
 static final RegExp _nameRegExp= RegExp(
     r'^[a-z A-Z,.\-]+$');


  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static isValidPhone(String phone) {
    return _phoneRegExp.hasMatch(phone);
  }

  static isNameValid(String name) {
    return _nameRegExp.hasMatch(name);
  }
  


}
