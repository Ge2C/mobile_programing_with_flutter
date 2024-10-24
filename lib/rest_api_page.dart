import 'dart:convert'; // Untuk mengubah data JSON menjadi Map
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestApiPage extends StatefulWidget {
  const RestApiPage({super.key});

  @override
  State<RestApiPage> createState() => _RestApiPageState();
}

class _RestApiPageState extends State<RestApiPage> {
  List<dynamic> _data = [];

  Future<void> _fetchData() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    if (response.statusCode == 200) {
      setState(() {
        _data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("REST API"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 30),
              child: ElevatedButton(
                onPressed: () async {},
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.add, size: 20.0),
                    Text("Add New Post"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: _data.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_data[index]['title']),
                          subtitle: Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              strutStyle: StrutStyle(
                                fontSize: 12.0,
                              ),
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                text: _data[index]['body'],
                              ),
                            ),
                          ),
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
