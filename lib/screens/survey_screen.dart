import 'package:flutter/material.dart';
import 'package:survey_app/models/qa_model.dart';
import 'package:survey_app/widgets/question.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);
  static String routeName = "/survey";

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  List<QA> values = [];
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    values = [];
    super.initState();
  }

  _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    for (var v in values) {
      print('${v.id} ${v.question} ${v.answer} ${v.index}');
    }
  }

  setFromValues(QA qa) {
    var b = values;
    if (values.any((element) => element.id == qa.id)) {
      var id = values.indexWhere((element) => element.id == qa.id);
      values[id] = qa;
    } else {
      values.add(qa);
    }
    setState(() {
      values = values;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Survey"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Question(
                QA(
                    answer: "",
                    id: 1,
                    index: 1,
                    question:
                        "this is a long question for us this is a long question for us this is a long question for us this is a long question for us this is a long question for us this is a long question for us",),
                setFromValues,
                key: ValueKey(1),
              ),
              Question(QA(answer: "", id: 2, index: 2, question: "Yo2"),
                  setFromValues,
                  key: ValueKey(2)),
              ElevatedButton(onPressed: _submitForm, child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
