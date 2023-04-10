import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const JogoForca());

class JogoForca extends StatefulWidget {
  const JogoForca({super.key});

  @override
  State<JogoForca> createState() => _JogoForcaState();
}

class _JogoForcaState extends State<JogoForca> {
  List images = [
    'images/Frame 1.png',
    'images/Frame 2.png',
    'images/Frame 3.png',
    'images/Frame 4.png',
    'images/Frame 5.png',
    'images/Frame 6.png',
    'images/Frame 7.png'
  ];
  var tentativas = 0;
  List animais = [
    'macaco',
    'tatu',
    'jacare',
    'coruja',
    'boto',
    'aranha',
    'girafa',
    'tigre',
    'pomba',
    'cachorro',
    'gato',
    'cobra'
  ];
  late String image;
  late String animalescolhido;
  var txtLetra = TextEditingController();
  List name = [];
  var randomNumber = 0;
  var nLetras = 0;
  bool vitoria = false;

  void testarLetra(letra) {
    txtLetra.clear();
    bool encontro = false;
    var teste = '';

    for (var i = 0; i < animalescolhido.length; i++) {
      if (letra == animalescolhido[i]) {
        setState(() {
          name[i] = letra;
          encontro = true;
        });
      }
      teste += name[i];
    }
    if (!encontro) {
      setState(() {
        tentativas++;
        image = images[tentativas];
      });
    }
    if (teste == animalescolhido) {
      vitoria = true;
    }
  }

  void reset() {
    setState(() {
      vitoria = false;
      randomNumber = Random().nextInt(5);
      animalescolhido = animais[randomNumber];
      nLetras = animalescolhido.length;
      name = [];
      image = images[0];
      tentativas = 0;
      for (var i = 0; i < nLetras; i++) {
        name.add('_');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    randomNumber = Random().nextInt(5);
    animalescolhido = animais[randomNumber];
    nLetras = animalescolhido.length;
    image = images[0];

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
          appBar: AppBar(title: const Text('Jogo da Forca')),
          body: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: vitoria
                      ? ElevatedButton(
                          onPressed: () => reset(),
                          child: const Text(
                              'Vitoria, clique para jogar novamente'))
                      : Image(image: AssetImage(image)),
                ),
                Flexible(
                    flex: 1,
                    child: Text("$name  ",
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold))),
                Flexible(
                    flex: 1,
                    child: tentativas == 6
                        ? ElevatedButton(
                            onPressed: () => reset(),
                            child: Text(
                                'Game Over, tente novamente! O animal era $animalescolhido'),
                          )
                        : Container(
                            width: 120,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    style: BorderStyle.solid, width: 10)),
                            child: TextField(
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                              controller: txtLetra,
                              onChanged: testarLetra,
                            ),
                          )),
                ElevatedButton(
                    onPressed: () => reset(), child: const Text('Resetar Jogo'))
              ],
            ),
          )),
    );
  }
}
