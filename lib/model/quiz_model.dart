// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class QuestionModel {
//   String question;
//   List<String> answer;
//   List<int> correct;
//   QuestionModel({
//     required this.question,
//     required this.answer,
//     required this.correct,
//   });
// }

// QuestionModel question1 = QuestionModel(
//   question: "how are you?",
//   answer: ["not bad", "good", "tierd"],
//   correct: [0, 1],
// );

// List<QuestionModel> quiz = [question1];

class QuestionModel {
  String question;
  int time;
  List<AnswerModel> answerModel;
  QuestionModel({
    required this.question,
    required this.time,
    required this.answerModel,
  });
}

class AnswerModel {
  String answer;
  int socre;
  bool isCorrect;
  AnswerModel({
    required this.answer,
    required this.socre,
    required this.isCorrect,
  });
}

List<QuestionModel> quiz = [
  QuestionModel(
    time: 20,
    question: 'how old are you?',
    answerModel: [
      AnswerModel(answer: '25', socre: 10, isCorrect: true),
      AnswerModel(answer: '30', socre: 0, isCorrect: false),
      AnswerModel(answer: '40', socre: 0, isCorrect: false),
    ],
  ),
  QuestionModel(
    time: 20,
    question: 'what is best phone?',
    answerModel: [
      AnswerModel(answer: 'samsung', socre: 10, isCorrect: true),
      AnswerModel(answer: 'iphone', socre: 0, isCorrect: false),
      // AnswerModel(answer: '0', socre: 0, isCorrect: false),
    ],
  ),
  QuestionModel(
    time: 20,
    question: 'What is best car?',
    answerModel: [
      AnswerModel(answer: 'Audi', socre: 10, isCorrect: true),
      AnswerModel(answer: 'Kia', socre: 0, isCorrect: false),
      AnswerModel(answer: 'BMW', socre: 0, isCorrect: false),
      AnswerModel(answer: 'GMC', socre: 0, isCorrect: false),
    ],
  ),
];
