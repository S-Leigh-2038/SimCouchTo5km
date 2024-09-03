import 'package:flutter/material.dart';
import 'timer_startstoppause.dart';
import 'constants.dart';
import 'selection_week.dart';

void main() {
  runApp(const MyRunningApp());
}

class MyRunningApp extends StatelessWidget {
  const MyRunningApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _weekSelected = 0;
  final GlobalKey<StartStopPauseState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WeekDropDownMenu(
            onWeekSelectionPressed: (int val) {
              setState(() {
                _weekSelected = val;
                _key.currentState!.setTimerWeek(val);
              });
            },
          ),
          // Text('Week selected: ${_weekSelected + 1}'),
          // Text(timerWeeks[_weekSelected].join(',')),
          const SizedBox(height: 50),
          StartStopPause(
            key: _key,
            initialTimer: timerWeeks[_weekSelected][0],
            weekNumber: _weekSelected,
          ),
        ],
      ),
    );
  }
}
