import 'package:flutter/material.dart';
import 'package:adb_basic/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget{

  const QuestionScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer ;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen>{

  var currentQuestionIndex = 0 ;

  void answerQuestion(String answer){
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionIndex++ ;
    });
  }

  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex] ;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.question,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            )),
            const SizedBox(height: 30,),
            ...currentQuestion.getShuffledAnswer().map((answer){    // ... pull the list data  , convert widget from string
              return AnswerButton(answerText: answer, onTap: () {answerQuestion(answer);},);
            })
          ],
        ),
      ),
    );
  }
}

class AnswerButton extends StatelessWidget{

  const AnswerButton({super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function() onTap ;

  @override
  Widget build(context){
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40, ),
          foregroundColor: Colors.deepPurple[900],
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: Text(answerText, textAlign: TextAlign.center ,),

    ) ;
  }
}
































// import 'package:flutter/material.dart';
//
// class QuestionScreen extends StatefulWidget {
//
//   const QuestionScreen({super.key});
//
//   @override
//   State<QuestionScreen> createState() {
//     return _QuestionScreenState();
//   }
//
// }
//
// class _QuestionScreenState extends State<QuestionScreen> {
//
//   @override
//   Widget build(context){
//     return const Center(child: Text('Question Screen')) ;
//   }
// }