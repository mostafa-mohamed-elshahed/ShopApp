import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_abdullah_mansour/modules/on_bourding_screen/on_bourding_screen.dart';
import 'package:shop_app_abdullah_mansour/shared/bloc_observer.dart';
import 'package:shop_app_abdullah_mansour/shared/components/constants.dart';

main(){
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: OnBoardingScreen(),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: primaryThemeLightColor,
        primaryColor: primaryThemeDarkColor,
        appBarTheme: AppBarTheme(
          backgroundColor:primaryThemeLightColor,
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(),
          iconTheme: IconThemeData(color: primaryThemeLightColor,),
        ),
      ),

    );
  }
}
