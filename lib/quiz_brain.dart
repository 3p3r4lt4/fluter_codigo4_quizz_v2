
import 'package:flutter_codigo4_quizz_v2/question_model.dart';

class QuizBrain{

  List<Question> _questions =[
    Question(questionText: "El hombre llego a la luna?", questionAnswer: true),
    Question(questionText: "La tierra es plana?", questionAnswer: false),
    Question(questionText: "Ella te ama?", questionAnswer: false),
    Question(questionText: "Desayunaste?", questionAnswer: true),
  ];

  int _questionNumber =0;

  String getQuestionText(){
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer(){
    return _questions[_questionNumber].questionAnswer;
  }

  nextQuestion(){
    _questionNumber++;
  }
}