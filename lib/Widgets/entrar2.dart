import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'teste.dart';

class Entrar2 extends StatelessWidget {
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
          Continuar(),
        ],
      ),
    );
  }
}

class Continuar extends StatefulWidget {
  @override
  _ContinuarState createState() => _ContinuarState();
}

class _ContinuarState extends State<Continuar> {
  DateTime _date = DateTime.now();
  bool pergunta1 = false;

  Future<Null> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        print(_date);
      });
    }
  }

  void _setStatus(bool? newStatus)
  {
    setState(() {
      pergunta1 = newStatus!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Column(
        children: <Widget>[
          Text(
            "Como preencher o questionário:",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          Divider(
            color: Colors.white,
            height: 30,
          ),
          Text(
            "Todas as perguntas devem ser respondidas marcando ou não marcando.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
          Divider(
            color: Colors.white,
            height: 10,
          ),
          Text(
            "Marque: se você já observou o comportamento do seu filho pelo menos uma vez.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
          Divider(
            color: Colors.white,
            height: 10,
          ),
          Text(
            "Não marque: se você nunca observou o comportamento do seu filho, ou se não tem certeza de como responder à pergunta.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
          Divider(
            color: Colors.white,
            height: 10,
          ),
          Text(
            "É normal que algumas perguntas sejam respondidas e outras não.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
          Divider(
            color: Colors.white,
            height: 10,
          ),
          Text(
            "Antes de inicar o teste, responda a pergunta abaixo",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
          Divider(
            color: Colors.white,
            height: 10,
          ),
          CheckboxListTile(
            title: Text(
              "O seu filho está equipado com IC (s) ou HA (s)?",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            activeColor: Colors.deepPurple,
            value: pergunta1,
            onChanged: (bool? valor) {
              setState(() {
                pergunta1 = valor!;
              });
            },
          ),
          Divider(
            color: Colors.white,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Selecione a data do nascimento\ndo seu filho:",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () {
                  setState(() {
                    selectDate(context);
                  });
                },
              ),
            ],
          ),
          Divider(
            color: Colors.white,
            height: 20,
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
                    builder: (context) => Teste(),
                  ),
                ),
              },
              child: Text(
                "Iniciar teste",
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
