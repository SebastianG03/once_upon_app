import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 15,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Email",
                    icon: Icon(LineIcons.at)
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                    labelText: "Password",
                    icon: Icon(LineIcons.lock)
                ),
              ),
              const SizedBox(height: 15,),
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
              )
            ],
          )
      ),
    );;
  }
}
