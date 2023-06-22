import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialMenuPage extends StatelessWidget {
  const InitialMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaquery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          //Background color
          Container(
            color: const Color.fromARGB(255, 252, 202, 20),
          ),
          Positioned(
            top: mediaquery.size.height * 0.3,
            left: mediaquery.size.width * 0.15,
            right: mediaquery.size.width * 0.15,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Escolha a matéria',
                style: TextStyle(fontSize: 32, color: Colors.grey[800]),
              ),
            ]),
          ),
          Positioned(
            top: mediaquery.size.height * 0.6,
            left: mediaquery.size.width * 0.05,
            right: mediaquery.size.width * 0.05,
            bottom: mediaquery.size.height * 0.05,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 1° Botão Matematica
                    TextButton(
                      onPressed: () {
                        Modular.to.navigate('/Level/');
                      },
                      child: Container(
                        height: mediaquery.size.height * 0.07,
                        width: mediaquery.size.width * 0.32,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(251, 145, 59, 1),
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        ),
                        child: const Center(
                            child: Text(
                          'Matemática',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )),
                      ),
                    ),
                    // 2° Botão Portugues
                    TextButton(
                      onPressed: () {
                        Modular.to.navigate('/Level/portuguese');
                      },
                      child: Container(
                        height: mediaquery.size.height * 0.07,
                        width: mediaquery.size.width * 0.32,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(251, 145, 59, 1),
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        ),
                        child: const Center(
                            child: Text(
                          'Português',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
