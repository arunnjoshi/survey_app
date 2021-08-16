import 'package:flutter/material.dart';
import 'package:survey_app/models/qa_model.dart';

class Answer extends StatelessWidget {
  final Function onfieldChange;
  const Answer(this.onfieldChange, {Key? key}) : super(key: key);
  _ansValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    } else if (value.trim().length < 3) {
      return "Please type atleast 3 characters";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(labelText: 'Your Answer.'),
        validator: (value) => _ansValidator(value),
        onChanged: (val) => onfieldChange(val),
      ),
    );
  }
}
