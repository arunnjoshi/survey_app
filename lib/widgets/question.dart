import 'package:flutter/material.dart';
import 'package:survey_app/widgets/answer.dart';
import '../models/qa_model.dart';

class Question extends StatelessWidget {
  final QA qa;
  final Function setFromValues;
  const Question(this.qa, this.setFromValues, {Key? key}) : super(key: key);

  onfieldChange(String? val) {
    qa.answer = val;
    setFromValues(qa);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            '${qa.index} Q. ${qa.question}',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          padding: EdgeInsets.all(10),
        ),
        Answer(
          onfieldChange,
        )
      ],
    );
  }
}
