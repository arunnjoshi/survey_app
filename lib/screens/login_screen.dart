import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    // _formKey.currentState!.reset();
  }

  _phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    } else if (value.length != 10 || !RegExp(r"^[0-9]*$").hasMatch(value)) {
      return "Enter a valid phone number";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Container(
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
                      decoration: InputDecoration(labelText: 'Phone number'),
                      validator: (value) => _phoneValidator(value)),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () => _submit(), child: Text('Send Otp'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
