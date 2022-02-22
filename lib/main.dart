import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/colors/colors.dart';
import 'presentation/Screens/Authentication/login_screen.dart';
import 'presentation/cubit/app_cubit/app_cubit.dart';
import 'presentation/cubit/auth_cubit/auth_cubit.dart';
import 'presentation/cubit/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  BlocOverrides.runZoned(
        () {

      runApp(const MyApp());
    },

    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AuthenticationCubit()),
        BlocProvider(create: (context)=>AppCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Beginner guide',
        theme: ThemeData(
          primarySwatch: generateMaterialColor(AppColors.defaultColor),
        ),
        home:  LoginScreen(),
      ),
    );
  }
}

