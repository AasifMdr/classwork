import 'package:flutter/material.dart';

class ReverseString extends StatefulWidget {
  const ReverseString({super.key});

  @override
  _ReverseStringState createState() => _ReverseStringState();
}

class _ReverseStringState extends State<ReverseString> {
  final TextEditingController _controller = TextEditingController();
  String _reversedString = '';

  void _reverseString() {
    String input = _controller.text;
    String reversed = input.split('').reversed.join('');
    setState(() {
      _reversedString = reversed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reverse String'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter a string',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _reverseString,
              child: const Text('Reverse'),
            ),
            const SizedBox(height: 16),
            Text(
              _reversedString,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
