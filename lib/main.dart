import 'package:flutter/material.dart';
import 'package:mobile_programing_with_flutter/second_page.dart';

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
  String result = "Belum Ada";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: <Widget>[ 
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        const Color.fromARGB(255, 159, 107, 247)
                      ),
                      padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.fromLTRB(30, 10, 30, 10)
                      ),
                    ),
                    onPressed: () async {
                      var catcher = await Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => const SecondPage(
                            title: "Pased value",
                            neededValue: "This is sample value"
                          )
                        )
                      );
                      setState(() {
                        result = catcher;
                      });
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                      children: <Widget>[
                        Icon(
                          Icons.android,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        Text("Press Me!", style: TextStyle(color: Colors.white))
                    ]),
                  )
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text(result),
              ),
            ]),
          ]
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
