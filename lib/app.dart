import 'package:classwork/view/binary_search_screen.dart';
import 'package:classwork/view/bmi_screen.dart';
import 'package:classwork/view/dashboard_screen.dart';
import 'package:classwork/view/reverse_string_screen.dart';
import 'package:classwork/view/second_highest_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/BMIRoute':(context) =>  const BMICalculator(),
        '/reverseStringRoute': (context) => const ReverseString(),
        '/secondHighestRoute':(context) => const SecondHighest(),
        '/binarySearchRoute': (context) => const BinarySearch() 
      },
    ));
  }
}