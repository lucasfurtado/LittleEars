import 'package:flutter/material.dart';
import 'package:littlears/Widgets/popup.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'registro2.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

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
          Forumlario(),
        ],
      ),
    );
  }
}

class Forumlario extends StatelessWidget {

  //begin controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  //end controllers

  //begin input masks
  final _maskCPFFormatter = MaskTextInputFormatter(mask: '###.###.###-##', );
  final _maskContactFormatter = MaskTextInputFormatter(mask: '(##) # ####-####', );
  final _maskContact2Formatter = MaskTextInputFormatter(mask: '(##) ####-####', );
  //end input masks

  //begin validate methods
  bool _nameValidation(fullName,BuildContext context){
    try{
      if(fullName.isNotEmpty){
        return true;
      } else{
        GenericAlertDialog(context,'Erro ao registrar','Insira um nome');
        return false;
      }
    } on Exception catch(exception){
      //TODO LOG
      print('Ocorreu um erro inesperado ' + exception.toString());
      return false;
    }
  }

  bool _emailValidation(String email, BuildContext context){
    try{
      if(EmailValidator.validate(email)){
        return true;
      } else{
        GenericAlertDialog(context,'Erro ao registrar','Insira um email válido');
        return false;
      }
    } on Exception catch (exception){
      //TODO LOG
      print('Ocorreu um erro inesperado ' + exception.toString());
    }
    return EmailValidator.validate(email);
  }

  bool _contactValidation(String contact, BuildContext context){
    try{
      if(contact.length == 16 || contact.length == 14){
        return true;
      } else{
        GenericAlertDialog(context,'Erro ao registrar','Coloque um número de contato válido');
        return false;
      }
    } on Exception catch(exception){
      //TODO LOG
      print('Ocorreu um erro inesperado' + exception.toString());
      return false;
    }
  }

  bool _cpfValidation(String cpf, BuildContext context){
    try{
      if(cpf.length == 14){
        return true;
      } else{
        GenericAlertDialog(context,'Erro ao registrar','CPF deve conter 11 números.');
        return false;
      }
    } on Exception catch (exception){
      //TODO LOG
      print('Ocorreu um erro inesperado' + exception.toString());
      return false;
    }
  }

  bool _passwordMatch(String password, String confirmPassword, BuildContext context){
    try{
      if(password == confirmPassword){
        return true;
      } else {
        GenericAlertDialog(context,'Erro ao registrar','As senhas devem coincidir.');
        return false;
      }
    } on Exception catch(exception){
      //TODO LOG
      print('Ocorreu um erro inesperado ' + exception.toString());
      return false;
    }
  }

  bool _validateData(String fullName, String email, String contact, String cpf, String password, String confirmPassword, BuildContext context){
    try{
      if(_nameValidation(fullName, context) && _emailValidation(email, context) && _contactValidation(contact, context) && _cpfValidation(cpf, context) && _passwordMatch(password, confirmPassword, context)){
        return true;
      } else{
        return false;
      }
    } on Exception catch(exception){
      //TODO LOG
      print('Ocorreu um erro inesperado ' + exception.toString());
      return false;
    }
  }
  //end validate methods

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        children: <Widget>[
          const Text(
            "Informações pessoais\ndo responsável",
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
          TextField(
            keyboardType: TextInputType.name,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              labelText: "Nome Completo",
            ),
            controller: _fullNameController,
          ),
          const Divider(
            color: Colors.white,
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              labelText: "E-mail",
            ),
            controller: _emailController,
          ),
          const Divider(
            color: Colors.white,
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              labelText: "Telefone para contato",
            ),
            controller: _contactController,
            inputFormatters: _contactController.text.length == 16 ? [_maskContactFormatter,] : [_maskContact2Formatter,],    //this isn't making any sense now just ignore it

          ),
          const Divider(
            color: Colors.white,
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              labelText: "CPF",
            ),
            controller: _cpfController,
            inputFormatters: [_maskCPFFormatter,],
          ),
          const Divider(
            color: Colors.white,
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.text,
            obscureText: true,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              labelText: "Senha",
            ),
            controller: _passwordController,
          ),
          const Divider(
            color: Colors.white,
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.text,
            obscureText: true,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              labelText: "Confirmar senha",
            ),
            controller: _confirmPasswordController,
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
              onPressed: () => {
                if(_validateData(_fullNameController.text, _emailController.text, _contactController.text, _cpfController.text, _passwordController.text, _confirmPasswordController.text, context)){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormularioC(
                        fullName: _fullNameController.text,
                        contact: _contactController.text,
                        cpf: _cpfController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    ),
                  ),
                }
              },
              child: const Text(
                "Próxima página",
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
