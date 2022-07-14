import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/modules/on_boarding_screen/on_boarding_screen.dart';
import 'package:shop_app/shared/bloc_observer/bloc_observer.dart';
import 'package:shop_app/shared/network/constants.dart';
import 'package:shop_app/shared/network/remote/dio/dio_helper.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: defultColor,
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
