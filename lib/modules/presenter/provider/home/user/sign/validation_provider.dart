import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:once_upon_app/utility/validations/validations.dart';


final emailValidatorProvider = StateProvider.autoDispose<EmailValidator>((ref) {
  return EmailValidator();
});

final passwordValidatorProvider = StateProvider.autoDispose<PasswordValidator>((ref) {
  return PasswordValidator();
});

final confirmPasswordValidatorProvider = StateProvider.autoDispose<PasswordValidator>((ref) {
  return PasswordValidator();
});

final usernameValidatorProvider = StateProvider.autoDispose<UsernameValidator>((ref) {
  return UsernameValidator();
});