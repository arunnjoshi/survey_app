import 'package:flutter/material.dart';
import 'package:survey_app/models/qa_model.dart';
import 'package:survey_app/services/survey_service.dart';
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
  var service = new QuestionService();
  List<QA> questions = [];
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
    FocusScope.of(context).unfocus();
  }

  setFromValues(QA qa) {
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
    service
        .getAllQuestions()
        .then((value) => questions = value)
        .catchError((e) => values = []);

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
              ...questions.map((q) => Question(q, setFromValues)).toList(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: _submitForm, child: Text('Submit')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
