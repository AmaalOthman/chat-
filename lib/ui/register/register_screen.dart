import 'package:chat/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../utils/format_email.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = ' register';
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          // image: DecorationImage(
          //   fit: BoxFit.fill,
          //   image: AssetImage('assets/images/Group_9672.png')
          // )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Creat Account',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(18),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    controller: fullNameController,
                    lableText: 'Full Name',
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter full name';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: userNameController,
                    lableText: 'User Name',
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter user name';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    lableText: 'Email',
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter email ';
                      }
                      if (!isEmailFormatter(input)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    lableText: 'Password',
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter password';
                      }
                      if (input.length < 6) {
                        return 'Password must be at least 6 character';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: passwordConfirmationController,
                    lableText: 'Password Confirmation',
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter password Confirmation';
                      }
                      if (input.length < 6) {
                        return 'Password must be at least 6 character';
                      }
                      if (input != passwordController.text) {
                        return 'Password no match';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        creatAccount();
                      },
                      child: Text('Creat Account'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void creatAccount() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}
