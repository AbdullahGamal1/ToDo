import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/components/custom_form_field.dart';
import 'package:to_do_app/screens/register_Screen/register_screen.dart';

import '../dialog_utlis.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emaiLoginlControler = TextEditingController();

  var passwordLoginControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFDFECDB),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/SIGN IN – 1.png',
              ))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Login Screen',
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  //  U can use mediaQuery.Of().size.*3 example
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .25,
                    ),
                    CustomFormField(
                        controller: emaiLoginlControler,
                        lable: ' Email Adress ',
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Enter E_Mail";
                          }
                          var regex = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (!regex.hasMatch(text)) {
                            return "Please enter a valid Email";
                          }
                        }),
                    CustomFormField(
                        controller: passwordLoginControler,
                        lable: 'Password',
                        isPassword: true,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Enter Your Pssword";
                          }
                          if (text.length < 6) {
                            return "Password shoud at least 6 char  ";
                          }
                        }),
                    ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 8))),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RegisterScreen.routname);
                      },
                      child: Text('Dont Have Account'),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void isValidate() {
    formKey.currentState?.validate();
  }

  FirebaseAuth authServics = FirebaseAuth.instance;

  void login() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    try {
      var result = await authServics.signInWithEmailAndPassword(
          email: emaiLoginlControler.text,
          password: passwordLoginControler.text);
      DialogUtlis.showMessage(context, "Successful Registeration",
          postiveActionName: "OK");
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Wrong Email Or Password. ';
      DialogUtlis.showMessage(context, errorMessage, postiveActionName: "OK");
    } catch (e) {
      DialogUtlis.hideLoadingDialog(context);
      String errorMessage = 'Somthing went wrong.';
      DialogUtlis.showMessage(
        context,
        errorMessage,
        postiveActionName: "Try Again",
        postiveAction: () {
          login();
        },
      );
    }
  }
}
