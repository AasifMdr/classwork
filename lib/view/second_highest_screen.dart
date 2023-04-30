import 'package:flutter/material.dart';

class SecondHighest extends StatefulWidget {
  const SecondHighest({super.key});

  @override
  _SecondHighestState createState() => _SecondHighestState();
}

class _SecondHighestState extends State<SecondHighest> {
  final TextEditingController _controller = TextEditingController();
  final List<int> _numbers = [];
  int _secondHighest = 0;

  void _addNumber() {
    int? number = int.tryParse(_controller.text);
    if (number != null) {
      setState(() {
        _numbers.add(number);
        _numbers.sort();
        if (_numbers.length > 1) {
          _secondHighest = _numbers[_numbers.length - 2];
        }
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Highest'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter a number',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addNumber,
              child: const Text('Add'),
            ),
            const SizedBox(height: 16),
            Text(
              'Second highest: $_secondHighest',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}