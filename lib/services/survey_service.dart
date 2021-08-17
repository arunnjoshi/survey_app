import 'package:survey_app/models/qa_model.dart';

class QuestionService {
  Future<List<QA>> getAllQuestions() async {
    return <QA>[
      QA(
          id: 1,
          question:
              "What embarrasses you the most and/or what’s been your most embarrassing moment?",
          index: 1),
      QA(
          id: 2,
          question:
              "Who do you look up to the most, and what qualities do you love about that person.",
          index: 2),
      QA(
          id: 3,
          question:
              " What would be your perfect day? Plan it out from waking up to bedtime.",
          index: 3),
      QA(id: 4, question: "What’s your biggest fear?", index: 4),
      QA(
          id: 5,
          question: "How do you like to be comforted when you’re sad or upset?",
          index: 5),
      QA(id: 6, question: "What’s your all-time favorite memory?", index: 6),
    ];
  }
}
