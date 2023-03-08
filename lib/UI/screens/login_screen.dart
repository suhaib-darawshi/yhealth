import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:yhealth/UI/screens/signup_screen.dart';

import '../Widgets/CustomFormField.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> signinKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.language,
                  color: Colors.blue,
                ))
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: signinKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/imgs/yhealth.PNG',
                    alignment: Alignment.topCenter,
                    width: 300,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                      icon: const Icon(Icons.email),
                      validation: emailValidation,
                      label: 'Email',
                      controller: emailController),
                ),
                //  SizedBox(
                //   height: 20.h,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextField(
                      icon: const Icon(Icons.lock_open_sharp),
                      validation: passwordValidation,
                      textInputType: TextInputType.emailAddress,
                      isPassword: true,
                      label: 'Password',
                      controller: passwordController),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 8,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 1, color: Colors.blue)),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () async {},
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // ElevatedButton(
                //     onPressed: () async {
                //       String resp = await provider.logIn();
                //       if (resp == "ACCESSED") {
                //         Navigator.of(context).pushReplacementNamed("HomeScreen");
                //       } else {
                //         provider.clearTextFields();
                //         showDialog(
                //             context: context,
                //             builder: (context) {
                //               return AlertD(resp);
                //             });
                //       }
                //     },
                //     child: Text("Sign_in".tr())),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Dont have an account_?",
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white, elevation: 0),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return SignUpScreen();
                          }));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 23,
                            backgroundColor: Colors.white,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
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
