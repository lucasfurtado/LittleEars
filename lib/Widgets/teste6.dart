import 'package:flutter/material.dart';

class Teste6 extends StatefulWidget {
  @override
  _Teste6State createState() => _Teste6State();
}

class _Teste6State extends State<Teste6> {
  bool pergunta35 = false;
  bool pergunta36 = false;
  bool pergunta37 = false;
  bool pergunta38 = false;
  bool pergunta39 = false;
  bool pergunta40 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Teste auditivo 6/6"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              title: Text(
                "O seu filho gosta de ouvir leituras?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text("O seu filho gosta de ouvir leituras?"),
              activeColor: Colors.deepPurple,
              value: pergunta35,
              onChanged: (bool? valor) {
                setState(() {
                  pergunta35 = valor!;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Seu filho segue comandos complexos?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text("\"Tire os sapatos e venha aqui\""),
              activeColor: Colors.deepPurple,
              value: pergunta36,
              onChanged: (bool? valor) {
                setState(() {
                  pergunta36 = valor!;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Seu filho tenta cantar canções conhecidas?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text("Canção de ninar"),
              activeColor: Colors.deepPurple,
              value: pergunta37,
              onChanged: (bool? valor) {
                setState(() {
                  pergunta37 = valor!;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                "Seu filho tenta cantar canções conhecidas?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text("Canção de ninar"),
              activeColor: Colors.deepPurple,
              value: pergunta38,
              onChanged: (bool? valor) {
                setState(() {
                  pergunta38 = valor!;
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
                  "Gerar resultados",
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
