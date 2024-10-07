import 'dart:async';
import 'package:flutter/material.dart';

class TimewatchScreen extends StatefulWidget {
  const TimewatchScreen({super.key});

  @override
  State<TimewatchScreen> createState() => _TimewatchScreenState();
}

class _TimewatchScreenState extends State<TimewatchScreen> {
  Timer? _timer;
  int _time = 0;
  bool _isRunning = false;
  List<String> _lapTimes = [];

  void _clickButton() {
    _isRunning = !_isRunning;
    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  void _start() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _reset() {
    _isRunning = false;
    _timer?.cancel();
    _lapTimes.clear();
    _time = 0;
  }

  void _recordLapTime(String time) {
    _lapTimes.insert(0, '${_lapTimes.length + 1}. $time');
  }

  @override
  Widget build(BuildContext context) {
    int sec = _time ~/ 100;
    String hundredth = '${_time % 100}'.padLeft(2, '0');
    double progressValue = (_time % 10000) / 10000;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/GettyImages.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [

            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Colors.black45,
              ),
              child: const Text(
                '타임워치',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: CircularProgressIndicator(
                          value: progressValue,
                          strokeWidth: 15,
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '$sec',
                            style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '.$hundredth',
                            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Flexible(
              child: SizedBox(
                width: 100,
                height: 200,
                child: ListView(
                  children: _lapTimes
                      .map((time) => Center(
                    child: Text(
                      time,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
                      .toList(),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    setState(() {
                      _reset();
                    });
                  },
                  child: const Icon(Icons.refresh),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    setState(() {
                      _clickButton();
                    });
                  },
                  child: _isRunning
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    setState(() {
                      _recordLapTime('$sec.$hundredth');
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
