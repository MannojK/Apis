
// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class homePagee extends StatefulWidget {
  const homePagee({super.key});

  @override
  State<homePagee> createState() => _homePageeState();
}

class _homePageeState extends State<homePagee> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final name = user['first_name'];
            final email = user['last_name'];
            final feet = user['height_feet'];
            return Column(
              children: [
                ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Text(feet.toString()),
                  ),  
                  title: Text(name),
                  subtitle: Text(email),
                ),
                SizedBox(
                  height: 10.0,
                  child: new Center(
                    child: new Container(
                      margin:
                          new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                      height: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.double_arrow_outlined),
        onPressed: fetchUsers,
      ),
    );
  }

  void fetchUsers() async {
    print('fetchUsers called');
    final response =
        await http.get(Uri.parse( "https://www.balldontlie.io/api/v1/players"));
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['data'];
    });
    print('fetchUsers completed');
  }
}
