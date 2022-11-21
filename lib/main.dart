import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? error = '';
  //int amount = 0;
  double input = 0;
  double output = 0;
  final TextEditingController controllerEUR = TextEditingController();

  double convertingFunctions() {
    return output = 4.95 * input;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter Application'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Image.network(
                'https://i1.sndcdn.com/artworks-000634730023-woiefq-t500x500.jpg',
              ),
              TextField(
                controller: controllerEUR,
                decoration: InputDecoration(
                  hintText: 'Enter the amount in EUR',
                  errorText: error,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        controllerEUR.clear();
                        output = 0.0;
                      });
                    },
                  ),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onChanged: (String value) {
                  setState(() {
                    final double? number = double.tryParse(value);

                    if (number == null) {
                      error = 'Please enter a number';
                    } else {
                      input = number;
                      error = null;
                    }
                  });
                },
              ),
              ElevatedButton(
                child: const Text('Convert in RON'),
                onPressed: () {
                  setState(() {
                    convertingFunctions();
                  });
                },
              ),
              Text(
                output.toString(),
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
