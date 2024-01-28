import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/appPlugin.dart';




void main() => runApp(const MyModuleApp());

class MyModuleApp extends StatelessWidget {
  const MyModuleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyModuleApp Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'MyModuleApp Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("getFromNative initState 1");
    platform.setMethodCallHandler(
      (call) {
        debugPrint("getFromNative initState");
        return getFromNative(call).then((value) {
          _counter=int.parse(value!);
          setState(() {

          });
        });
      },
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'isDebug: $kDebugMode\n'
              'isRelease: $kReleaseMode\n'
              'isProfile: $kProfileMode\n',
            ), const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
