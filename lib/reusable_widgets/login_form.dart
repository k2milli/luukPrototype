import 'package:flutter/material.dart';

class LogInForm extends StatefulWidget {

  final double width;
  final String hintText;
  final Function onSubmit;
  final Function onValidator;

  const LogInForm({
    @required this.width,
    @required this.hintText,
    @required this.onSubmit,
    @required this.onValidator
  });

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.75,
      padding: EdgeInsets.all(2.5),
      child: TextFormField(
        style: TextStyle(
            fontSize: 24
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),

          filled: true,
          fillColor: Colors.grey[300],

          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey[800],
          ),

          errorStyle: TextStyle(
            fontSize: 15,
          ),

          border: InputBorder.none,
        ),

        onSaved: (String value) {
          if(value != null) widget.onSubmit(value);
        },

        validator: (String value) {
          return widget.onValidator(value);
        },
      ),
    );
  }
}
