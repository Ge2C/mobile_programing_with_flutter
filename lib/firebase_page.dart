import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebasePage extends StatefulWidget {
  const FirebasePage({super.key});

  @override
  State<FirebasePage> createState() => _FirebasePageState();
}

class _FirebasePageState extends State<FirebasePage> {
  var db = FirebaseFirestore.instance;
  List<Map<String, dynamic>> users = [];

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  void _addUser() {
    final user = <String, dynamic>{
      "name": _nameCtrl.text,
      "email": _emailCtrl.text,
      'password': _passwordCtrl.text,
      "timestamp": FieldValue.serverTimestamp(),
    };
    db.collection("users").add(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Firebase"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 30),
              child: ElevatedButton(
                onPressed: () async {
                  await showDialog<void>(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter user name';
                                            }
                                            return null;
                                          },
                                          controller: _nameCtrl,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Name',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.add, size: 20.0),
                    Text("Add New User"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: users.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(users[index]['name']),
                          subtitle: Text(users[index]['email']),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
