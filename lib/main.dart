import 'package:flutter/material.dart';

void main() {
  runApp(const UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";

  void _convertToFahrenheit() {
    setState(() {
      double? celsius = double.tryParse(_controller.text);
      if (celsius != null) {
        double fahrenheit = (celsius * 9 / 5) + 32;
        _result = "$celsius°C = ${fahrenheit.toStringAsFixed(2)}°F";
      } else {
        _result = "Please enter a valid number.";
      }
    });
  }

  void _convertToCelsius() {
    setState(() {
      double? fahrenheit = double.tryParse(_controller.text);
      if (fahrenheit != null) {
        double celsius = (fahrenheit - 32) * 5 / 9;
        _result = "$fahrenheit°F = ${celsius.toStringAsFixed(2)}°C";
      } else {
        _result = "Please enter a valid number.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperature Converter"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter temperature",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _convertToFahrenheit,
                  child: const Text("To Fahrenheit"),
                ),
                ElevatedButton(
                  onPressed: _convertToCelsius,
                  child: const Text("To Celsius"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}