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
      if (error == _PasswordError.length) _errorMessage = 'Longitud entre 8 y 20 caracteres';
      if (error == _PasswordError.format) _errorMessage = 'Debe tener una mayúscula, un número y un caracter especial';
    } else {
      _errorMessage = null;
    }
  }

  bool equals(String password, String confirmPassword){
    if(password != confirmPassword){
      _isValid = false;
      _errorMessage = 'Las contraseñas no coinciden';
      return false;
    }
    _isValid = true;
    _errorMessage = null;
    return true;
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