import 'package:bloc/bloc.dart';
import 'package:bloc_strange_behavior/bloc_delegate.dart';
import 'package:bloc_strange_behavior/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

void main() {
  // Logs all BLoC transitions
  BlocSupervisor.delegate = SimpleBlocDelegate();
  _setupLogging();

  runApp(BrokenApp());
}

/// Include log level and time when printing logs using [Logger.root]
void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class BrokenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Systers Mentorship',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.lightBlueAccent,
        ),
        home: HomeScreen());
  }
}
