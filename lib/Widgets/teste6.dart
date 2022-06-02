import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../screens/PlotGraphOne.dart';

class Teste6 extends StatefulWidget {
  @override
  _Teste6State createState() => _Teste6State();
}

class _Teste6State extends State<Teste6> {
  bool pergunta35 = false;
  bool pergunta36 = false;
  bool pergunta37 = false;
  bool pergunta38 = false;

  late double _xLate = 0;
  late double _yLate = 0;


  Future<void> _questionpart6(BuildContext context) async {

    User? user = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection('QuestionResult').doc(user!.uid).update({
      'question34' : pergunta35,
      'question35' : pergunta36,
      'question36' : pergunta37,
      'question37' : pergunta38,

    });
  }

  Future<void> _y () async{
    double y = 0;
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference result = FirebaseFirestore.instance.collection('QuestionResult');

    var docSnapshot = await result.doc(user?.uid).get();

    for(int i=1 ; i <= 37; i++){
      bool result = docSnapshot.get('question$i');
      if(result){
        y++;
      }
    }
    _yLate = y;
  }

  Future<void> _x () async{
    User? user = FirebaseAuth.instance.currentUser;
    late Timestamp childAge;
    await FirebaseFirestore.instance.collection("Child").get().then((event) {
      for (var doc in event.docs) {
        if(doc.data()['userId'] == user?.uid){
          print('Achou');
          childAge = doc.data()['birthDate'];
        }
      }
    });

    var childDate = childAge.toDate();

    DateDuration duration;
    duration = AgeCalculator.age(childDate);
    _xLate = duration.months + duration.years*12;
  }

  Future<FlSpot> _buscaResultado(BuildContext context) async{

    double x = 0;
    double y = 0;

    late Timestamp childAge;

    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference result = FirebaseFirestore.instance.collection('QuestionResult');

    var docSnapshot = await result.doc(user?.uid).get();

    for(int i=1 ; i <= 37; i++){
      bool result = docSnapshot.get('question$i');
      if(result){
        y++;
      }
    }

    await FirebaseFirestore.instance.collection("Child").get().then((event) {
      for (var doc in event.docs) {
        //print("${doc.id} => ${doc.data()}");
        //print(doc.data()['userId']);
        if(doc.data()['userId'] == user?.uid){
          print('Achou');
          childAge = doc.data()['birthDate'];
        }
      }
    });

    var childDate = childAge.toDate();
    //var dateNow = DateTime.now();
    //var difference = dateNow.difference(childDate).inDays;

    DateDuration duration;
    duration = AgeCalculator.age(childDate);
    x = duration.months + duration.years*12;
    //var difference = dateNow.difference(childDate).inDays;

    return FlSpot(x, y);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Teste auditivo 6/6"),
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
                    _questionpart6(context),
                    _x(),
                    _y(),

                    Future.delayed(const Duration(milliseconds: 2000), (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlotGraphOne(x: _xLate,y: _yLate,),
                        ),
                      );
                    }),
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
      ),
    );
  }
}
