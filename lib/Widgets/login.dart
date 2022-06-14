import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:littlears/Widgets/popup.dart';

import 'entrar2.dart';
import 'registro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'entrar.dart';

class Textos extends StatefulWidget {
  @override
  _TextosState createState() => _TextosState();
}

class _TextosState extends State<Textos> {

  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();

  Future<void> _loginCheck(BuildContext context, String userName, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userName.toString(),
          password: password.toString()
      );

      var thisUser = userCredential.user;

      if(thisUser != null){
        if(thisUser.emailVerified){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Entrar()));
        }
        else{
          GenericAlertDialog(context, 'Email não verificado.', 'Verifique sua caixa de email.');
        }
      }

      print('Logado');

      //int response = 0;
      //CollectionReference pushCollection = FirebaseFirestore.instance.collection('pushButton');
      //var docSnapshot = await pushCollection.doc(userName).get();
      //if (docSnapshot.exists) {
      //  Map<String, dynamic>? data = docSnapshot.data() as Map<String,
      //      dynamic>?;
      //  response = data?['Counter'];
      //}



    } on FirebaseAuthException catch (exception) {
      print('Ocorreu um erro inesperado '+ exception.toString());
      if(exception.code == 'invalid-email'){
        GenericAlertDialog(context, 'Erro ao fazer login', 'Email invalido');
      }
      else if(exception.code == 'user-not-found'){
        GenericAlertDialog(context, 'Erro ao fazer login', 'Email não registrado');
      }
      else if(exception.code == 'wrong-password'){
        GenericAlertDialog(context, 'Erro ao fazer login', 'Senha errada');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //olhar outra forma de sair do app
      onWillPop: () async => exit(0),
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
            const Divider(
              color: Colors.white,
              height: 20,
            ),
            // TEXTO
            const Text(
              "Seja bem-vindo",
              style: TextStyle(fontSize: 28),
            ),
            //DIVISORIA
            const Divider(
              color: Colors.white,
              height: 20,
            ),
            //PRIMEIRO FORMULARIO
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                labelText: "E-mail",
              ),
              controller: _userEmailController,
            ),
            const Divider(
              color: Colors.white,
              height: 20,
            ),
            //SEGUNDO FORMULARIO
            TextFormField(
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 20),
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
              ),
              controller: _userPasswordController,
            ),
            //DIVISORIA
            const Divider(
              color: Colors.white,
              height: 50,
            ),
            //BOTÃO PARA ENVIAR
            ButtonTheme(
              minWidth: 150,
              height: 40,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () => {
                  _loginCheck(context, _userEmailController.text, _userPasswordController.text)
                },
                child: const Text(
                  "Entrar",
                  style: TextStyle(fontSize: 18),
                ),
                color: Colors.white,
                splashColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
              height: 20,
            ),
            //BOTÃO PARA CADASTRAR
            ButtonTheme(
              minWidth: 150,
              height: 40,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Registro(),
                    ),
                  ),
                },
                child: const Text(
                  "Registre-se",
                  style: TextStyle(fontSize: 18),
                ),
                color: Colors.white,
                splashColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
