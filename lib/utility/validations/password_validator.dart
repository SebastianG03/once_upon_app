enum _PasswordError { empty, length, format }

class PasswordValidator {
  String? _errorMessage = '';
  bool _isValid = false;

  static final RegExp passwordRegex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#$%^&*(),.?":{}|<>])(?=.*?\d)');

  void validate({String value = ''}) {
    _PasswordError? error = _validator(value);

    if (error != null) {
      if (error == _PasswordError.empty) _errorMessage = 'El campo es requerido';
      if (error == _PasswordError.length) _errorMessage = 'La contraseña debe tener entre 8 y 20 caracteres';
      if (error == _PasswordError.format) _errorMessage = 'La contraseña debe tener al menos una mayúscula, un número y un caracter especial';
    } else {
      _errorMessage = null;
    }
  }

  _PasswordError? _validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      _isValid = false;
      return _PasswordError.empty;
    }
    if (value.length < 8 || value.length > 32) {
      _isValid = false;
      return _PasswordError.length;
    }
    if(!passwordRegex.hasMatch(value)){
      _isValid = false;
      return _PasswordError.format;
    }
    _isValid = true;
    return null;
  }

  String? get errorMessage => _errorMessage;
  bool get isValid => _isValid;
}