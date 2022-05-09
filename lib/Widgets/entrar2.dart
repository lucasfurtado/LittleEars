import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'teste.dart';

class Entrar2 extends StatelessWidget {
  const Entrar2({Key? key, required this.implant, required this.implantDate}) : super(key: key);

  final String implant;
  final String implantDate;


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
          Continuar(implant: implant,implantDate: implantDate,),
        ],
      ),
    );
  }
}

class Continuar extends StatefulWidget {
  Continuar({Key? key,required this.implant, required this.implantDate}) : super(key: key);

  String implant;
  String implantDate;

  @override
  _ContinuarState createState() => _ContinuarState(implant: implant, implantDate: implantDate);
}

class _ContinuarState extends State<Continuar> {
   _ContinuarState({Key? key,required this.implant,required this.implantDate});

  late final String implant;
  late final String implantDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Column(
        children: <Widget>[
          const Text(
            "Como preencher o questionário:",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          const Divider(
            color: Colors.white,
            height: 30,
          ),
          const Text(
            "Todas as perguntas devem ser respondidas marcando ou não marcando.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
          const Divider(
            color: Colors.white,
            height: 10,
          ),
          const Text(
            "Marque: se você já observou o comportamento do seu filho pelo menos uma vez.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
          const Divider(
            color: Colors.white,
            height: 10,
          ),
          const Text(
            "Não marque: se você nunca observou o comportamento do seu filho, ou se não tem certeza de como responder à pergunta.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
          const Divider(
            color: Colors.white,
            height: 10,
          ),
          const Text(
            "É normal que algumas perguntas sejam respondidas e outras não.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
          Divider(
            color: Colors.white,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "O seu filho está equipado com: " + implant,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.white,
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Data do nascimento\ndo seu filho: " + implantDate,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const Divider(
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
              child: const Text(
                "Iniciar teste",
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
