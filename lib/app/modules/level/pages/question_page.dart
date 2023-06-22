import 'package:edu_quiz/app/core/bloc/base_states.dart';
import 'package:edu_quiz/app/modules/level/bloc/level_bloc.dart';
import 'package:edu_quiz/app/modules/level/bloc/level_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key, required this.discipline});
  final String discipline;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final levelBloc = Modular.get<LevelBloc>();

  @override
  void initState() {
    if (levelBloc.levelCreated == false) {
      levelBloc.add(CreateLevel(discipline: widget.discipline));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaquery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          // Cor do fundo
          Container(
            color: const Color.fromARGB(255, 252, 202, 20),
          ),
          // Texto com numero questão
          BlocBuilder<LevelBloc, AppState>(
            bloc: levelBloc,
            builder: (context, state) {
              if (state is InitialState || state is ProcessingState) {
                return const SizedBox();
              }

              return Stack(
                children: [
                  Positioned(
                    top: mediaquery.size.height * 0.05,
                    left: mediaquery.size.width * 0.1,
                    child: Text(
                      'Questão #?',
                      style: TextStyle(color: Colors.grey[800], fontSize: 18),
                    ),
                  ),
                  // Texto da questão
                  Positioned(
                    top: mediaquery.size.height * 0.1,
                    left: mediaquery.size.width * 0.05,
                    right: mediaquery.size.width * 0.05,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: mediaquery.size.height * 0.47,
                              width: mediaquery.size.width * 0.9,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: RawScrollbar(
                                  thumbColor: Colors.black,
                                  radius: const Radius.circular(20),
                                  padding: EdgeInsets.symmetric(
                                      vertical: mediaquery.size.height * 0.015),
                                  crossAxisMargin: -6,
                                  thickness: 4,
                                  thumbVisibility: true,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        for (int i = 0;
                                            i <
                                                levelBloc
                                                    .level
                                                    .questions[levelBloc
                                                        .actualQuestion]
                                                    .texts[0]
                                                    .questionTexts
                                                    .length;
                                            i++) ...[
                                          Text(
                                            '${levelBloc.level.questions[levelBloc.actualQuestion].texts[0].questionTexts[i]} \n',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Resposta A)
                  Positioned(
                    top: mediaquery.size.height * 0.59,
                    left: mediaquery.size.width * 0.1,
                    right: mediaquery.size.width * 0.1,
                    child: Column(
                      children: [
                        Container(
                          height: mediaquery.size.height * 0.07,
                          width: mediaquery.size.width * 0.8,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: mediaquery.size.width * 0.02,
                                ),
                                child: Container(
                                  height: mediaquery.size.height * 0.04,
                                  width: mediaquery.size.width * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(180.0)),
                                  ),
                                  child: const Center(
                                    child: Text('A'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: mediaquery.size.width * 0.02),
                                child: SizedBox(
                                    width: mediaquery.size.width * 0.64,
                                    height: mediaquery.size.height * 0.06,
                                    child: Center(
                                      child: Text(
                                          'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Resposta B)
                  Positioned(
                    top: mediaquery.size.height * 0.67,
                    left: mediaquery.size.width * 0.1,
                    right: mediaquery.size.width * 0.1,
                    child: Column(
                      children: [
                        Container(
                          height: mediaquery.size.height * 0.07,
                          width: mediaquery.size.width * 0.8,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: mediaquery.size.width * 0.02,
                                ),
                                child: Container(
                                  height: mediaquery.size.height * 0.04,
                                  width: mediaquery.size.width * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(180.0)),
                                  ),
                                  child: const Center(
                                    child: Text('B'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: mediaquery.size.width * 0.02),
                                child: SizedBox(
                                    width: mediaquery.size.width * 0.64,
                                    height: mediaquery.size.height * 0.06,
                                    child: Center(
                                      child: Text(
                                          'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB'),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Resposta C)
                  Positioned(
                    top: mediaquery.size.height * 0.75,
                    left: mediaquery.size.width * 0.1,
                    right: mediaquery.size.width * 0.1,
                    child: Column(
                      children: [
                        Container(
                          height: mediaquery.size.height * 0.07,
                          width: mediaquery.size.width * 0.8,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: mediaquery.size.width * 0.02,
                                ),
                                child: Container(
                                  height: mediaquery.size.height * 0.04,
                                  width: mediaquery.size.width * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(180.0)),
                                  ),
                                  child: const Center(
                                    child: Text('C'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: mediaquery.size.width * 0.02),
                                child: SizedBox(
                                    width: mediaquery.size.width * 0.64,
                                    height: mediaquery.size.height * 0.06,
                                    child: Center(
                                      child: Text(
                                          'CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC'),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Resposta D)
                  Positioned(
                    top: mediaquery.size.height * 0.83,
                    left: mediaquery.size.width * 0.1,
                    right: mediaquery.size.width * 0.1,
                    child: Column(
                      children: [
                        Container(
                          height: mediaquery.size.height * 0.07,
                          width: mediaquery.size.width * 0.8,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: mediaquery.size.width * 0.02,
                                ),
                                child: Container(
                                  height: mediaquery.size.height * 0.04,
                                  width: mediaquery.size.width * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(180.0)),
                                  ),
                                  child: const Center(
                                    child: Text('D'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: mediaquery.size.width * 0.02),
                                child: SizedBox(
                                    width: mediaquery.size.width * 0.64,
                                    height: mediaquery.size.height * 0.06,
                                    child: Center(
                                      child: Text(
                                          'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD'),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Resposta E)
                  Positioned(
                    top: mediaquery.size.height * 0.91,
                    left: mediaquery.size.width * 0.1,
                    right: mediaquery.size.width * 0.1,
                    child: Column(
                      children: [
                        Container(
                          height: mediaquery.size.height * 0.07,
                          width: mediaquery.size.width * 0.8,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: mediaquery.size.width * 0.02,
                                ),
                                child: Container(
                                  height: mediaquery.size.height * 0.04,
                                  width: mediaquery.size.width * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(180.0)),
                                  ),
                                  child: const Center(
                                    child: Text('E'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: mediaquery.size.width * 0.02),
                                child: SizedBox(
                                    width: mediaquery.size.width * 0.64,
                                    height: mediaquery.size.height * 0.06,
                                    child: Center(
                                      child: Text(
                                          'EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE'),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Botão de sair da fase
                  Positioned(
                    top: mediaquery.size.height * 0.02,
                    right: mediaquery.size.width * 0.04,
                    child: Container(
                      height: mediaquery.size.height * 0.05,
                      width: mediaquery.size.width * 0.1,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Modular.to.navigate('../');
                          },
                          child: const Icon(Icons.close),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
