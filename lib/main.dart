import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arithmetic Operations',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Arithmetic Operations"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Arithmetic(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class Arithmetic extends StatefulWidget {
  const Arithmetic({super.key});

  @override
  State<Arithmetic> createState() => _ArithmeticState();
}

class _ArithmeticState extends State<Arithmetic> {
  int num1 = 0;
  int num2 = 0;
  String result = '0';

  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Card(
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 48,
                bottom: 32,
                left: 16,
                right: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Answer(result: result),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "First number",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          try {
                            num1 = int.parse(value);
                          } catch (e) {
                            num1 = 0;
                            result = 'NaN';
                          }
                        });
                      },
                      controller: num1Controller,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Second number",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          try {
                            num2 = int.parse(value);
                          } catch (e) {
                            num2 = 0;
                            result = 'NaN';
                          }
                        });
                      },
                      controller: num2Controller,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: TextButton(
                      child: const Text("Clear"),
                      onPressed: () {
                        setState(() {
                          num1 = 0;
                          num2 = 0;
                          result = '0';

                          num1Controller.clear();
                          num2Controller.clear();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
              child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              Add(onPressed: () {
                setState(() {
                  result = (num1 + num2).toString();
                });
              }),
              Subtract(onPressed: () {
                setState(() {
                  result = (num1 - num2).toString();
                });
              }),
              Multiply(onPressed: () {
                setState(() {
                  result = (num1 * num2).toString();
                });
              }),
              Divide(onPressed: () {
                setState(() {
                  if (num2 == 0) {
                    result = "Undefined";

                    return;
                  }

                  result = (num1 / num2).toString();
                });
              }),
            ],
          )),
        ]));
  }
}

class Answer extends StatefulWidget {
  const Answer({super.key, required this.result});

  final String result;

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(children: [
        Text("Answer:",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            )),
        Text(
          "${widget.result}",
          style: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ])
    ]);
  }
}

class Add extends StatefulWidget {
  const Add({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => widget.onPressed(),
      child: const Text("Add"),
    );
  }
}

class Subtract extends StatefulWidget {
  const Subtract({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<Subtract> createState() => _SubtractState();
}

class _SubtractState extends State<Subtract> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => widget.onPressed(),
      child: const Text("Subtract"),
    );
  }
}

class Multiply extends StatefulWidget {
  const Multiply({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<Multiply> createState() => _MultiplyState();
}

class _MultiplyState extends State<Multiply> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => widget.onPressed(),
      child: const Text("Multiply"),
    );
  }
}

class Divide extends StatefulWidget {
  const Divide({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<Divide> createState() => _DivideState();
}

class _DivideState extends State<Divide> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => widget.onPressed(),
      child: const Text("Divide"),
    );
  }
}
