import 'package:flutter/material.dart';


class StartScreen extends StatelessWidget {

  const StartScreen(this.quizScreen, {super.key});

  final Function() quizScreen ;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(opacity: 0.5 ,
              child:Image.asset('assets/images/quiz-logo.png', width: 300,)),
          const SizedBox(height: 50,),
          const Text('Learn Flutter the fun way !!!',
          style: TextStyle(fontSize: 25 , color: Colors.white),),
          const SizedBox(height: 50,),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.deepPurple),
            onPressed: quizScreen,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz', style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}





































// import 'package:flutter/material.dart';
//
//
// class StartScreen extends StatelessWidget {
//
//   const StartScreen(this.startQuiz, {super.key}) ;
//
//   final Function() startQuiz ;
//
//   @override
//   Widget build(context) {
//     return Center(child:
//     Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//       Opacity(opacity: 0.5,
//       child : Image.asset('assets/images/quiz-logo.png',width: 300,),
//       ),
//       const SizedBox(height: 80,),
//       const Text('Learn Flutter the fun way !!!',
//       style: TextStyle(color: Colors.white, fontSize: 24),),
//       const SizedBox(height: 80,),
//       ElevatedButton.icon(
//         onPressed: startQuiz,
//        icon: const Icon(Icons.arrow_right_alt),
//        label: const Text('Start Quiz'),
//        // child: Text('Start Quiz', style: TextStyle(color: Colors.white,)),
//       )],
//     )) ;
//   }
// }