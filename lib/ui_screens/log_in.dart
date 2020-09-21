import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:luuk/reusable_widgets/login_form.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: height,
            ),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Language English (South Africa)',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Welcome\nTo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey[700],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'l',
                          style: TextStyle(
                            fontFamily: 'Grandstander',
                            fontSize: 58,
                            color: Colors.blueAccent[100]
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'uu',
                                style: TextStyle(
                                    color: Colors.black,
                                    )),
                            TextSpan(
                                text: 'k',
                                style: TextStyle(
                                  color: Colors.blueAccent[100],
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      email(width),
                      password(width),
                      ButtonTheme(
                        minWidth: width * 0.75,
                        height: height * 0.08,
                        child: RaisedButton(
                          elevation: 0.0,
                          color: Color(0xFF110C11),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                            }
                          },
                          child:
                          Text('Log In', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'forgot your login details? ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Reset your password.',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // single tapped
                                  },
                                style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.network(
                              'https://www.facebook.com/images/fb_icon_325x325.png',
                              height: 25,
                              width: 25),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Login as ',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueAccent[200],
                                fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '@SarahStylish_za',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // single tapped
                                    },
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ]),
                    ]),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[600],
                    blurRadius: 2.5,
                    offset: Offset(-7.5, 0)),
              ],
            ),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Sign up here.',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            /// Function
                          },
                        style: TextStyle(
                            color: Color(0xFF110C11),
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget email(double width) => LogInForm(
      width: width,
      hintText: "username, email or Phone number",
      onSubmit: (String value){
        print(value);
      },
      onValidator: (String value){
        return
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) ?
          null : 'Enter valid EmailAddress';
      }
  );

  Widget password(double width) => LogInForm(
      width: width,
      hintText: "password",
      onSubmit: (String value){
        print(value);
      },
      onValidator:  (String value){
        return value.length > 8
            ? null
            : 'Password must contain 8 characters';
      },
    );

}

