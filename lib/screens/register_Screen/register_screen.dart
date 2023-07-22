import 'package:flutter/material.dart';
import 'package:to_do_app/screens/components/custom_form_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String routname = "RegisterScreen";
  var formKey = GlobalKey<FormState>();
  var nemeControler = TextEditingController();
  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();
  var confirmPasswordControler = TextEditingController();

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
          title: Text(
            'Register Screen',
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
                      controller: nemeControler,
                      lable: 'Full Name ',
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Full Name";
                        }
                      },
                    ),
                    CustomFormField(
                        controller: emailControler,
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
                        controller: passwordControler,
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
                    CustomFormField(
                      controller: confirmPasswordControler,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Confirm Your Pssword";
                        }
                        if (text != passwordControler.text) {
                          return "Password dosn't match  ";
                        }
                      },
                      lable: ' Confirm Password  ',
                      isPassword: true,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          register();
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 8)))
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    formKey.currentState?.validate();
  }
}
// var formKey = GlobalKey<FormState>();
//wrap Coulmn Witt Form  and give it this key

//  void register(){
//     formKey.currentState?.validate();
//   }
