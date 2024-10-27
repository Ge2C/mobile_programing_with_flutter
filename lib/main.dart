import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';
import 'package:mobile_programing_with_flutter/second_page.dart';
import 'package:mobile_programing_with_flutter/login_state.dart';
import 'package:mobile_programing_with_flutter/camera_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LoginState(),
      child: const MyApp(),
    ),
  ); 
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

    var loginState = Provider.of<LoginState>(context);

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
                  Visibility(
                    visible: loginState.isLogin,
                    replacement: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 159, 107, 247)),
                        padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                      ),
                      onPressed: () async {
                        var catcher = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SecondPage(
                              title: "Login Page", 
                              neededValue: "Please Login"
                            ),
                          ),
                        );
                        setState(() {
                          result = catcher;
                        });
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                        children: <Widget>[
                          Icon(Icons.android, color: Colors.white, size: 20.0, ),
                          Text("Press Me!", style: TextStyle(color: Colors.white))
                      ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                      children: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 174, 0, 0)),
                            padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                          ),
                          onPressed: () async {
                            loginState.logOut();
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                            children: <Widget>[
                              Icon(Icons.logout, color: Colors.white, size: 20.0),
                              Text("Logout!", style: TextStyle(color: Colors.white),
                            ),
                          ])
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 50, 50, 30),
                          child: ElevatedButton(
                            onPressed: () async {
                              WidgetsFlutterBinding.ensureInitialized();

                              final cameras = await availableCameras();
                              cameras;
                              // final CameraDescription firstCamera = cameras.first;

                               if (context.mounted) {
                                var captured = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CameraPage(),
                                  ),
                                );
                                setState(() { captured == null; });
                              }
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                              children: <Widget>[
                                Icon(Icons.camera, size: 20.0),
                                Text("Camera!"),
                              ]
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                ]
              ),
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
