import 'package:beginner_guide/core/size_config.dart';
import 'package:flutter/material.dart';


import 'interview_questions/interview_questions.dart';
import 'interview_tabbar.dart';
import 'problem_solving/problem_solving.dart';

class InterViewScreen extends StatelessWidget {
  const InterViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.sizeConfigInit(context);
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DefaultTabController(
               length: 2,
               initialIndex: 0,
               child: Column(

                 children: [
                   const InterViewTabBar(),
                   SizedBox(height: SizeConfig.screenHeight!*0.015),
                   SizedBox(
                     height: SizeConfig.screenHeight!*0.68,
                     child:  const TabBarView(
                       physics: NeverScrollableScrollPhysics(),

                       children: [
                         InterViewQuestions(),
                         ProblemSolving(),
                       ],
                       // physics: NeverScrollableScrollPhysics(),
                     ),
                   ),


                 ],
               ),
             ),
        ],
      ),
    );
  }
}
