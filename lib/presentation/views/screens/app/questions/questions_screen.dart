import 'package:flutter/material.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/presentation/views/screens/app/questions/widgets/question_item.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category title'),),
      body: ListView.separated(
        padding: 20.padding,
        itemCount: 20,
        itemBuilder: (context, index) => QuestionItem(),
    separatorBuilder: (context, index) => 16.spaceY,
        
      ),
    );
  }
}
