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

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final _maskCPFFormatter = MaskTextInputFormatter(mask: '###.###.###-##', );
  final _maskContactFormatter = MaskTextInputFormatter(mask: '(##) # ####-####', );

  bool _emailValidation(String email){
    return EmailValidator.validate(email);
  }


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
              labelText: "E-mail *",
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
            inputFormatters: [_maskContactFormatter,],
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
              labelText: "Senha *",
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
              labelText: "Confirmar senha *",
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
                if(_passwordController.text.isNotEmpty){
                  if(_emailController.text.isNotEmpty){
                    if(_passwordController.text == _confirmPasswordController.text){
                      if(_emailValidation(_emailController.text)){
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
                      } else{
                        emailNotValid(context),
                      }
                    } else{
                      passwordMustMatch(context),
                    }
                  } else{
                    emailEmpty(context),
                  }
                } else {
                  passwordEmpty(context),
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
