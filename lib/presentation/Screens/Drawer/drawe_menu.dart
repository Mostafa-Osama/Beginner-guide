import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/core/size_config.dart';
import 'package:beginner_guide/presentation/Screens/Drawer/zoom_drawer.dart';
import 'package:beginner_guide/presentation/Screens/EditProfile/edit_profile_screen.dart';
import 'package:beginner_guide/presentation/Screens/MyFriendRequest/firend_request_screen.dart';
import 'package:beginner_guide/presentation/Screens/profile_screen/profile_screen.dart';
import 'package:beginner_guide/presentation/Screens/widgets/buttons/default_elevated_button.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:beginner_guide/presentation/Screens/widgets/navigator.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.sizeConfigInit(context);
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth!*1,
        padding: const EdgeInsets.all(15),
        color: AppColors.defaultColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
             InkWell(
               onTap: (){
                 ZoomDrawerWidget.zoomDrawerController.close!();

                 push(context: context, screen:const ProfileScreen());
               },
               child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Container(padding:const EdgeInsets.all(10),decoration: BoxDecoration(border: Border.all(color: AppColors.whiteColor),shape: BoxShape.circle),child:const Icon(Icons.person,size: 100,color: AppColors.whiteColor,)),
          ),
             ),
            SizedBox(height: SizeConfig.screenHeight!*0.05,),

            InkWell(
              onTap: (){
                ZoomDrawerWidget.zoomDrawerController.close!();
                push(context: context, screen: const EditProfileScreen());
              },
              child: Row(
                children: [
                  const  Icon(Icons.edit,color: AppColors.whiteColor,),
                   SizedBox(width: SizeConfig.screenWidth!*0.02,),
                  const   DefaultText(text: 'Edit My Profile',textStyle: TextStyle(color: AppColors.whiteColor,fontSize: 20),),
                ],
              ),
            ),

            SizedBox(height: SizeConfig.screenHeight!*0.02,),
           const Divider(color: AppColors.whiteColor,endIndent: 100,),
            SizedBox(height: SizeConfig.screenHeight!*0.02,),
            InkWell(
              onTap: (){
                ZoomDrawerWidget.zoomDrawerController.close!();

                push(context: context, screen:const FriendRequestScreen() );
              },
              child: Row(
                children: [
                  const  Icon(Icons.person_add,color: AppColors.whiteColor,),
                  SizedBox(width: SizeConfig.screenWidth!*0.02,),
                  const  DefaultText(text: 'My FriendRequest',textStyle: TextStyle(color: AppColors.whiteColor,fontSize: 20),),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight!*0.02,),
            const Divider(color: AppColors.whiteColor,endIndent: 100,),
            SizedBox(height: SizeConfig.screenHeight!*0.02,),
            Row(
              children: [
                const  Icon(Icons.message_outlined,color: AppColors.whiteColor,),
                SizedBox(width: SizeConfig.screenWidth!*0.02,),
                const   DefaultText(text: 'My Messages',textStyle: TextStyle(color: AppColors.whiteColor,fontSize: 20),),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight!*0.02,),
            const Divider(color: AppColors.whiteColor,endIndent: 100,),
            SizedBox(height: SizeConfig.screenHeight!*0.02,),

            Row(
              children: [
                const  Icon(Icons.article,color: AppColors.whiteColor,),
                SizedBox(width: SizeConfig.screenWidth!*0.02,),
                const DefaultText(text: 'Articles',textStyle: TextStyle(color: AppColors.whiteColor,fontSize: 20),),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight!*0.02,),
            const Divider(color: AppColors.whiteColor,endIndent: 100,),
            SizedBox(height: SizeConfig.screenHeight!*0.02,),
            Row(
              children: [
                const  Icon(Icons.report,color: AppColors.whiteColor,),
                SizedBox(width: SizeConfig.screenWidth!*0.02,),
                const DefaultText(text: 'About App',textStyle: TextStyle(color: AppColors.whiteColor,fontSize: 20),),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight!*0.02,),
            const Divider(color: AppColors.whiteColor,endIndent: 100,),
            SizedBox(height: SizeConfig.screenHeight!*0.04,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: DefaultElevatedButton(
                text: 'Sign Out',
                onPressed: (){},
                buttonBorderColor: AppColors.defaultColor,
                buttonColor: AppColors.whiteColor,
                buttonBorderRadius: 20,
                textStyleColor: AppColors.defaultColor,
                textStyleFontSize: 20,

              ),
            )


          ],
        ),
      ),
    );
  }
}
