import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_cubit.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserPosts extends StatelessWidget {
  const UserPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => (state is GetAllPostsLoadingState)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (state is GetAllUsersErrorState)
              ? const Center(
                  child: DefaultText(
                    text: 'حدث خطأ ما برجاء المحاولة في وقت لاحق',
                    textStyle: TextStyle(fontSize: 20),
                  ),
                )
              : (AppCubit.get(context).allPosts.isEmpty)?const Center(child: DefaultText(text: 'Don\'t have any posts yet ',textStyle: TextStyle(fontSize: 20),),):

      ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      borderOnForeground: true,
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            DefaultText(
                              text: 'Post Title',
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: AppColors.blackColor),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            DefaultText(
                              text: 'Since 2 days ago',
                              textStyle: TextStyle(
                                  fontSize: 15, color: AppColors.blackColor),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            DefaultText(
                              text:
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, ',
                              textStyle: TextStyle(
                                  fontSize: 20, color: AppColors.blackColor),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                ),
    );
  }
}
