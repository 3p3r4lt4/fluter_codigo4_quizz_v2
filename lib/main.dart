import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_codigo4_quizz_v2/question_model.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> scoreKeeper =[];

  List<Question> questions =[
    Question(questionText: "El hombre llego a la luna?", questionAnswer: true),
    Question(questionText: "La tierra es plana?", questionAnswer: false),
    Question(questionText: "Ella te ama?", questionAnswer: false),
    Question(questionText: "Desayunaste?", questionAnswer: true),
  ];

    int questionNumber =0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff212121),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    questions[questionNumber].questionText,
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

                      bool correctAnswer = questions[questionNumber].questionAnswer;
                      questionNumber++;
                      if (correctAnswer==true){
                        scoreKeeper.add(Icon(Icons.check,color: Colors.greenAccent,),);
                      }else{
                        scoreKeeper.add(Icon(Icons.close,color: Colors.redAccent),);
                      }
                      setState(() {

                      });

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
                      questionNumber++;
                      scoreKeeper.add(Icon(Icons.close,color: Colors.redAccent),);
                      setState(() {

                      });
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
      ),
    );
  }
}
