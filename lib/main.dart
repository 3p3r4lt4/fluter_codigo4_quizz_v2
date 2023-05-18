import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_codigo4_quizz_v2/question_model.dart';
import 'package:flutter_codigo4_quizz_v2/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper =[];

  QuizBrain mandarina = QuizBrain();

  void checkAnswer(bool userPickAnswer){

    if(mandarina.isFinished()==true){
      Alert(
        context: context,
        type: AlertType.error,
        title: "RFLUTTER ALERT",
        desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: Text(
              "COOL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

      mandarina.restart();
      scoreKeeper.clear();
      setState(() {

      });

    }else{
      bool correctAnswer = mandarina.getQuestionAnswer();
      mandarina.nextQuestion();

      if (correctAnswer==userPickAnswer){
        scoreKeeper.add(Icon(Icons.check,color: Colors.greenAccent,),);
      }else{
        scoreKeeper.add(Icon(Icons.close,color: Colors.redAccent),);
      }
      setState(() {

      });

    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  mandarina.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.greenAccent,
                  child: Text("Verdadero"),
                  onPressed: (){

                    checkAnswer(true);


                    //print(correctAnswer);
                  },
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.redAccent,
                  child: Text("Falso"),
                  onPressed: (){

                    checkAnswer(false);
                  },
                ),
              ),
            ),

            Row(
              children: scoreKeeper,
            ),

          ],
        ),
      ),
    );
  }
}
