import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:http_tute/Project/players.dart';

class homepage extends StatelessWidget {
  homepage({super.key});

// ***  IMPORTANT PART OF API 

  List<Api> playerss = [];

  Future getPlayers() async {
    final response =
        await http.get(Uri.https('balldontlie.io', 'api/v1/players'));
    // print (response.body);
    var jsonData = jsonDecode(response.body);
    for (var eachplayers in jsonData['data']) {
      final player = Api(
        first_name: eachplayers['first_name'],
        last_name: eachplayers['last_name'],
        position: eachplayers['position'],

      );
      playerss.add(player);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'NBA TEAMS',
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getPlayers(),
        builder: (context, snapshot) {
// Is it done loading ? then show team data
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: playerss.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(playerss[index].first_name + "   " +playerss[index].last_name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                    SizedBox(height: 5,),
                    Text('position :  ' + playerss[index].position)
                        ],
                      ),
                    ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
