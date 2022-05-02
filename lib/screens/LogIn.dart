import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:littlears/screens/HomePage.dart';
import 'package:littlears/screens/SignIn.dart';

import '../components/Editor.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  static const String _title = "Tela de Login";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),),
        body: const LogInComponent(),
      ),
    );
  }
}

class LogInComponent extends StatefulWidget{
  const LogInComponent({Key? key}) : super(key: key);

  State<LogInComponent> createState() => _LogInComponent();
}

class _LogInComponent extends State<LogInComponent>{

  final TextEditingController _controladorCampoEmail = TextEditingController();
  final TextEditingController _controladorCampoSenha = TextEditingController();

  Future<void> _logaUsuario(BuildContext context) async {
    final String? email = _controladorCampoEmail.text;
    final String? password = _controladorCampoSenha.text;

    print('Apertou em Logar email: ' + email.toString() + ' senha: ' +
        password.toString());

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.toString(),
          password: password.toString()
      );

      print('Logado');

      String auxTittle = 'Welcome';

      int response = 0;
      CollectionReference pushCollection = FirebaseFirestore.instance.collection('pushButton');
      var docSnapshot = await pushCollection.doc(email).get();
      if (docSnapshot.exists) {
        Map<String, dynamic>? data = docSnapshot.data() as Map<String,
            dynamic>?;
        response = data?['Counter'];
      }

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage(title: auxTittle, userEmail: userCredential.user!.email.toString(),counter: response,)));

    } on FirebaseAuthException catch (e) {
      print(e.message);
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(controlador: _controladorCampoEmail, value: 'Email', label: 'Digite seu email',isPassword: false,),
              Editor(controlador: _controladorCampoSenha, value: 'Senha', label: 'Digite sua senha',isPassword: true,),
              ElevatedButton(
                onPressed: () => _logaUsuario(context),
                child: Text('Logar'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()));},
                child: Text('Registrar'),
              )
            ],
          )
      ),
    );
  }
}