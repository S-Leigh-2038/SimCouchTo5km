// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:async';

class StartStopPause extends StatefulWidget {
  StartStopPause({
    required this.initialTimer,
    required this.weekNumber,
    Key? key,
  }) : super(key: key);
  int initialTimer;
  int weekNumber;

  @override
  State<StartStopPause> createState() =>
      // ignore: no_logic_in_create_state
      StartStopPauseState(initialTimer, weekNumber);
}

class StartStopPauseState extends State<StartStopPause> {
  StartStopPauseState(this._countDown, this._weekNumber);
  late int _countDown;
  bool _isPaused = false;
  Timer? _timer;
  int countdownTimersListIterator = 0;
  late int _weekNumber;
  late String _walkOrRun;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    _countDown = timerWeeks[_weekNumber][0];
    _walkOrRun = walkOrRunkWeeks[_weekNumber][0];
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void start() {
    // if beginning - start (last condition)
    // if paused - restart from paused count
    // if running - do nothing
    // if stopped - start

    // timer exists and is active - someone pressed start whilst running
    if (_timer != null && _timer!.isActive) {
      return;
    }
    // if in paused state, reset flag and start timer
    if (_isPaused) {
      _isPaused = false;
    }

    playSound();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDown > 0) {
          _countDown--;
        } else {
          // Logic for looping over list of countdown timers
          if (countdownTimersListIterator < timerWeeks[_weekNumber].length) {
            countdownTimersListIterator++;
            _countDown = timerWeeks[_weekNumber][countdownTimersListIterator];
            _walkOrRun =
                walkOrRunkWeeks[_weekNumber][countdownTimersListIterator];
            playSound();
          } else {
            _timer?.cancel();
            playEndSound();
          }
        }
      });
    });
  }

  void pause() {
    // if beginning - do nothing
    // if running - pause (and store countdown)
    // if paused - do nothing
    // if stoppd - do nothing

    if (_timer == null) {
      return;
    } else {
      // _pausedCountDown = _countDown;
      _isPaused = true;
      _timer?.cancel();
    }
  }

  void stop() {
    // if beginning - do nothing
    // if running - reset
    // if paused - reset
    // if stopped - do nothing
    // if (_timer != null || _isPaused) {
    if (_isPaused || _timer != null) {
      _timer?.cancel();
      _isPaused = false;

      setState(() {
        _countDown = timerWeeks[_weekNumber][0];
        countdownTimersListIterator = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            // '$_countDown',
            formatTime(_countDown),
            style: const TextStyle(
              fontSize: 100,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Part ${countdownTimersListIterator + 1} of ${timerWeeks[_weekNumber].length}",
            style: const TextStyle(
              fontSize: 25,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        walkOrRunColor(),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: start,
              child: const Text(startCoundown),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: pause,
              child: const Text(pauseCountdown),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: stop,
              child: const Text(stopCountdown),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget walkOrRunColor() {
    if (_walkOrRun == "Run") {
      return Text(
        _walkOrRun,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 50,
          color: Colors.red,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
      );
    } else {
      return Text(
        _walkOrRun,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 50,
          color: Colors.green,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
      );
    }
  }

  void setTimerWeek(int weekNumber) {
    setState(() {
      _weekNumber = weekNumber;
      _countDown = timerWeeks[_weekNumber][0];
      countdownTimersListIterator = 0;
    });
  }

  String formatTime(int seconds) {
    final int sec = seconds % 60;
    final int min = (seconds / 60).floor();
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    return "$minute : $second";
  }

  void playSound() async {
    if (_walkOrRun == "Run") {
      await player.play(AssetSource('audio/startRunning.mp3'));
    } else {
      await player.play(AssetSource('audio/startWalking.mp3'));
    }
  }

  void playEndSound() async {
    await player.play(AssetSource('audio/sessionComplete.mp3'));
  }
}
