import 'package:beginner_guide/core/size_config.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class InterViewQuestions extends StatelessWidget {
  const InterViewQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.sizeConfigInit(context);
    return SizedBox(
      height: SizeConfig.screenHeight!*0.8,
      child: ListView(
        children: const[

             WebView(

              initialUrl: 'https://www.javatpoint.com/flutter-interview-questions',

            ),
        ],
      ),
    );
  }
}
