import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/presentation/Screens/HomeScreen/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'drawe_menu.dart';

class ZoomDrawerWidget extends StatelessWidget {
  static final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
   ZoomDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      style: DrawerStyle.DefaultStyle,
      menuScreen: const DrawerMenu(),
      mainScreen: const HomeLayout(),
      borderRadius: 24.0,
      showShadow: true,
      angle: -10.0,
      backgroundColor: AppColors.defaultColor,
      slideWidth: MediaQuery.of(context).size.width*.5,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,

    );
  }
}
