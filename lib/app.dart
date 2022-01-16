import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page.dart';
import 'bloc/navigation/navigation_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => NavigationCubit()),
        ],
        child: HomePage(),
      ),
      theme: ThemeData(
        canvasColor: Colors.black,
        textTheme: TextTheme(
          // bodyText1: TextStyle(
          //   color: Colors.white,
          // ),
          // caption: TextStyle(color: Colors.white),
          // headline2: TextStyle(color: Colors.white),
          // headline3: TextStyle(color: Colors.white),
          // headline4: TextStyle(color: Colors.white),
          // headline5: TextStyle(color: Colors.white),
          // headline6: TextStyle(color: Colors.white),
          // overline: TextStyle(color: Colors.white),
          // subtitle1: TextStyle(color: Colors.white),
          // subtitle2: TextStyle(color: Colors.white),
          // headline1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
