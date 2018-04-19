import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

final MyDrawer _drawer = new MyDrawer();

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => new _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
          children: <Widget> [
            new DrawerHeader(
              child: new Text("Header"),
            ),
            new ListTile(
                leading: new Icon(Icons.android),
                title: new Text("Another Page"),
                onTap: () {
                  Navigator.of(context)
                    ..pop()
                    ..pushNamed(AnotherPage.routeName);
                }
            ),
          ]
      ),
    );
  }
}


/// Material App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        AnotherPage.routeName: (BuildContext context) =>
        new AnotherPage(title: "AnotherPage"),
      },
    );
  }
}

// place : "/"
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: _drawer,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Text(
          'Button tapped $_counter time${ _counter == 1 ? '' : 's' }.',
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),);
  }
}

// place : "/AnotherPage"
class AnotherPage extends StatefulWidget {
  AnotherPage({Key key, this.title}) : super(key: key);

  static const String routeName = "/AnotherPage";

  final String title;

  @override
  _AnotherPageState createState() => new _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: _drawer,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onFloatingActionButtonPressed,
        tooltip: 'Add',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _onFloatingActionButtonPressed() {
  }
}