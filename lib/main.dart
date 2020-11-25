import 'dart:ui';

import 'package:demo_flutter/secondScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (BuildContext context) =>
            MyHomePage(title: 'Flutter Demo Home Page'),
        '/nextRoute': (BuildContext context) => NextPage()
      },
      initialRoute: '/',
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(int a) {
    setState(() {
      _counter += a;
    });
  }

  var keyPad = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [0, -1, -2]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  RawMaterialButton(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    fillColor: Color(0xffFF0000),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/nextRoute');
                    },
                    child: Text('Goto Next'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: keyPad
                    .map((item) => Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: item
                                .map((itemKey) => Expanded(
                                    flex: 1,
                                    child: buildRawMaterialButton(
                                        context, itemKey)))
                                .toList(),
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  RawMaterialButton buildRawMaterialButton(BuildContext context, int itemKey) {
    return RawMaterialButton(
      constraints: BoxConstraints(minHeight: double.infinity),
      fillColor: Color(0xffd9d9d9),
      splashColor: Color(0xffd8dce6),
      shape: Border.all(width: 1, color: Color(0xFFcecece)),
      onPressed: () => _incrementCounter(itemKey),
      child: itemKey >= -1
          ? Text(
              itemKey >= 0 ? '$itemKey' : '.',
              textScaleFactor: 2,
            )
          : Icon(
              Icons.backspace,
            ),
    );
  }
}
