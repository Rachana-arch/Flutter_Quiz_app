import 'package:flutter/material.dart';
import 'package:adb_basic/start_screen.dart';
import 'package:adb_basic/question_screen.dart';
import 'package:adb_basic/questions.dart';
import 'package:adb_basic/result_screen.dart';

class Quiz extends StatefulWidget {

  @override
  State<Quiz> createState() {
    return _QuizState() ;
  }
}

class _QuizState extends State<Quiz> {

  var activeScreen  = 'start-screen';
  List<String> selectedAnswerList = [];

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen) ;
  //   super.initState();
  // }

  void switchScreen(){
    setState( () {
      activeScreen = 'question-screen' ;
    });
  }

  void chooseAnswer(String answer){
    selectedAnswerList.add(answer) ;
    print(selectedAnswerList.length);
    print('Rachana');
    if (selectedAnswerList.length == questions.length){
      setState( () {
        activeScreen = 'result-screen' ;
      });
    }
  }

  // void selectScreen(){
  //   if (activeScreen == 'start-screen'){
  //     screenWidget = StartScreen(switchScreen) ;
  //   }
  //   else if (activeScreen == 'start-screen'){
  //     screenWidget = QuestionScreen(onSelectedAnswer: chooseAnswer) ;
  //   }
  //   else{
  //     screenWidget =  ResultScreen();
  //   }
  // }


  @override
  Widget build(context) {
    Widget screenWidget  = StartScreen(switchScreen) ;
    if (activeScreen == 'question-screen'){
      screenWidget =QuestionScreen(onSelectedAnswer: chooseAnswer) ;
    }
    if (activeScreen == 'result-screen'){
      screenWidget = ResultScreen(chosenAnswer: selectedAnswerList, switchScreen) ;
      selectedAnswerList = [];
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient:
            LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 120, 15, 168),
              Colors.purpleAccent,
            ],
            ),
          ),
              // child:  activeScreen  == 'start-screen'
              //     ? StartScreen(switchScreen)
              //     : QuestionScreen(onSelectedAnswer: chooseAnswer),
          child:  screenWidget,
        ),
      ),
    );

  }

}
// import 'package:flutter/material.dart';
// import 'package:adb_basic/start_screen.dart';
// import 'package:adb_basic/question_screen.dart';
//
// class Quiz extends StatefulWidget {
//
//   const Quiz({super.key});
//
//   @override
//   State<Quiz> createState() {
//     return _QuizState() ;
//   }
//
// }
//
// class _QuizState extends State<Quiz> {
//
//   Widget? activeScreen  ;
//
//   @override
//   void initState() {
//     activeScreen = StartScreen(switchScreen);
//     super.initState();
//   }
//
//   void switchScreen(){
//     setState( (){
//       activeScreen = const QuestionScreen();
//     });
//   }
//
//   @override
//   Widget build(context) {
//     return MaterialApp(home:
//     Scaffold(
//       body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: <Color>[
//                   Color.fromARGB(255, 78, 13, 151),
//                   Color.fromARGB(255, 107, 15, 168)
//                 ]
//             ),
//           ),
//           child: activeScreen
//       ),
//     ),
//     );
//   }
// }