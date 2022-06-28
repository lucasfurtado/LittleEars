import 'package:flutter/material.dart';
import 'package:littlears/Widgets/popup.dart';
import 'package:littlears/components/EditarResponsavel.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:core';

class Editar extends StatefulWidget {
  const Editar({Key? key, required EditarResponsavel prepareEdit}) : super(key: key);

  @override
  _Editar createState() => _Editar();

}

class _Editar extends State<Editar> {

  //begin controllers
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  //end controllers

  //begin input masks
  final _maskCPFFormatter = MaskTextInputFormatter(mask: '###.###.###-##', );
  final _maskContactFormatter = MaskTextInputFormatter(mask: '(##) # ####-####', );
  //end input masks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Editar Registro",
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Column(
                children: <Widget>[
                  Text(
                    "Informações pessoais\ndo responsável",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Divider(
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

                ]
            )
          )
        ],
      ),
    );
  }
}