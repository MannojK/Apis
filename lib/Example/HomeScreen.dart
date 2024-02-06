import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_tute/Example/api_service.dart';
import 'package:http_tute/example/user_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final user = _userModel![index];
                    return 
                  Column(
                    children: [
                      ListTile(
                        leading:                Text(user.id.toString()),
                     title: Text(_userModel![index].username),
                     subtitle:    Text(_userModel![index].email),
                      ),
                      Text(_userModel![index].id.toString()),
                      Text(_userModel![index].username),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].email),
                          Text(_userModel![index].website),
                        ],
                      ),
                    ],
                  );
                  },
                );
              },
            ),
    );
  }
}

