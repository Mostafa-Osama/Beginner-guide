import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/presentation/Screens/Authentication/register_screen.dart';
import 'package:beginner_guide/presentation/Screens/HomeScreen/home_layout.dart';
import 'package:beginner_guide/presentation/Screens/widgets/buttons/default_elevated_button.dart';
import 'package:beginner_guide/presentation/Screens/widgets/buttons/default_text_button.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:beginner_guide/presentation/Screens/widgets/navigator.dart';
import 'package:beginner_guide/presentation/Screens/widgets/text_field/default_text_form_field.dart';
import 'package:beginner_guide/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:beginner_guide/presentation/cubit/auth_cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: LayoutBuilder(
          builder:(context,constraint)=> Container(
            decoration: const BoxDecoration(
              color: AppColors.defaultColor,

            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Icon(Icons.lock,color: AppColors.whiteColor,size: 30,),
                              SizedBox(width: 20,),
                              DefaultText(text: 'Login',textStyle: TextStyle(fontSize: 25,color: AppColors.whiteColor),),
                            ],
                          ),
                          SizedBox(height: constraint.maxHeight*0.03,),



                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               const Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                                  child:  DefaultText(text: 'Email',textStyle: TextStyle(fontSize: 20,color: AppColors.whiteColor),),
                                ),
                                SizedBox(height: constraint.maxHeight*0.03,),

                                DefaultTextFormField(

                                textEditingController: emailController,
                                textInputType: TextInputType.emailAddress,
                                defaultBorderRadius: 20,
                                enabledBorderRadius: 20,
                                enabledBorderSideColor: AppColors.defaultColor,
                                hintText: 'Enter Your Email',
                                borderSideColor: AppColors.defaultColor,
                                fillColor: AppColors.whiteColor,
                          ),
                          SizedBox(height: constraint.maxHeight*0.03,),
                               const Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                                  child:  DefaultText(text: 'Password',textStyle: TextStyle(fontSize: 20,color: AppColors.whiteColor),),
                                ),
                                SizedBox(height: constraint.maxHeight*0.03,),

                                DefaultTextFormField(
                                 textEditingController: passwordController,
                                  textInputType: TextInputType.text,
                                  defaultBorderRadius: 20,
                                  enabledBorderRadius: 20,
                                  enabledBorderSideColor: AppColors.defaultColor,
                                  maxLine: 1,
                                  obSecureText: true,
                                  hintText: 'Enter Your Password',
                                  suffixIcon: Icons.visibility,

                                  borderSideColor: AppColors.defaultColor,
                                  fillColor: AppColors.whiteColor,
                                ),
                              ],
                            ),

                          SizedBox(height: constraint.maxHeight*0.08,),
                          BlocConsumer<AuthenticationCubit,AuthenticationStates>(
                            listener: (context,state){
                              if(state is LoginSuccessState){
                                pushReplacement(context: context, screen:const HomeLayout());
                              }
                            },
                            builder:(context,state)=>state is LoginLoadingState? const Center(child: CircularProgressIndicator(color: AppColors.whiteColor,),):DecoratedBox(
                              decoration: BoxDecoration(
                                  gradient:const LinearGradient(
                                      colors: [
                                        AppColors.lightGreenColor,
                                        AppColors.lightGreenColorX2,

                                        //add more colors
                                      ]),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow:const <BoxShadow>[
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                                        blurRadius: 5) //blur radius of shadow
                                  ]
                              ),
                              child: SizedBox(
                              width: constraint.maxWidth*1,
                              child:DefaultElevatedButton(
                              onPressed: (){
                                if(formKey.currentState!.validate()){
                                  AuthenticationCubit.get(context).signInWithEmailAndPassword(email:emailController.text.toString() , password: passwordController.text.toString());
                                }
                              },
                                buttonColor: AppColors.defaultColor.withOpacity(0),
                                buttonBorderColor: AppColors.defaultColor.withOpacity(0),

                                textStyleFontSize: 20,
                              buttonBorderRadius: 20,
                              text: 'Login',


                          ),),
                            ),),
                          SizedBox(height: constraint.maxHeight*0.05,),
                          const DefaultText(
                            text: 'Don\'t have an account ?',
                            textStyle: TextStyle(fontSize: 20,color: AppColors.whiteColor),
                          ),
                          SizedBox(height: constraint.maxHeight*0.01,),

                          DefaultTextButton(
                            text: 'Create an Account',
                            textFontSize: 15,
                            onPressed: (){
                              push(context: context, screen: RegisterScreen());
                            },
                            textColor: AppColors.whiteColor,
                            textFontWeight: FontWeight.bold,


                          ),
//                         SizedBox(height: constraint.maxHeight*0.01,),
//                         const Center(
//                           child:  DefaultText(
//                             text: 'OR',
//                             textStyle: TextStyle(color: AppColors.defaultColor,fontSize: 20),
//                           ),
//                         ),
//                         SizedBox(height: constraint.maxHeight*0.01,),
//                         SocialElevatedButton(
// buttonColor: AppColors.blueColor,
//                           buttonBorderColor: AppColors.blueColor,
//                           buttonBorderRadius: 20,
//                           buttonText: 'Login With Facebook',
//                           image: 'assets/images/authentication/facebook.png',
//                           onPressed: (){},
//
//                         ),
//                         SizedBox(height: constraint.maxHeight*0.03,),
//                         SocialElevatedButton(
//                           buttonColor: AppColors.orangeColor,
//                           buttonBorderColor: AppColors.orangeColor,
//                           buttonBorderRadius: 20,
//                           buttonText: 'Login With Google',
//                           image: 'assets/images/authentication/google.png',
//                           onPressed: (){},
//
//                         ),





                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
