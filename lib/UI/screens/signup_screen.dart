
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/CustomFormField.dart';
import 'package:string_validator/string_validator.dart';
class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  GlobalKey<FormState> signupKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (() {
                
              }),
              icon: const Icon(
                Icons.language,
                color: Colors.blue,
              ))
        ],
        leading: IconButton(
            onPressed: () =>Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            )),
        backgroundColor:  Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Form(
            key: signupKey,
            child: Column(
              children: [
                Container(
                  width: 300,
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/imgs/yhealth.PNG',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                      icon: const Icon(Icons.email),
                      validation: emailValidation,
                      label: 'Email',
                      controller: emailController),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                      icon: Icon(
                        Icons.abc,
                        color:  Colors.black,
                      ),
                      validation: (v) => requiredValidation(v ?? ''),
                      label: "First Name",
                      controller: firstnameController),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                      icon: Icon(
                        Icons.abc,
                        color:  Colors.black,
                      ),
                      validation: (v) => requiredValidation(v ?? ''),
                      label: "Last Name",
                      controller: lastnameController),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                      icon: Icon(
                        Icons.lock_open,
                        color: Colors.black,
                      ),
                      validation: (v) => passwordValidation(v ?? ''),
                      label: "Password",
                      controller: passwordController),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                      icon: Icon(
                        Icons.lock_open,
                        color: Colors.black,
                      ),
                      validation: (v) => passwordValidation(v ?? ''),
                      label: "Confirm Password",
                      controller: confirmPasswordController),
                ),
                ElevatedButton(
                    onPressed: () async {},
                    style: TextButton.styleFrom(
                        backgroundColor:
                            Colors.white,
                        elevation: 0),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 23,
                          backgroundColor: Colors.white),
                    )),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        )
      ,
      backgroundColor: Colors.white,
    );
  }
}
 String? passwordValidation(String password) {
    if (password == null || password.isEmpty) {
      return "Required field";
    } else if (password.length <= 6) {
      return 'Error, the password must be larger than 6 letters';
    }
  }
  String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return 'Required field';
    } else if (!isEmail(email)) {
      return 'Enter A valid Email';
    }
  }

  String? requiredValidation(String content) {
    if (content == null || content.isEmpty) {
      return "Required field";
    }
  }

  String? phoneValidation(String? content) {
    if (content == null || content.isEmpty) {
      return 'Required field';
    }
    if (!isNumeric(content)) {
      return "InCorrect phone number syntax";
    }
  }

  