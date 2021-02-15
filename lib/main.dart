import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:routine/store/routine.dart';
import 'package:routine/views/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider<RoutineBloc>(
        //   create: (context) => RoutineBloc(),
        //   dispose: (context, bloc) => bloc.dispose(),
        // ),
        ChangeNotifierProvider(
          create: (context) => RoutineStore(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        home: MainScreen(),
      ),
    );
  }
}
