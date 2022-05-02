

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/Editor.dart';
import 'LogIn.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const String _title = "Tela de Registro";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),),
        body: const SignInComponent(),
      ),
    );
  }
}

class SignInComponent extends StatefulWidget{
  const SignInComponent({Key? key}) : super(key: key);

  State<SignInComponent> createState() => _SignInComponent();
}

class _SignInComponent extends State<SignInComponent>{

  final TextEditingController _controladorCampoEmail = TextEditingController();
  final TextEditingController _controladorCampoSenha = TextEditingController();

  Future<void> _criaUsuario(BuildContext context) async {

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
                onPressed: () => _criaUsuario(context),
                child: Text('Registrar'),
              )
            ],
          )
      ),
    );
  }
}