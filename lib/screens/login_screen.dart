import 'package:flutter/material.dart';

import 'survey_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formKey = GlobalKey<FormState>();
  var displayOtp = false;
  late FocusNode otpFocus;
  @override
  void initState() {
    super.initState();
    displayOtp = false;
    otpFocus = FocusNode();
  }

  @override
  void dispose() {
    otpFocus.dispose();
    super.dispose();
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    setState(() {
      displayOtp = true;
    });
  }

  _phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    } else if (value.length != 10 || !RegExp(r"^[0-9]*$").hasMatch(value)) {
      return "Enter a valid phone number";
    }
    return null;
  }

  _otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required.";
    } else if (value.length != 4 || !RegExp(r"^[0-9]*$").hasMatch(value)) {
      return "Enter a valid OTP.";
    }
    return null;
  }

  _otpSubmit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    FocusScope.of(context).unfocus();
    Navigator.pushReplacementNamed(context, SurveyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  "Welcome to survey app",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(labelText: 'Phone number'),
                      validator: (value) => _phoneValidator(value),
                      readOnly: displayOtp,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    displayOtp
                        ? Container(
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      labelText: 'Demo 4 digit otp'),
                                  validator: (value) => _otpValidator(value),
                                  autofocus: true,
                                  focusNode: otpFocus,
                                ),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                    ElevatedButton(
                        onPressed: () => displayOtp ? _otpSubmit() : _submit(),
                        child: Text('Submit'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
