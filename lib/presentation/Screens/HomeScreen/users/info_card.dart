import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/data/models/user_model.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:flutter/material.dart';


class InfoCard extends StatelessWidget {
  final UserModel ?userModel;

  const InfoCard({Key? key,this.userModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return                 Card(
      borderOnForeground: true,
      elevation: 20,
      child:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text:  TextSpan(
                style: const TextStyle(  fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor),
                children: <TextSpan>[
                  TextSpan(text: '${userModel!.firstName}', style:const TextStyle(color: AppColors.defaultColor)),
                  const TextSpan(text: '\'s '),
                 const TextSpan(text: 'Info')
                ],
              ),
            ),
            const SizedBox(height: 15,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const   Icon(Icons.school),
                const   SizedBox(width: 10,),

                Flexible(
                  child: DefaultText(
                    text: '${userModel!.jobExperience}',
                    textStyle:const TextStyle(
                        fontSize: 20,
                        color: AppColors.blackColor
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const    Icon(Icons.home_outlined),
                const    SizedBox(width: 10,),

                Flexible(
                  child: DefaultText(
                    text:'${userModel!.address}',
                    textStyle:const TextStyle(
                        fontSize: 20,
                        color: AppColors.blackColor
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    )
    ;
  }
}
