import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:littlears/Widgets/popup.dart';

import '../main.dart';
import 'login.dart';


class FormularioC extends StatefulWidget {
  const FormularioC(
      {Key? key, required this.fullName, required this.email, required this.contact, required this.cpf, required this.password})
      : super(key: key);

  final String fullName;
  final String email;
  final String contact;
  final String cpf;
  final String password;

  @override
  _TextosState createState() => _TextosState(fullName: fullName, email: email, contact: contact, cpf: cpf, password: password);

}

class _TextosState extends State<FormularioC> {
  _TextosState({
        Key? key,
        required this.fullName,
        required this.email,
        required this.contact,
        required this.cpf,
        required this.password
      });

  final String fullName;
  final String email;
  final String contact;
  final String cpf;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Novo Registro",
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: <Widget>[
          FormularioCrianca(Name: fullName,Email: email, Contact: contact, Cpf: cpf, Password: password),
        ],
      ),
    );
  }
}

class FormularioCrianca extends StatefulWidget {
  const FormularioCrianca(
      {Key? key, required this.Name, required this.Email, required this.Contact, required this.Cpf, required this.Password})
      : super(key: key);

  final String Name;
  final String Email;
  final String Contact;
  final String Cpf;
  final String Password;

  @override
  _FormularioCrianca createState() => _FormularioCrianca(Name: Name,Email: Email, Contact: Contact, Cpf: Cpf, Password: Password);
}

class _FormularioCrianca extends State<FormularioCrianca> {
  _FormularioCrianca({Key? key, required this.Name, required this.Email,
    required this.Contact, required this.Cpf, required this.Password});

  final String Name;
  final String Email;
  final String Contact;
  final String Cpf;
  final String Password;

  final TextEditingController _childNameController = TextEditingController();
  final TextEditingController _childBirthdateController = TextEditingController();
  final TextEditingController _childImplantDateController = TextEditingController();
  final TextEditingController _childImplantController = TextEditingController();

  Future<void> _userRegister(BuildContext context) async
  {
    final String? childName = _childNameController.text;
    final String? childBirthdate = _childBirthdateController.text;
    final String? childImplantDate = _childImplantDateController.text;
    final String? childImplant = _childImplantController.text;

    print('Apertou em registrar email: ' + Email.toString() + ' senha: ' +
        Password.toString());

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: Email.toString(),
          password: Password.toString());

      print('Usuario criado com sucesso');

      CollectionReference userInfoCollection = FirebaseFirestore.instance
          .collection('UserInfo');
      User? user = FirebaseAuth.instance.currentUser;

      userInfoCollection.doc(user!.uid).set({
        'contact': Contact,
        'cpf': Cpf,
        'fullName': Name
      });


      CollectionReference testCollection = FirebaseFirestore.instance.collection(
          'Child');

      testCollection.doc().set({
        'birthDate': childBirthdate,
        'fullName': childName,
        'implantDate': childImplantDate,
        'implant': childImplant,
        'userId': user.uid
      });

      userCreated(context);

      //Navigator.push(
      //    context,
      //    MaterialPageRoute(
      //      builder: (context) => const App(),
      //    ));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        GenericAlertDialog(context,'Erro ao realizar cadastro','Email não é valido');
      }
      if (e.code == 'weak-password') {
        GenericAlertDialog(context,'Erro ao realizar cadastro','Senha fraca');
      }
      if (e.code == 'email-already-in-use'){
        GenericAlertDialog(context,'Erro ao realizar cadastro','Email ja esta sendo usado');
      }
    }
    catch (ex) {
      GenericAlertDialog(context,'Erro ao realizar cadastro',ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        children: <Widget>[
          const Text(
            "Informações pessoais da criança",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const Divider(
            color: Colors.white,
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              labelText: "Nome Completo",
            ),
            controller: _childNameController,
          ),
          const Divider(
            color: Colors.white,
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.datetime,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              labelText: "Data de nascimento",
            ),
            controller: _childBirthdateController,
            onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context, initialDate: DateTime.now(),
                    firstDate: DateTime(1995), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101)
                );

                if(pickedDate != null ){
                  print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    _childBirthdateController.text = formattedDate; //set output date to TextField value.
                  });
                }else{
                  print("Data não selecionada.");
                }
            },
          ),
          const Divider(
            color: Colors.white,
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.datetime,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              labelText: "Data do implante",
            ),
            controller: _childImplantDateController,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context, initialDate: DateTime.now(),
                  firstDate: DateTime(1995), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101)
              );

              if(pickedDate != null ){
                print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                print(formattedDate); //formatted date output using intl package =>  2021-03-16
                //you can implement different kind of Date Format here according to your requirement

                setState(() {
                  _childImplantDateController.text = formattedDate; //set output date to TextField value.
                });
              }else{
                print("Data não selecionada.");
              }
            },
          ),
          const Divider(
            color: Colors.white,
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              labelText: "Tipo de implante (IC / HA / OUTRO)",
            ),
            controller: _childImplantController,
          ),
          const Divider(
            color: Colors.white,
            height: 30,
          ),
          ButtonTheme(
            minWidth: 150,
            height: 40,
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () => _userRegister(context),
              child: const Text(
                "Enviar",
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
