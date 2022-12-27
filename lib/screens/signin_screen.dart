import 'package:chat_app/providers/auth_provider.dart';
import 'package:chat_app/screens/registratoin_screen.dart';
import 'package:chat_app/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 180,
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/3073/3073455.png'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonTextField(
                  title: 'Enter your Email',
                  type: TextInputType.emailAddress,
                  controller: provider.loginEmailController,
                ),
                ButtonTextField(
                  title: 'Enter your Password',
                  type: TextInputType.visiblePassword,
                  controller: provider.loginPassWordController,
                ),
                MyButton(
                    color: Colors.yellow[900]!,
                    title: 'signIn',
                    onpressed: () {
                      bool isvalid = formkey.currentState!.validate();
                      if (isvalid) {
                        provider.login();
                      }
                    })
              ],
            ),
          ),
        );
      }),
    );
  }
}
