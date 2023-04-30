import 'package:flutter/material.dart';

void main() => runApp(const SecondHighest());

class SecondHighest extends StatelessWidget {
  const SecondHighest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Second Highest',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();
  final List<int> _values = [];
  String _result = '';

  void _addValue() {
    setState(() {
      int? value = int.tryParse(_textController.text);
      if (value != null) {
        _values.add(value);
        _textController.clear();
      }
    });
  }

  void _findSecondHighest() {
    setState(() {
      if (_values.length >= 2) {
        _values.sort();
        _result = 'Second highest value is ${_values[_values.length - 2]}';
      } else {
        _result = 'There are not enough values to find the second highest';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Highest'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter an integer value',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addValue,
              child: const Text('Add Value'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _findSecondHighest,
              child: const Text('Find Second Highest'),
            ),
            const SizedBox(height: 10),
            Text(
              _result,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}