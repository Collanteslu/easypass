// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';

class PasswordGenerator extends StatefulWidget {
  const PasswordGenerator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PasswordGenerator> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PasswordGenerator> {
  String _password = "";

  bool simbol = true;
  bool number = true;
  bool lowercase = true;
  bool uppercase = true;
  int passwordLength = 8;

  void _getPassword() {
    setState(() {
      _password = generatePassword(
          passwordLength, simbol, number, lowercase, uppercase);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(100.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //creamos un select del 1 al 32 para el numero de caracteres
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Número de caracteres:   "),
                  DropdownButton<int>(
                    value: passwordLength,
                    onChanged: (int? value) {
                      setState(() {
                        passwordLength = value!;
                        _getPassword();
                      });
                    },
                    items: <int>[
                      1,
                      2,
                      3,
                      4,
                      5,
                      6,
                      7,
                      8,
                      9,
                      10,
                      11,
                      12,
                      13,
                      14,
                      15,
                      16,
                      17,
                      18,
                      19,
                      20,
                      21,
                      22,
                      23,
                      24,
                      25,
                      26,
                      27,
                      28,
                      29,
                      30,
                      31,
                      32
                    ].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value'),
                      );
                    }).toList(),
                  ),
                ],
              ),
              //añadimos un checkbox de letras mayusculas
              CheckboxListTile(
                title: const Text("Mayusculas"),
                value: uppercase,
                onChanged: (bool? value) {
                  setState(() {
                    uppercase = value!;
                    _getPassword();
                  });
                },
              ),
              //añadimos un checkbox de letras minusculas
              CheckboxListTile(
                title: const Text("Minusculas"),
                value: lowercase,
                onChanged: (bool? value) {
                  setState(() {
                    lowercase = value!;
                  });
                },
              ),
              //añadimos un checkbox de simbolos
              CheckboxListTile(
                title: const Text("Simbolos"),
                value: simbol,
                onChanged: (bool? value) {
                  setState(() {
                    simbol = value!;
                    _getPassword();
                  });
                },
              ),
              //añadimos un checkbox de numeros
              CheckboxListTile(
                title: const Text("Numeros"),
                value: number,
                onChanged: (bool? value) {
                  setState(() {
                    number = value!;
                    _getPassword();
                  });
                },
              ),
              const Text(
                'Su nueva contraseña:',
              ),
              const SizedBox(
                height: 30.0,
              ),
              SelectableText(
                _password,
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                  onPressed: _getPassword,
                  child: const Text('Generar contraseña'))
            ],
          ),
        ),
      ),
    );
  }
}

String generatePassword(int passwordLength, bool simbol, bool number,
    bool lowercase, bool uppercase) {
  //creamos un array vacio
  List<String> passwordArray = [];
  //creamos un array con todos los caracteres que queremos
  List<String> caracteres = [];
  //si queremos simbolos
  if (simbol) {
    caracteres.addAll("!@#%^&*()_+-=[]{}|;':,./<>?~`¿¡".split(""));
    //si queremos caracteres añadimos a passwordArray el array de caracteres
    passwordArray.addAll(caracteres);
  }

  //cremos un array de letras mayusculas
  List<String> mayusculas = [];
  //si queremos mayusculas
  if (lowercase) {
    mayusculas.addAll("ABCDEFGHIJKLMNOPQRSTUVWXYZ".split(""));
    passwordArray.addAll(mayusculas);
  }

  //creamos un array de letras minusculas
  List<String> minusculas = [];
  //si queremos mayusculas
  if (uppercase) {
    minusculas.addAll("abcdefghijklmnopqrstuvwxyz".split(""));
    passwordArray.addAll(minusculas);
  }

  //creamos un array de numeros
  List<String> numeros = [];
  //si queremos numeros
  if (number) {
    numeros.addAll("0123456789".split(""));
    passwordArray.addAll(numeros);
  }

  //creamos una variable para guardar la contraseña
  String password = "";

  //recorremos el passwordLength
  for (int i = 0; i < passwordLength; i++) {
    //creamos una variable para guardar un numero aleatorio
    int random = Random().nextInt(passwordArray.length);
    //añadimos a la contraseña el caracter que esta en la posicion random
    password += passwordArray[random];
  }

  return password;
}
