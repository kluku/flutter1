import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: new ListView.builder(
            itemBuilder: (context, index) {
              return new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new CachedNetworkImage(
                        placeholder: new CircularProgressIndicator(),
                        imageUrl: 'https://picsum.photos/64/64/?image=$index',
                        errorWidget: new Icon(Icons.error),
                      ),
                      new Text(' $index'),
                    ],
                  ),
                  new Divider(height: 1.0, indent: 64.0),
                ],
              );
            },
          ),
          floatingActionButton: new MyButton()),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {
          final date = new DateTime.now();
          showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: date.subtract(const Duration(days: 30)),
                  lastDate: date.add(const Duration(days: 30)))
              .then((DateTime value) {
            var alert = new AlertDialog(
              title: new Text("Selected date"),
              content: new Text("${value.year}-${value.month}-${value.day}"),
            );
            showDialog(
                context: context, builder: (BuildContext context) => alert);
          });
        });
  }
}
