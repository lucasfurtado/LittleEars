import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:littlears/Widgets/teste6.dart';

class Teste5 extends StatefulWidget {
  @override
  _Teste5State createState() => _Teste5State();
}

class _Teste5State extends State<Teste5> {
  bool pergunta29 = false;
  bool pergunta30 = false;
  bool pergunta31 = false;
  bool pergunta32 = false;
  bool pergunta33 = false;
  bool pergunta34 = false;

  Future<void> _questionpart5(BuildContext context) async {

    User? user = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection('QuestionResult').doc(user!.uid).update({
      'question28' : pergunta29,
      'question29' : pergunta30,
      'question30' : pergunta31,
      'question31' : pergunta32,
      'question32' : pergunta33,
      'question33' : pergunta34,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Teste auditivo 5/6"),
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
                "Seu filho sabe que certos sons combinam com certos animais?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text("Au au = cachorro; miau = gato;"),
              activeColor: Colors.deepPurple,
              value: pergunta29,
              onChanged: (bool? valor) {
                setState(() {
                  pergunta29 = valor!;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Seu filho tenta imitar os sons ambientais?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                  "Sons de animais, sons de eletrodom??sticos, sirene de carro de pol??cia."),
              activeColor: Colors.deepPurple,
              value: pergunta30,
              onChanged: (bool? valor) {
                setState(() {
                  pergunta30 = valor!;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Seu filho repete corretamente uma sequ??ncia de s??labas curtas e longas que voc?? disse?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text("La-la-laaa"),
              activeColor: Colors.deepPurple,
              value: pergunta31,
              onChanged: (bool? valor) {
                setState(() {
                  pergunta31 = valor!;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Seu filho seleciona o objeto certo de uma s??rie de objetos quando solicitado?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                  "Voc?? est?? brincando com bichinhos de brinquedo e pede o \"cavalo\"; voc?? est?? jogando com bolas coloridas e pede a \"bola vermelha\"."),
              activeColor: Colors.deepPurple,
              value: pergunta32,
              onChanged: (bool? valor) {
                setState(() {
                  pergunta32 = valor!;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Seu filho tenta cantar junto ao ouvir uma m??sica?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text("Poesia infantil."),
              activeColor: Colors.deepPurple,
              value: pergunta33,
              onChanged: (bool? valor) {
                setState(() {
                  pergunta33 = valor!;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Seu filho repete certas palavras quando perguntadas?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text("Diga 'Tchau - Tchau' para a vov??"),
              activeColor: Colors.deepPurple,
              value: pergunta34,
              onChanged: (bool? valor) {
                setState(() {
                  pergunta34 = valor!;
                });
              },
            ),
            ButtonTheme(
              minWidth: 150,
              height: 40,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () => {
                  _questionpart5(context),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Teste6(),
                    ),
                  ),
                },
                child: Text(
                  "Pr??xima pagina",
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
          ]),
        ),
      ),
    );
  }
}
