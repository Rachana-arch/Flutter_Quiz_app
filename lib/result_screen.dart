import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:adb_basic/questions.dart';


class ResultScreen extends StatelessWidget{

  ResultScreen(this.restartQuiz, { required this.chosenAnswer ,super.key});

  final Function() restartQuiz;

  final List<String> chosenAnswer ;
  final List<Map<String, Object>> summary = [];
  List<Map<String, Object>> getSummaryData(){

  for (var i = 0 ; i < chosenAnswer.length; i++) {
    summary.add({
      'question_id': i,
      'question': questions[i].question,
      'correct_answer' :questions[i].answer[0],
      'user_answer' : chosenAnswer[i]}
    );
      }
  return summary ;
  }



  @override
  Widget build(context) {
    final summaryData = getSummaryData() ;
    final totalQuestion =  questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You answered $numCorrectQuestions out of $totalQuestion questions correctly !',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),),
          const SizedBox(height: 30,),
          QuestionSummary(summaryData: getSummaryData(),),
          const SizedBox(height: 30,),
          TextButton.icon(onPressed: restartQuiz,
              label: const Text('Restart now'),
          icon: const Icon(Icons.restart_alt_rounded),)
        ],
      ),
    );
  }
}

class QuestionSummary extends StatelessWidget {

  const QuestionSummary({required this.summaryData, super.key}) ;
  final List<Map<String, Object>> summaryData ;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map( (data) {
            return Row(children: [
              Container(
                margin: EdgeInsets.only(right: 10, bottom: 20),
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                 color: Colors.lightBlueAccent,
                 shape: BoxShape.circle),
                child: Center(child: Text(((data['question_id'] as int) + 1).toString())),
              ),

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(data['question'] as String,
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.white),),
                  const SizedBox(height: 3,),
                  Text(data['user_answer'] as String,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.pinkAccent),),
                  const SizedBox(height: 3,),
                  Text(data['correct_answer'] as String,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.lightBlueAccent),),
                    const SizedBox(height: 14,),
                ],),
              )
            ],) ;
          }).toList(),
        ),
      ),
    );
  }
}