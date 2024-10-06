import 'dart:async';

import 'package:flutter/material.dart'; // 'matertal.dart'를 'material.dart'로 수정

class TimewatchScreen extends StatefulWidget {
  const TimewatchScreen({super.key});

  @override
  State<TimewatchScreen> createState() => _TimewatchScreenState(); // 문법 오류 수정
}


class _TimewatchScreenState extends State<TimewatchScreen> {
  Timer? _timer;

  int _time = 0;

  bool _isRunnung = false;

  List<String> _lapTimes = [];

  void _clickButton() {
    _isRunnung = !_isRunnung;
    if (_isRunnung) {
      _start();
    } else {
      _pause();
    }
  }
  void _start() {}
  void _pause() {}
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('타임워치'),
      ),
      body: Column(
        children: [
          SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
               Text(
                 '0', style: TextStyle(fontSize: 50),
              ),
              Text(
                '00',
              ),
            ],
          ),
          SizedBox(
            width: 100,
            height: 200,
            child: ListView(
              children: [
                Center(child: Text('111')),
                Center(child: Text('111')),
                Center(child: Text('111')),
                Center(child: Text('111')),
                Center(child: Text('111')),
                Center(child: Text('111')),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {},
                child: const Icon(Icons.refresh),
              ),
              FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  setState(() {
                    _clickButton();
                  });

                },
                child: _isRunnung 
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_arrow),
              ),
              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {},
                child: Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
