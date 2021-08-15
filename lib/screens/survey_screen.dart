import 'package:flutter/material.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({Key? key}) : super(key: key);
  static String routeName = "/survey";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Survey"),
      ),
      body: Center(child: Text("this is center text")),
    );
  }
}
