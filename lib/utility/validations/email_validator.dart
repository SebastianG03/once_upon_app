enum _EmailError { empty, invalid }

class EmailValidator {
  String? _errorMessage = '';
  bool _isValid = false;

  static final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  void validate({String value = ''}) {
    _EmailError? error = _validator(value);

    if (error != null) {
      if (error == _EmailError.empty) _errorMessage = 'El campo es requerido';
      if (error == _EmailError.invalid) _errorMessage = 'El correo no es válido';
    } else {
      _errorMessage = null;
    }
  }

  _EmailError? _validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      _isValid = false;
      return _EmailError.empty;
    }
    if (!emailRegex.hasMatch(value)) {
      _isValid = false;
      return _EmailError.invalid;
    }
    _isValid = true;
    return null;
  }

  String? get erroMessage => _errorMessage;
  bool get isValid => _isValid;
}