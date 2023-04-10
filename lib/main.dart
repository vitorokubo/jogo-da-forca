import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(JogoForca());

class JogoForca extends StatefulWidget {
  @override
  State<JogoForca> createState() => _JogoForcaState();
}

class _JogoForcaState extends State<JogoForca> {
  List animais = ['macaco', 'tatu', 'jacare', 'coruja', 'boto'];
  var imagem = 'images/step01.png';
  String? animalescolhido;
  var txtLetra = TextEditingController();
  List name = [];
  void testarLetra(letra) {
    for (var i = 0; i < animalescolhido!.length; i++) {
      if (letra == animalescolhido![i]) {
        setState(() {
          name[i] = letra;
          txtLetra = TextEditingController();
        });
      } else {
        setState(() {
          imagem = 'images/step02.png';
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    var n = Random().nextInt(5);
    animalescolhido = animais[n];
    var nLetras = animalescolhido!.length;
    print(animalescolhido);
    print(nLetras);
    for (var i = 0; i < nLetras; i++) {
      name.add('_');
    }

    // este é o primeiro método a ser executado quando seu aplicativo abrir.
    // use-o para configurar as variáveis iniciais, por exemplo.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo Forca',
      home: Scaffold(
          appBar: AppBar(title: Text('Jogo da Forca')),
          body: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: FittedBox(child: Image.asset(imagem)),
                ),
                Flexible(
                    flex: 1,
                    child: Text("$name  ",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold))),
                Flexible(
                    flex: 1,
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                          border:
                              Border.all(style: BorderStyle.solid, width: 10)),
                      child: TextField(
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        controller: txtLetra,
                        onChanged: testarLetra,
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
