import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/core/size_config.dart';
import 'package:beginner_guide/presentation/Screens/HomeScreen/users/user_widget.dart';
import 'package:beginner_guide/presentation/Screens/HomeScreen/users/users_profile.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:beginner_guide/presentation/Screens/widgets/navigator.dart';
import 'package:beginner_guide/presentation/Screens/widgets/snack_bar.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_cubit.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppCubit.get(context).getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.sizeConfigInit(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => state is GetAllUsersLoadingState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state is GetAllUsersErrorState
                ? const Center(
                    child: DefaultText(
                      text: 'There\'s an error please try again later',
                      textStyle: TextStyle(fontSize: 15),
                    ),
                  )
                : AppCubit.get(context).allUsers.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                push(
                                    context: context,
                                    screen: UsersProfile(
                                      userModel:
                                          AppCubit.get(context).allUsers[index],
                                    ));
                              },
                              child: BlocListener<AppCubit,AppStates>(
                                listener: (context,state){
                                  if(state is SendFriendRequestSuccessState){
                                    defaultSnackBar(context: context,text: 'Sent Friend Request Successfully',fontColor: AppColors.whiteColor,backGroundColor: AppColors.greenColor);
                                  }
                                  if(state is SendFriendRequestErrorState || state is ReceiveFriendRequestErrorState){
                                    defaultSnackBar(context: context,text: 'There\'s an error happened please try again later ' ,fontColor: AppColors.whiteColor,backGroundColor: AppColors.redColor);

                                  }
                                },
                                child: UserWidget(
                                  userModel:
                                      AppCubit.get(context).allUsers[index],
                                ),
                              ));
                        },
                        itemCount: AppCubit.get(context).allUsers.length,
                      )
                    : const Center(
                        child: DefaultText(
                          text: 'There\'s no users yet',
                          textStyle: TextStyle(fontSize: 15),
                        ),
                      ),
      ),
    );
  }
}
