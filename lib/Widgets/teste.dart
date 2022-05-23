import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:littlears/Widgets/teste2.dart';

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  bool pergunta2 = false;
  bool pergunta3 = false;
  bool pergunta4 = false;
  bool pergunta5 = false;
  bool pergunta6 = false;
  bool pergunta7 = false;
  bool pergunta8 = false;

  Future<void> _questionpart1(BuildContext context)async {
    CollectionReference userInfoCollection = FirebaseFirestore.instance
        .collection('QuestionResult');
    User? user = FirebaseAuth.instance.currentUser;

    userInfoCollection.doc(user!.uid).set({
      'question1': pergunta2,
      'question2': pergunta3,
      'question3': pergunta4,
      'question4': pergunta5,
      'question5': pergunta6,
      'question6': pergunta7,
      'question7': pergunta8,

    });
    /*
    FirebaseFirestore.instance.collection('QuestionResult').doc(user.uid).update({
      'question10' : false
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Teste auditivo 1/6"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                title: const Text(
                  "Seu filho responde a uma voz familiar?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("Sorrisos; olha para a fonte; fala animadamente."),
                activeColor: Colors.deepPurple,
                value: pergunta2,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta2 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho ouve alguém falando?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                    "Escuta; espera e escuta; olha para o alto-falante por mais tempo."),
                activeColor: Colors.deepPurple,
                value: pergunta3,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta3 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Quando alguém está falando, seu filho vira a cabeça em direção ao interlocutor?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                activeColor: Colors.deepPurple,
                value: pergunta4,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta4 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho se interessa por brinquedos que produzam sons ou música?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("Chocalho, brinquedo espremedor."),
                activeColor: Colors.deepPurple,
                value: pergunta5,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta5 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho procura um alto-falante que não consegue ver?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("Chocalho, brinquedo espremedor."),
                activeColor: Colors.deepPurple,
                value: pergunta6,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta6 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho ouve quando o rádio / CD / toca-fitas está ligado?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                    "Ouvir: volta-se para o som, fica atento, ri ou canta / fala “junto”."),
                activeColor: Colors.deepPurple,
                value: pergunta7,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta7 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho responde a sons distantes?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("Ao ser chamado de outra sala."),
                activeColor: Colors.deepPurple,
                value: pergunta8,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta8 = valor!;
                  });
                },
              ),
              ButtonTheme(
                minWidth: 150,
                height: 40,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () => {
                    _questionpart1(context),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Teste2(),
                      ),
                    ),
                  },
                  child: Text(
                    "Próxima pagina",
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
      ),
    );
  }
}
