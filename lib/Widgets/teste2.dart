import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:littlears/Widgets/teste3.dart';

class Teste2 extends StatefulWidget {
  @override
  _Teste2State createState() => _Teste2State();
}

class _Teste2State extends State<Teste2> {
  bool pergunta9 = false;
  bool pergunta10 = false;
  bool pergunta11 = false;
  bool pergunta12 = false;
  bool pergunta13 = false;
  bool pergunta14 = false;
  bool pergunta15 = false;

  Future<void> _questionpart2(BuildContext context) async {

    User? user = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection('QuestionResult').doc(user!.uid).update({
      'question8' : pergunta9,
      'question9' : pergunta10,
      'question10' : pergunta11,
      'question11' : pergunta12,
      'question12' : pergunta13,
      'question13' : pergunta14,
      'question14' : pergunta15
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Teste auditivo 2/6"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                title: Text(
                  "Seu filho para de chorar quando você fala com ele sem que ele veja você?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                    "Você tenta confortar a criança com uma voz suave ou uma música sem contato visual."),
                activeColor: Colors.deepPurple,
                value: pergunta9,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta9 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho responde com alarme ao ouvir uma voz irritada?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("A criança fica triste e começa a chorar."),
                activeColor: Colors.deepPurple,
                value: pergunta10,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta10 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho responde com alarme ao ouvir uma voz irritada?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("A criança fica triste e começa a chorar."),
                activeColor: Colors.deepPurple,
                value: pergunta11,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta11 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho \"reconhece\" rituais acústicos?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                    "Caixa musical ao lado da cama; canção de ninar; água correndo para a banheira."),
                activeColor: Colors.deepPurple,
                value: pergunta12,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta12 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho procura fontes de som localizadas à esquerda, à direita ou atrás?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                    "Você liga ou diz algo, o cachorro late, etc. e a criança procura e encontra as fontes."),
                activeColor: Colors.deepPurple,
                value: pergunta13,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta13 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho reage ao seu nome?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                activeColor: Colors.deepPurple,
                value: pergunta14,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta14 = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  "Seu filho procura fontes de som localizadas acima ou abaixo?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                subtitle: Text("Um relógio na parede ou algo caindo no chão."),
                activeColor: Colors.deepPurple,
                value: pergunta15,
                onChanged: (bool? valor) {
                  setState(() {
                    pergunta15 = valor!;
                  });
                },
              ),
              ButtonTheme(
                minWidth: 150,
                height: 40,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () => {
                    _questionpart2(context),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Teste3(),
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
