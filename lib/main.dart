import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Swipe it!',
      theme: new ThemeData(
        primarySwatch: Colors.cyan,
      ),
       home: new MyHome(),
    );
  }
}
class MyHome extends StatelessWidget {
  final List<String>  items = new List<String>.generate(30, (i) => "Item ${i+1}");


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
         title:new Text("Swipe it!"),
      ),
      body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,int index){
            final item = items[index];
            return new Dismissible(
                key: new Key(items[index]),
                onDismissed: (direction){
                  items.removeAt(index);
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(
                          content: new Text("Dismissd")
                      )
                  );
                },
                background: new Container(
                  color:Colors.redAccent,
                ),
                child: new ListTile(
                  title: new Text("${items[index]}"),

                ));
          }),

    );
  }
}
