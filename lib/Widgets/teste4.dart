import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:littlears/Widgets/teste5.dart';

class Teste4 extends StatefulWidget {
  @override
  _Teste4State createState() => _Teste4State();
}

class _Teste4State extends State<Teste4> {
  bool pergunta22 = false;
  bool pergunta23 = false;
  bool pergunta24 = false;
  bool pergunta25 = false;
  bool pergunta26 = false;
  bool pergunta27 = false;
  bool pergunta28 = false;

  Future<void> _questionpart4(BuildContext context) async {

    User? user = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection('QuestionResult').doc(user!.uid).update({
      'question21' : pergunta22,
      'question22' : pergunta23,
      'question23' : pergunta24,
      'question24' : pergunta25,
      'question25' : pergunta26,
      'question26' : pergunta27,
      'question27' : pergunta28,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Teste auditivo 4/6"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                title: Text(
                  "Seu filho sabe os nomes dos membros da família?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("Onde está ...: papai, Jane, Mark, ..."),
                activeColor: Colors.deepPurple,
                value: pergunta22,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta22 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho imita sons quando solicitado?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("\"Aaa\", \"ooo\", \"iii\""),
                activeColor: Colors.deepPurple,
                value: pergunta23,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta23 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho segue comandos simples?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("\"Venha aqui!\"; \"Tire seus sapatos!\""),
                activeColor: Colors.deepPurple,
                value: pergunta24,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta24 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho entende perguntas simples?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle:
                    Text("\"Onde está a sua barriga?\"; \"Onde está o papai?\""),
                activeColor: Colors.deepPurple,
                value: pergunta25,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta25 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho traz itens quando solicitado?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("\"Traga-me a bola!\" etc."),
                activeColor: Colors.deepPurple,
                value: pergunta26,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta26 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho imita o som ou as palavras que você diz?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("\"Diga: woof woof\"; \"Diga: carro\""),
                activeColor: Colors.deepPurple,
                value: pergunta27,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta27 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho produz o som certo para um brinquedo?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("\"Vurrm\" com carro, \"muu\" com vaca"),
                activeColor: Colors.deepPurple,
                value: pergunta28,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta28 = valor!;
                  });
                },
              ),
              ButtonTheme(
                minWidth: 150,
                height: 40,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () => {
                    _questionpart4(context),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Teste5(),
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
