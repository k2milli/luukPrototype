import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:luuk/repository/firebase_auth_repository.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

extension on String {
  num toIntFromString() {
    return int.parse(this);
  }
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _auth = Provider.of<FirebaseAuthRepository>(context);
    return Scaffold(
      resizeToAvoidBottomPadding:
          false, // prevents overflow (resize the widgets)
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RichText(
                text: TextSpan(
                  text: 'l',
                  style: TextStyle(
                      color:
                          Color(int.parse('#20B2AA	'.replaceAll('#', '0xff'))),
                      fontSize: 60,
                      fontFamily: 'Citrica'),
                  children: <TextSpan>[
                    TextSpan(text: ' u', style: TextStyle(color: Colors.black)),
                    TextSpan(text: ' u', style: TextStyle(color: Colors.black)),
                    TextSpan(
                      text: ' k',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text('Sign Up', style: TextStyle(color: Colors.black, fontSize: 25)),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Field(
                    value: "Name and Surname*",
                    controller: _fullNameController),
                SizedBox(
                  height: 10,
                ),
                Field(
                    value: "Phone Number*",
                    keyboardType: TextInputType.phone,
                    controller: _phoneNumberController),
                SizedBox(
                  height: 10,
                ),
                Field(value: "Email Address*", controller: _emailController),
                SizedBox(
                  height: 10,
                ),
                FieldTwo(value: "Password*", controller: _pass),
                SizedBox(
                  height: 10,
                ),
                FieldThree(
                    value: "Re-Type Password*",
                    controllerone: _pass,
                    controllertwo: _confirmPass),
              ],
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 100) * 70,
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _auth
                      .registerAndSaveCreds(
                          email: _emailController.text,
                          fullName: _fullNameController.text,
                          password: _confirmPass.text,
                          phoneNumber:
                              int.tryParse(_phoneNumberController.text))
                      .then((value) => print("Done"));
                }
              },
              color: Colors.black,
              child: Text(
                "Create account",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
          Center(
              child: Text(
            "OR",
            style: TextStyle(fontSize: 20),
          )),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 100) * 70,
            child: RaisedButton.icon(
              onPressed: () {
                print("Facebook Created");
              },
              color: Color(int.parse('#4267B2'.replaceAll('#', '0xff'))),
              icon: Icon(
                Entypo.facebook_circled,
                color: Colors.white,
              ),
              label: Text(
                "Continue with facebook",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 100) * 70,
            child: GoogleSignInButton(
              onPressed: () {
                _auth.googleSignIn(
                    phoneNumber: _phoneNumberController.text.toIntFromString());
              },
              darkMode: true,
              textStyle: TextStyle(
                  fontSize: 17, color: Colors.white), // default: false
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: (MediaQuery.of(context).size.width / 100) * 0.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?",
                  style: TextStyle(
                    fontSize: (MediaQuery.of(context).size.width / 100) * 4,
                    color: Colors.black,
                  )),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  print("Log In");
                  _auth.signOut().then((value) => print("name"));
                },
                child: Text(
                  "Log In.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: (MediaQuery.of(context).size.width / 100) * 4,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Field extends StatelessWidget {
  final value;
  final TextInputType keyboardType;
  final TextEditingController controller;
  Field(
      {this.value,
      this.keyboardType = TextInputType.emailAddress,
      @required this.controller});
  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: (MediaQuery.of(context).size.width / 100) * 70,
        child: Container(
          color: Colors.grey[200],
          child: TextFormField(
            // autofocus: true,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: value,
              contentPadding: EdgeInsets.all(5),
              border: InputBorder.none,
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Text is empty';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}

class FieldTwo extends StatelessWidget {
  final value, controller;
  @override
  FieldTwo({this.value, this.controller});

  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: (MediaQuery.of(context).size.width / 100) * 70,
        child: Container(
          color: Colors.grey[200],
          child: TextFormField(
            obscureText: true,
            controller: controller,
            decoration: InputDecoration(
              hintText: value,
              contentPadding: EdgeInsets.all(5),
              border: InputBorder.none,
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Text is empty';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}

class FieldThree extends StatelessWidget {
  final value, controllerone, controllertwo;
  @override
  FieldThree({this.value, this.controllerone, this.controllertwo});

  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: (MediaQuery.of(context).size.width / 100) * 70,
        child: Container(
          color: Colors.grey[200],
          child: TextFormField(
            obscureText: true,
            controller: controllertwo,
            decoration: InputDecoration(
              hintText: value,
              contentPadding: EdgeInsets.all(5),
              border: InputBorder.none,
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Text is empty';
              }
              if (text != controllerone.text) {
                return 'Passwords Not Matching';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
