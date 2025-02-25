class validator {
  validator._(); // Private constructor

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailregExP = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailregExP.hasMatch(value)) { // ✅ Fixed condition
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatepassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be higher than 8 characters';
    }
    return null;
  }

  static String? validatePhonenumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegExP = RegExp(r'^\+?[1-9]\d{9,14}$');
    if (!phoneRegExP.hasMatch(value)) { // ✅ Fixed condition
      return 'Invalid phone number format (must be 10-15 digits)';
    }
    return null;
  }
}
