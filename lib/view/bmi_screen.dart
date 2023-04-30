import 'package:classwork/model/bmi_calculate.dart';
import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  var gap = const SizedBox(
    height: 12,
  );
  BMI bmi = BMI();

  double weight = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                gap,
                TextFormField(
                  onChanged: (value) {
                    weight = double.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Weight',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                ),
                gap,
                TextFormField(
                  onChanged: (value) {
                    height = double.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Height',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                ),
                gap,
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        bmi.calculate;
                      });
                    },
                    child: const Text('CALCULATE'),
                  ),
                ),
                gap,
                SizedBox(
                  child: Text('Result is: ${bmi.calculate(weight, height)}'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}