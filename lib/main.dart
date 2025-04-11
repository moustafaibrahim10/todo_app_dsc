import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_dsc/components/constatns.dart';

import 'cubit/bloc_observer.dart';
import 'layout/layout_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: LayoutScreen(),
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.teal,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(
              size: 30
          ),
          unselectedItemColor: Colors.grey[300],

        )
      ),
    );
  }
}


