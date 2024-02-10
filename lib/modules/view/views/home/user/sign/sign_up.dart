import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:once_upon_app/modules/view/widgets/components/home/user_register_form.dart';
import 'package:once_upon_app/modules/view/widgets/custom/input/inputs.dart';

import '../../../../../presenter/provider/providers.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> data = {
      "username": "",
      "email": "",
      "password": "",
    };

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String username = "";
    String email = "";
    String password = "";
    String confirmPassword = "";

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 50,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              UserRegisterForm(
                username: username,
                email: email,
                password: password,
                confirmPassword: confirmPassword,
                data: data,
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()) {
                      ref.read(generateUserProvider(data));
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                    child: Text(
                      "Sign Up",
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
          ),
        ),
      ),
    );
  }
}


