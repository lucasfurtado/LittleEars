import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class FormularioC extends StatelessWidget {
  const FormularioC({Key? key, required this.fullName, required this.email, required this.contact, required this.cpf, required this.password}) : super(key: key);

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

class FormularioCrianca extends StatelessWidget {

  FormularioCrianca({Key? key, required this.Name, required this.Email,
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

    print('Apertou em registrar email: '+ Email.toString() + ' senha: '+ Password.toString());

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: Email.toString(),
          password: Password.toString());

      print('Usuario criado com sucesso');

    } on FirebaseAuthException catch(e){
      if(e.code == 'invalid-email')
        print('Formato de email errado.');
      if(e.code == 'weak-password')
        print('Senha fraca.');
    }
    catch(ex){
      print(ex);
    }

    CollectionReference userInfoCollection = FirebaseFirestore.instance.collection('UserInfo');
    User? user = FirebaseAuth.instance.currentUser;

    userInfoCollection.doc(user!.uid).set({
      'contact': Contact,
      'cpf': Cpf,
      'fullName': Name
    });


    CollectionReference testCollection = FirebaseFirestore.instance.collection('Child');

    testCollection.doc().set({
      'birthDate': childBirthdate,
      'fullName': childName,
      'implantDate': childImplantDate,
      'implant' : childImplant,
      'userId': user.uid
    });

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
            onTap: (){

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
