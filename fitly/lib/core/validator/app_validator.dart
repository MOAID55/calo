class AppValidator {
  static final _emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

  static String? checkValidate(String name, String? val) {
    switch (name) {
      case "Email":
        if (val == null || val.isEmpty) {
          return "Email is invalid";
        }
        if (!_emailRegex.hasMatch(val.trim())) {
          return "Enter a valid email";
        }
        return null;

      case "Name":
        if (val == null || val.trim().isEmpty) {
          return "Name is required";
        }
        if (val.trim().length < 3) {
          return "Name must be at least 3 characters";
        }
        return null;
      case "Password":
        if (val == null || val.isEmpty) {
          return "Password is required";
        }
        if (val.length < 8) {
          return "Password must be at least 8 characters";
        }
        return null;
    }

    return null;
  }
}
