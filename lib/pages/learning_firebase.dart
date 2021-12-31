import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LearnFirebase extends StatefulWidget {
  const LearnFirebase({Key? key}) : super(key: key);

  @override
  _LearnFirebaseState createState() => _LearnFirebaseState();
}

class _LearnFirebaseState extends State<LearnFirebase> {
  List<String> listStrings = <String>[];
  Uri url =
      Uri.https("gym-app-47b54-default-rtdb.firebaseio.com", "/words.json");
  TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: (_isLoading)
            ? Center(child: CircularProgressIndicator(),)
            : RefreshIndicator(
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _controller,
                      onTap: () {},
                      decoration: InputDecoration(
                          labelText: "Insira uma palavra aqui: "),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _addStringToBack();
                      },
                      child: Text("Gravar no Firebase"),
                    ),
                    for (String s in listStrings) Text(s)
                  ],
                ),
                onRefresh: () => _getInformationFromBack(),
              ),
      ),
    );
  }

  Future _getInformationFromBack() {
    return http.get(url).then(
      (value) {
        print(value.body);
        Map<String, dynamic> map = json.decode(value.body);
        listStrings = [];
        map.forEach(
          (key, value) {
            setState(() {
              listStrings.add(map[key]["word"]);
            });
          },
        );
      },
    );
  }

  void _addStringToBack() {
    setState(() {
      this._isLoading = true;
    });
    http.post(url, body: json.encode({"word": _controller.text})).then((value) {
      _getInformationFromBack();
      setState(() {
        this._isLoading = false;
      });

      final snackBar = SnackBar(
          content: Text('A palavra foi gravada!'),
          action: SnackBarAction(
              label: "Dispensar",
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
    _controller.text = "";
  }
}
