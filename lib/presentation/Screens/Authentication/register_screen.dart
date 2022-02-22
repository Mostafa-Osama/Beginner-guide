import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/presentation/Screens/HomeScreen/home_layout.dart';
import 'package:beginner_guide/presentation/Screens/widgets/buttons/default_elevated_button.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:beginner_guide/presentation/Screens/widgets/navigator.dart';
import 'package:beginner_guide/presentation/Screens/widgets/text_field/default_text_form_field.dart';
import 'package:beginner_guide/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:beginner_guide/presentation/cubit/auth_cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController currentJobController = TextEditingController();
  TextEditingController jobExperienceController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultColor,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraint) => Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.defaultColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: DefaultText(
                        text: 'Create An Account',
                        textStyle: TextStyle(fontSize: 25,color: AppColors.whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                  const  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0),
                      child:  DefaultText(
                        text: 'Email Address',
                        textStyle: TextStyle(fontSize: 20,color: AppColors.whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    DefaultTextFormField(
                      textInputType: TextInputType.emailAddress,
                      defaultBorderRadius: 20,
                      enabledBorderRadius: 20,
                      enabledBorderSideColor: AppColors.defaultColor,
                      hintText: 'Enter Your Email',
                      textEditingController: emailController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Email Cannot be Empty';
                        }
                      },
                      borderSideColor: AppColors.defaultColor,
                      fillColor: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    const  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0),
                      child:  DefaultText(
                        text: 'Password',
                        textStyle: TextStyle(fontSize: 20,color: AppColors.whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    DefaultTextFormField(
                      textInputType: TextInputType.text,
                      obSecureText: true,
                      defaultBorderRadius: 20,
                      enabledBorderRadius: 20,
                      enabledBorderSideColor: AppColors.defaultColor,
                      hintText: 'Enter Your Password',
                      suffixIcon: Icons.visibility,
                      textEditingController: passwordController,
                      maxLine: 1,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Password Cannot Be Empty';
                        }
                      },
                      borderSideColor: AppColors.defaultColor,
                      fillColor: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    const  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0),
                      child:  DefaultText(
                        text: 'Phone Number',
                        textStyle: TextStyle(fontSize: 20,color: AppColors.whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    DefaultTextFormField(
                      textInputType: TextInputType.phone,
                      defaultBorderRadius: 20,
                      enabledBorderRadius: 20,
                      enabledBorderSideColor: AppColors.defaultColor,
                      hintText: 'Enter Your Phone',
                      textEditingController: phoneController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Phone Cannot Be Empty';
                        }
                      },
                      borderSideColor: AppColors.defaultColor,
                      fillColor: AppColors.whiteColor,
                    ),

                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    //Address
                    const  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0),
                      child:  DefaultText(
                        text: 'Address',
                        textStyle: TextStyle(fontSize: 20,color: AppColors.whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    DefaultTextFormField(
                      textInputType: TextInputType.text,
                      textEditingController: addressController,
                      defaultBorderRadius: 20,
                      enabledBorderRadius: 20,
                      enabledBorderSideColor: AppColors.defaultColor,
                      hintText: 'Enter Your Address',
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Address Cannot Be Empty';
                        }
                      },
                      borderSideColor: AppColors.defaultColor,
                      fillColor: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    //Address
                    const  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0),
                      child:  DefaultText(
                        text: 'First Name',
                        textStyle: TextStyle(fontSize: 20,color: AppColors.whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    DefaultTextFormField(
                      textInputType: TextInputType.text,
                      defaultBorderRadius: 20,
                      enabledBorderRadius: 20,
                      enabledBorderSideColor: AppColors.defaultColor,
                      textEditingController: firstNameController,
                      hintText: 'Enter Your FirstName',
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'First Name Cannot Be Empty';
                        }
                      },
                      borderSideColor: AppColors.defaultColor,
                      fillColor: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    const  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0),
                      child:  DefaultText(
                        text: 'Last Name',
                        textStyle: TextStyle(fontSize: 20,color: AppColors.whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    DefaultTextFormField(
                      textInputType: TextInputType.text,
                      textEditingController: lastNameController,
                      defaultBorderRadius: 20,
                      enabledBorderRadius: 20,
                      enabledBorderSideColor: AppColors.defaultColor,
                      hintText: 'Enter Your LastName',
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Last Name Cannot Be Empty';
                        }
                      },
                      borderSideColor: AppColors.defaultColor,
                      fillColor: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    const  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0),
                      child:  DefaultText(
                        text: 'Current Job',
                        textStyle: TextStyle(fontSize: 20,color: AppColors.whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    DefaultTextFormField(
                      textInputType: TextInputType.text,
                      textEditingController: currentJobController,
                      defaultBorderRadius: 20,
                      enabledBorderRadius: 20,
                      enabledBorderSideColor: AppColors.defaultColor,
                      hintText: 'Enter Your Current Job',
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Current Job Cannot Be Empty';
                        }
                      },
                      borderSideColor: AppColors.defaultColor,
                      fillColor: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    const  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0),
                      child:  DefaultText(
                        text: 'Job Experience',
                        textStyle: TextStyle(fontSize: 20,color: AppColors.whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.03,
                    ),
                    DefaultTextFormField(
                      textInputType: TextInputType.text,
                      textEditingController: jobExperienceController,
                      defaultBorderRadius: 20,
                      enabledBorderRadius: 20,
                      enabledBorderSideColor: AppColors.defaultColor,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Experience Cannot Be Empty';
                        }
                      },
                      maxLine: 10,
                      borderSideColor: AppColors.defaultColor,
                      fillColor: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.05,
                    ),
                    SizedBox(
                      width: constraint.maxWidth * 1,
                      child: BlocConsumer<AuthenticationCubit,
                          AuthenticationStates>(
                        listener: (context,state){
                          if(state is CreateUserSuccessState){
                            AuthenticationCubit.get(context).signInWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString());
                          }
                          if(state is LoginSuccessState){
                            pushReplacement(context: context, screen:const HomeLayout());
                          }
                        },
                        builder: (context, state) =>
                        (state is RegisterLoadingState ||state is RegisterSuccessState ||state is CreateUserLoadingState||state is CreateUserSuccessState|| state is LoginLoadingState)?const Center(child:  CircularProgressIndicator(color: AppColors.whiteColor,))   :DecoratedBox(
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
                              child: DefaultElevatedButton(
                          buttonColor: AppColors.defaultColor.withOpacity(0),
                          onPressed: () {
                              if (formKey.currentState!.validate()) {
                                AuthenticationCubit.get(
                                        context)
                                    .registerWithEmailAndPassword(
                                        email: emailController.text
                                            .toString(),
                                        password: passwordController
                                            .text
                                            .toString(),
                                        phone:
                                            phoneController
                                                .text
                                                .toString(),
                                        firstName:
                                            firstNameController
                                                .text
                                                .toString(),
                                        lastName:
                                            lastNameController
                                                .text
                                                .toString(),
                                        jobExperience:
                                            jobExperienceController.text
                                                .toString(),
                                        currentJob: currentJobController
                                            .text
                                            .toString(),address: addressController.text.toString());
                              }
                          },
                          buttonBorderColor: AppColors.defaultColor.withOpacity(0),
                          textStyleFontSize: 20,
                          buttonBorderRadius: 20,
                          text: 'Register',
                        ),
                            ),
                      ),
                    ),
                    SizedBox(
                      height: constraint.maxHeight * 0.01,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
