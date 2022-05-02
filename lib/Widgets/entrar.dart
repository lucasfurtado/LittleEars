import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'entrar2.dart';

class Entrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Teste de audição",
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: <Widget>[
          Sobre(),
        ],
      ),
    );
  }
}

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Column(
        children: <Widget>[
          Text(
            "Questionário Auditivo LittlEars",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              color: Colors.black,
            ),
          ),
          Divider(
            color: Colors.white,
            height: 30,
          ),
          Text(
            "Este questionário auditivo foi desenvolvido para rastrear o desenvolvimento auditivo em crianças com audição normal e em crianças com perda auditiva que receberam implante (s) coclear (s) (IC) ou aparelho (s) auditivo (s) (AASI). Abrange o desenvolvimento auditivo nos primeiros 2 anos após uma adaptação de IC ou HA (até 2 anos de idade auditiva) ou em crianças ouvintes de até 2 anos de idade.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
          Divider(
            color: Colors.white,
            height: 20,
          ),
          Text(
            "O questionário inclui questões dependentes da idade com complexidade crescente das respostas auditivas. Portanto, com uma criança mais nova, menos perguntas serão respondidas SIM.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
          Divider(
            color: Colors.white,
            height: 30,
          ),
          ButtonTheme(
            minWidth: 150,
            height: 40,
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Entrar2(),
                  ),
                ),
              },
              child: Text(
                "Continuar",
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
    );
  }
}
