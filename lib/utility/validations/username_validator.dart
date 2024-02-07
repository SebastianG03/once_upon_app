enum UsernameError { empty, invalid, length }

class UsernameValidator {
  String? _errorMessage = '';
  bool _isValid = false;

  static final RegExp nameRegex = RegExp(r'^[a-zA-Z0-9]+$');

  void validate({String value = ''}) {
    UsernameError? error = _validator(value);

    if (error != null) {
      if (error == UsernameError.empty) _errorMessage = 'El campo es requerido';
      if (error == UsernameError.invalid) {
        _errorMessage = 'El nombre es inválido, debe tener letras y/o números';
      }
      if (error == UsernameError.length) {
        _errorMessage = 'El nombre debe tener entre 6 y 20 caracteres';
      }
    } else {
      _errorMessage = null;
    }
  }

  UsernameError? _validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      _isValid = false;
      return UsernameError.empty;
    }
    if (!nameRegex.hasMatch(value)) {
      _isValid = false;
      return UsernameError.invalid;
    }
    if (value.length < 6 || value.length > 20) {
      _isValid = false;
      return UsernameError.length;
    }
    _isValid = true;
    return null;
  }

  String? get erroMessage => _errorMessage;
  bool get isValid => _isValid;
}