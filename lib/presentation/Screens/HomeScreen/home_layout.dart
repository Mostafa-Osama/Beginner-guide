import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_cubit.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder:(context,state)=> Scaffold(
        appBar: AppBar(
          title:  Text(AppCubit.get(context).appBarTitle.elementAt(AppCubit.get(context).selectedIndex)),
        ),
        body: Center(
          child: AppCubit.get(context).widgetOptions.elementAt(AppCubit.get(context).selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.meeting_room),
              label: 'Interview',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Users',
            ),
          ],
          currentIndex: AppCubit.get(context).selectedIndex,
          selectedItemColor: AppColors.defaultColor,
          onTap: AppCubit.get(context).onItemTapped,
        ),
      ),
    );
  }
}
