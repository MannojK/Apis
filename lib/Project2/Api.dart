import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_tute/Project2/modelScreeen.dart';

class Apis{
 static Future <List<mScreen>>fetchUserss() async{
    final response = await http.get(Uri.parse( "https://www.balldontlie.io/api/v1/players"));
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['data'];
    final users = results.map((e){
    return mScreen(first_name: e['first_name'], last_name: e['last_name'], height_feet: e['height_feet']);
  
    });
    return users;
  }
}