import 'package:flutter/material.dart'; // 'matertal.dart'를 'material.dart'로 수정

class TimewatchScreen extends StatefulWidget {
  const TimewatchScreen({super.key});

  @override
  State<TimewatchScreen> createState() => _TimewatchScreenState(); // 문법 오류 수정
}


class _TimewatchScreenState extends State<TimewatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('타임워치'),
      ),
      body: Column(
        children: [
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
                onPressed: () {},
                child: const Icon(Icons.play_arrow),
              ),
              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {},
                child: Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
