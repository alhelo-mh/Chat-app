import 'package:chat_app/providers/auth_provider.dart';
import 'package:chat_app/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrScreen extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return Form(
          key: formkey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: SingleChildScrollView(
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
                      title: 'Enter your FlluNane',
                      type: TextInputType.name,
                      controller: provider.regsterfnameController,
                     
                    ),
                    ButtonTextField(
                      title: 'Enter your Email',
                      type: TextInputType.emailAddress,
                      controller: provider.regsterEmailController,
                      
                    ),
                    ButtonTextField(
                      title: 'Enter your phone',
                      type: TextInputType.phone,
                      controller: provider.regsterphoneController,
                      
                    ),
                    ButtonTextField(
                      title: 'Enter your Password',
                      type: TextInputType.visiblePassword,
                      controller: provider.regsterPassWordController,
                     
                    ),
                    MyButton(
                        color: Colors.blue[900]!,
                        title: 'register',
                        onpressed: () {
                          bool isvalid = formkey.currentState!.validate();
                          if (isvalid) {
                            provider.register();
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ButtonTextField extends StatelessWidget {
  final String title;
  final TextInputType type;

  final TextEditingController controller;

  ButtonTextField(
      {required this.title,
      required this.type,
      required this.controller,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
         validator: (value) {
                        if (value!.isEmpty) {
                          return 'User firstName must be empty';
                        }
                        return null;
                      },
        controller: controller,
        textAlign: TextAlign.center,
        onChanged: (value) {},
        keyboardType: type,
        decoration: InputDecoration(
          label: Text(title),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
