import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'entrar2.dart';

class Entrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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

  String implantDate = "";
  String implant = "";


  Future<void> _prepareChildInfo() async {

    var db = FirebaseFirestore.instance;

    User? user = FirebaseAuth.instance.currentUser;

    await db.collection("Child").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
        print(doc.data()['userId']);
        if(doc.data()['userId'] == user?.uid){
          implantDate = doc.data()['implantDate'];
          implant = doc.data()['implant'];
        }
      }
    });

    print(implant+" "+implantDate);

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Column(
        children: <Widget>[
          const Text(
            "Questionário Auditivo LittlEars",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              color: Colors.black,
            ),
          ),
          const Divider(
            color: Colors.white,
            height: 30,
          ),
          const Text(
            "Este questionário auditivo foi desenvolvido para rastrear o desenvolvimento auditivo em crianças com "
                "audição normal e em crianças com perda auditiva que receberam implante (s) coclear (s) (IC) ou aparelho (s) "
                "auditivo (s) (AASI). Abrange o desenvolvimento auditivo nos "
                "primeiros 2 anos após uma adaptação de IC ou HA (até 2 anos de idade auditiva) ou "
                "em crianças ouvintes de até 2 anos de idade.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
          const Divider(
            color: Colors.white,
            height: 20,
          ),
          const Text(
            "O questionário inclui questões dependentes da idade com complexidade crescente das respostas auditivas. "
                "Portanto, com uma criança mais nova, menos perguntas serão respondidas SIM.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
          const Divider(
            color: Colors.white,
            height: 30,
          ),
          ButtonTheme(
            minWidth: 150,
            height: 40,
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () => {
                _prepareChildInfo(),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Entrar2(implant: implant, implantDate: implantDate),
                  ),
                ),
              },
              child: const Text(
                "Continuar",
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
    );
  }
}
