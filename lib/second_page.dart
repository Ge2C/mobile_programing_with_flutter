import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_programing_with_flutter/login_state.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, this.title = "Second Page", this.neededValue = "Nothing"});

  final String title;
  final String neededValue;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    
    var loginState = Provider.of<LoginState>(context);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 50, 50, 30),
            child: Text(widget.neededValue),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 50, 50, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 159, 107, 247)),
                    padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                  ),
                  onPressed: () => <void>{
                      Navigator.pop(context, "Data Hasil")
                    },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: <Widget>[
                      Icon( Icons.arrow_back, color: Colors.white, size: 20.0),
                      Text("Back!", style: TextStyle(color: Colors.white))
                    ]),
                )
            ]),
          ),
        ]),
      ),
    );
  }
}
