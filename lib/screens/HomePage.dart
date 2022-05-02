import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:littlears/screens/LogIn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title, required this.userEmail, required this.counter}) : super(key: key);

  final String title;
  final String userEmail;
  final int counter;

  @override
  State<HomePage> createState() => _HomePageState(Email: userEmail, counterAux: counter);
}

class _HomePageState extends State<HomePage> {
  _HomePageState({Key? key, required this.Email, required this.counterAux});
  final String Email;
  int counterAux;

  //int _counter = 0;


  void _signOut() async {
    await FirebaseAuth.instance.signOut();

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LogIn()));


  }

  void _incrementCounter() {

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      counterAux++;
    });

    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('pushButton');
    users.doc(user!.email).update({'Counter': counterAux})
        .then((value) => print("Valor atualizado Updated"))
        .catchError((error) => print("Falha ao atualizar documento: $error"));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('User logged: ' + widget.userEmail),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counterAux',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: FloatingActionButton(
        onPressed: _signOut,
        child: const Icon(Icons.arrow_back_ios_outlined),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


