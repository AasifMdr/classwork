import 'package:flutter/material.dart';

class BinarySearch extends StatefulWidget {
  const BinarySearch({super.key});

  @override
  _BinarySearchState createState() => _BinarySearchState();
}

class _BinarySearchState extends State<BinarySearch> {
  final TextEditingController _controller = TextEditingController();
  final List<int> _numbers = [];
  late int _searchValue;
  String _searchResult = '';

  void _addNumber() {
    int? number = int.tryParse(_controller.text);
    if (number != null) {
      setState(() {
        _numbers.add(number);
        _numbers.sort();
      });
      _controller.clear();
    }
  }

  void _search() {
    int min = 0;
    int max = _numbers.length - 1;
    while (min <= max) {
      int mid = (min + max) ~/ 2;
      if (_numbers[mid] == _searchValue) {
        setState(() {
          _searchResult = 'Found';
        });
        return;
      } else if (_numbers[mid] < _searchValue) {
        min = mid + 1;
      } else {
        max = mid - 1;
      }
    }
    setState(() {
      _searchResult = 'Not found';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Binary Search'),
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
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter a value to search for',
              ),
              onChanged: (value) => _searchValue = int.tryParse(value)!,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _search,
              child: const Text('Search'),
            ),
            const SizedBox(height: 16),
            Text(
              'Result: $_searchResult',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}