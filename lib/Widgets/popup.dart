import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';

GenericAlertDialog(BuildContext context, String Title,String text) {
  // configura o button
  // ignore: deprecated_member_use
  Widget okButton = FlatButton(
    child: const Text(
      "OK",
      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
    ),
    onPressed: () {
      // Navigator.pop(context,true);
      Navigator.of(context, rootNavigator: true).pop();
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text(
      Title,
      style: TextStyle(fontSize: 18),
    ),
    content: Text(
      text,
      style: TextStyle(fontSize: 18),
    ),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

userCreated(BuildContext context) {
  // configura o button
  // ignore: deprecated_member_use
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => App(),
        ),
      );
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text(
      "Cadastro realizado com sucesso!",
      style: TextStyle(fontSize: 18),
    ),
    content: Text(
      "Realize o login para acessar o seu cadastro.",
      style: TextStyle(fontSize: 18),
    ),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

passwordMustMatch(BuildContext context) {
  // configura o button
  // ignore: deprecated_member_use
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
    ),
    onPressed: () => Navigator.pop(context,true),
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text(
      "Erro",
      style: TextStyle(fontSize: 18),
    ),
    content: Text(
      "As senhas devem ser iguais.",
      style: TextStyle(fontSize: 18),
    ),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

emailNotValid(BuildContext context) {
  // configura o button
  // ignore: deprecated_member_use
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
    ),
    onPressed: () => Navigator.pop(context,true),
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text(
      "Erro",
      style: TextStyle(fontSize: 18),
    ),
    content: Text(
      "Email não valido.",
      style: TextStyle(fontSize: 18),
    ),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

passwordEmpty(BuildContext context) {
  // configura o button
  // ignore: deprecated_member_use
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
    ),
    onPressed: () => Navigator.pop(context,true),
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text(
      "Erro",
      style: TextStyle(fontSize: 18),
    ),
    content: Text(
      "Insira a senha.",
      style: TextStyle(fontSize: 18),
    ),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

emailEmpty(BuildContext context) {
  // configura o button
  // ignore: deprecated_member_use
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
    ),
    onPressed: () => Navigator.pop(context,true),
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text(
      "Erro",
      style: TextStyle(fontSize: 18),
    ),
    content: Text(
      "Insira um email.",
      style: TextStyle(fontSize: 18),
    ),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}