import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:pokemon_app/model/pokemon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'POKEMONE APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getdata(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Pokemon> data = snapshot.data;
                    print(data.length);
                    return loadList(data);
                  } else {
                    return LinearProgressIndicator();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  getdata() async {
    var response = await http.get(
        'https://gist.githubusercontent.com/scitbiz/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json');
    print(response.body);
    List<Pokemon> pokemons = pokemonFromJson(response.body);
    return pokemons;
  }

  Widget loadList(List<Pokemon> data) {
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
           
            Get.defaultDialog(
                backgroundColor: Colors.lightBlue,
                title: "this is ${data[index].name}",
                middleText: data[index].xdescription + "\n" + data[index].ydescription);
          },
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 66,
                    height: 66,
                    child: Image.network(data[index].imageurl)),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                          text: data[index].name,
                          style:
                              TextStyle(fontSize: 22, color: Colors.blueAccent),
                          children: <TextSpan>[
                            TextSpan(
                                text: "        " + data[index].category,
                                style: TextStyle(
                                    fontSize: 22, color: Colors.redAccent))
                          ]),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) =>
          Divider(height: 1.0, color: Colors.white),
    );
  }
}
