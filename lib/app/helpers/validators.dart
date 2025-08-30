class Validators {
  // Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    }
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  // Password Validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  // Confirm Password Validation
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Confirm password cannot be empty";
    }
    if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }

  // Name Validation
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name cannot be empty";
    }
    if (value.length < 3) {
      return "Name must be at least 3 characters long";
    }
    return null;
  }

  // Phone Number Validation
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number cannot be empty";
    }

    // Must start with +91
    if (!value.startsWith("+91")) {
      return "Phone number must start with +91";
    }

    // After +91, only 10 digits allowed
    final phoneRegex = RegExp(r'^\+91[0-9]{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return "Enter a valid phone number (+91 followed by 10 digits)";
    }

    return null;
  }

  // Generic Required Field Validator
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName cannot be empty";
    }
    return null;
  }
}
