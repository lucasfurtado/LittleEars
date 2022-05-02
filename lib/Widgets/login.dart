import 'dart:io';

import 'registro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'entrar.dart';

class Textos extends StatefulWidget {
  @override
  _TextosState createState() => _TextosState();
}

class _TextosState extends State<Textos> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      //olhar outra forma de sair do app
      onWillPop: () async => exit(0),
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
            Divider(
              color: Colors.white,
              height: 20,
            ),
            // TEXTO
            Text(
              "Seja bem-vindo",
              style: TextStyle(fontSize: 28),
            ),
            //DIVISORIA
            Divider(
              color: Colors.white,
              height: 20,
            ),
            //PRIMEIRO FORMULARIO
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: "E-mail",
              ),
            ),
            Divider(
              color: Colors.white,
              height: 20,
            ),
            //SEGUNDO FORMULARIO
            TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20),
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
              ),
            ),
            //DIVISORIA
            Divider(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Entrar(),
                    ),
                  ),
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(fontSize: 18),
                ),
                color: Colors.white,
                splashColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
            Divider(
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
                      builder: (context) => Registro(),
                    ),
                  ),
                },
                child: Text(
                  "Registre-se",
                  style: TextStyle(fontSize: 18),
                ),
                color: Colors.white,
                splashColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
