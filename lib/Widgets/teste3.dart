import 'package:flutter/material.dart';
import 'package:littlears/Widgets/teste4.dart';

class Teste3 extends StatefulWidget {
  @override
  _Teste3State createState() => _Teste3State();
}

class _Teste3State extends State<Teste3> {
  bool pergunta16 = false;
  bool pergunta17 = false;
  bool pergunta18 = false;
  bool pergunta19 = false;
  bool pergunta20 = false;
  bool pergunta21 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Teste auditivo 3/6"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(children: <Widget>[
          CheckboxListTile(
            title: Text(
              "Quando seu filho está triste ou mal-humorado, ele pode se acalmar ou ser influenciado pela música?",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            activeColor: Colors.deepPurple,
            value: pergunta16,
            onChanged: (bool? valor) {
              setState(() {
                pergunta16 = valor!;
              });
            },
          ),
          CheckboxListTile(
            title: Text(
              "Seu filho escuta ao telefone e parece reconhecer que alguém está falando?",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Text(
                "Quando a avó ou o papai ligam, a criança pega o fone e \"escuta\"."),
            activeColor: Colors.deepPurple,
            value: pergunta17,
            onChanged: (bool? valor) {
              setState(() {
                pergunta17 = valor!;
              });
            },
          ),
          CheckboxListTile(
            title: Text(
              "Seu filho responde à música com movimentos rítmicos?",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle:
                Text("A criança move os braços / pernas ao som da música."),
            activeColor: Colors.deepPurple,
            value: pergunta18,
            onChanged: (bool? valor) {
              setState(() {
                pergunta18 = valor!;
              });
            },
          ),
          CheckboxListTile(
            title: Text(
              "Seu filho sabe que certo som está relacionado a certo objeto ou evento?",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Text(
                "A criança ouve o som de um avião e olha para o céu, ou ouve um carro e olha para a rua."),
            activeColor: Colors.deepPurple,
            value: pergunta19,
            onChanged: (bool? valor) {
              setState(() {
                pergunta19 = valor!;
              });
            },
          ),
          CheckboxListTile(
            title: Text(
              "Seu filho responde apropriadamente a comentários curtos e simples?",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Text("\"Pare!\" \"Que nojo!\" \"Não!\""),
            activeColor: Colors.deepPurple,
            value: pergunta20,
            onChanged: (bool? valor) {
              setState(() {
                pergunta20 = valor!;
              });
            },
          ),
          CheckboxListTile(
            title: Text(
              "Seu filho responde a \"Não\" interrompendo sua atividade atual?",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Text(
                "Um \"não, não!\" Fortemente pronunciado - embora a criança não te veja (!) - é eficaz."),
            activeColor: Colors.deepPurple,
            value: pergunta21,
            onChanged: (bool? valor) {
              setState(() {
                pergunta21 = valor!;
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
                    builder: (context) => Teste4(),
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
