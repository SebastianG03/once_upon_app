import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:once_upon_app/modules/view/widgets/custom/input/inputs.dart';

import '../../../../presenter/provider/providers.dart';

class UserRegisterForm extends ConsumerStatefulWidget {
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  Map<String, dynamic> data;
  UserRegisterForm({
    super.key,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.data
  });

  _UserRegisterFormState createState() => _UserRegisterFormState();
}

class _UserRegisterFormState extends ConsumerState<UserRegisterForm> {

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormsModel(
          textInputType: TextInputType.name,
          labelText: "Username",
          icon: LineIcons.user,
          validator: (value) {
            final validateUsername = ref.read(usernameValidatorProvider.notifier).update((state) {
              state.validate(value: value!);
              return state;
            });
            return validateUsername.errorMessage;
          },
          onChanged: (value) {
            widget.username = value;
            widget.data["username"] = value;
          },
        ),
        const SizedBox(height: 10,),
        TextFormsModel(
          textInputType: TextInputType.emailAddress,
          labelText: "Email",
          icon: LineIcons.at,
          validator: (value) {
            final validateEmail = ref.read(emailValidatorProvider.notifier).update((state) {
              state.validate(value: value!);
              return state;
            });
            return validateEmail.errorMessage;
          },
          onChanged: (value) {
            widget.email = value;
            widget.data["email"] = value;
          },
        ),
        const SizedBox(height: 10,),
        PasswordFormsModel(
          textInputType: TextInputType.visiblePassword,
          label: "Password",
          onChanged: (value) {
            widget.password = value;
            widget.data["password"] = value;
          },
          validator: (value) {
            final validatePassword = ref.read(passwordValidatorProvider.notifier).update((state) {
              state.validate(value: value!);
              return state;
            });
            return validatePassword.errorMessage;
          },
          obscureText: obscurePassword,
          tap: _obscurePassword,
        ),
        const SizedBox(height: 10,),
        PasswordFormsModel(
          textInputType: TextInputType.visiblePassword,
          label: "Confirm Password",
          onChanged: (value) => widget.password = value,
          validator: (value) {
            final validateConfirmPassword = ref.read(confirmPasswordValidatorProvider.notifier).update((state) {
              state.validate(value: value!);
              final passwordValidated = ref.read(passwordValidatorProvider.notifier).state.isValid;
              if(passwordValidated) state.equals(widget.password, widget.confirmPassword);
              return state;
            });
            return validateConfirmPassword.errorMessage;
          },
          obscureText: obscureConfirmPassword,
          tap: _obscureConfirmPassword,
        ),
      ],
    );
  }

  void _obscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void _obscureConfirmPassword() {
    setState(() {
      obscureConfirmPassword = !obscureConfirmPassword;
    });
  }


}