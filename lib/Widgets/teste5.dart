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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Teste auditivo 5/6"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(children: <Widget>[
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
                "Sons de animais, sons de eletrodomésticos, sirene de carro de polícia."),
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
              "Seu filho repete corretamente uma sequência de sílabas curtas e longas que você disse?",
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
              "Seu filho seleciona o objeto certo de uma série de objetos quando solicitado?",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Text(
                "Você está brincando com bichinhos de brinquedo e pede o \"cavalo\"; você está jogando com bolas coloridas e pede a \"bola vermelha\"."),
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
              "Seu filho tenta cantar junto ao ouvir uma música?",
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
            subtitle: Text("Diga 'Tchau - Tchau' para a vovó"),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Teste6(),
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
        ]),
      ),
    );
  }
}
