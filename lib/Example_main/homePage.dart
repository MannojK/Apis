import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class homePAge extends StatefulWidget {
  const homePAge({super.key});

  @override
  State<homePAge> createState() => _homePAgeState();
}

class _homePAgeState extends State<homePAge> {
  List<dynamic> users = [];
@override
  void initState(){
    super.initState();
    fetchUsers();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest api"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
        
        final user = users[index];
        final name = user['name']['first'];
        final email = user['email'];
        final imgUrl = user['picture']['thumbnail'];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(imgUrl),
          ),
          title: Text(name),
          subtitle: Text(email),
        );
      }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
          onPressed: () {
fetchUsers();
          }),
    );
  }

 Future <void> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=100'));
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
  }
}
