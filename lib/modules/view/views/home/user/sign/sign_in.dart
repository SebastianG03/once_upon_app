import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:once_upon_app/modules/presenter/provider/home/user/sign/validation_provider.dart';
import 'package:once_upon_app/modules/view/widgets/custom/input/inputs.dart';



class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 30,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 15,),
                TextFormsModel(
                  textInputType: TextInputType.emailAddress,
                  labelText: "Email",
                  icon: LineIcons.at,
                  validator: (value) {
                    final validateEmail = ref.read(emailValidatorProvider.notifier).update((state) {
                      state.validate(value: value!);
                      return state;
                    });
                    print(value);
                    print(validateEmail.errorMessage);
                    return validateEmail.errorMessage;
                  },
                  onChanged: (value) => email = value,
                ),
                const SizedBox(height: 15,),
                PasswordFormsModel(
                  textInputType: TextInputType.visiblePassword,
                  label: "Password",
                  onChanged: (value) => password = value,
                  validator: (value) {
                    final validatePassword = ref.read(passwordValidatorProvider.notifier).update((state) {
                      state.validate(value: value!);
                      return state;
                    });
                    print(value);
                    print(validatePassword.errorMessage);
                    return validatePassword.errorMessage;
                  },
                  obscureText: _obscureText,
                  tap: _obscurePassword,
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: (){
                      print("Sign In");
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  void _obscurePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

}
