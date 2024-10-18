import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Programing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mobile Programing With FLutter'),
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const ColoredBox(
              color: Color.fromARGB(255, 205, 74, 74),
              child: Padding(
                padding: EdgeInsets.fromLTRB(50, 50, 50, 30),
                child: Image(
                    image: AssetImage('images/logo.png')
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text('Text Widget'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text('Text Widget'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text('Text Widget'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text('Text Widget'),
                ),
              ]
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text('Text Widget'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text('Text Widget'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text('Text Widget'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text('Text Widget'),
                ),
              ]
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text('Text Widget'),
                ),
              ]
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text('Text Widget'),
                ),
              ]
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
            ]),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
            ]),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end, 
              children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
            ]),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end, 
              children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
            ]),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end, 
              children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
            ]),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end, 
              children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
            ]),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end, 
              children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text('Text Widget'),
              ),
            ]),
          ]
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
