import 'dart:convert';
import 'package:edu_quiz/app/modules/level/models/level.dart';
import 'package:edu_quiz/app/modules/level/models/portuguese_question.dart';
import 'package:edu_quiz/app/modules/level/models/portuguese_texts.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> update() async {
    await _remoteConfig.fetchAndActivate();
  }

  Future<void> inicializar() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(days: 365),
      ),
    );
    await _remoteConfig.ensureInitialized();
    update();
  }

  dynamic get portugueseQuiz {
    // salva a string em uma variavel chamada "quiz"
    final quiz = _remoteConfig.getString('portuguese');

    // extrai o json da string
    final data = jsonDecode(quiz);

    // Variavel "data" agora tem varias "camadas"
    // que aparentam ser listas de maps
    // String questao = data[0]["questions"][0].toString();
    return data;
  }

  createLevel(String discipline) {
    return Level(
        discipline: discipline, questions: chooseQuestionsType(discipline));
  }

  chooseQuestionsType(String discipline) {
    if (discipline == "portuguese") {
      return createPortugueseQuestions();
    } else if (discipline == "matematica") {
      return createMathQuestions();
    }
  }

  createMathQuestions() {}

  createPortugueseQuestions() {
    List<PortugueseQuestion> listQuestions = [];

    int questionsQuantity = portugueseQuiz[0]['questoes'].length;

    for (int i = 0; i < questionsQuantity; i++) {
      print(i);
      listQuestions.add(
        PortugueseQuestion(
          id: portugueseQuiz[0]["questoes"][i]["id_questao"],
          questionText: portugueseQuiz[0]["questoes"][i]["questao"].toString(),
          correctAnswer: portugueseQuiz[0]["questoes"][i]["opcao_correta"],
          answers: createAnswers(i),
          texts: createTexts(i),
        ),
      );
    }
    print("teste");

    return listQuestions;
  }

  createAnswers(int actualQuestion) {
    List<String> listAnswers = [];
    int answerQuantity =
        portugueseQuiz[0]["questoes"][actualQuestion]["respostas"].length;
    for (int i = 0; i < answerQuantity; i++) {
      String tempString = portugueseQuiz[0]["questoes"][actualQuestion]
              ["respostas"][i]
          .toString();
      listAnswers.add(tempString);
    }

    return listAnswers;
  }

  createTexts(int actualQuestion) {
    List listTexts = [];
    listTexts.add(
      PortugueseTexts(
          title: portugueseQuiz[0]["questoes"][actualQuestion]["textos"][0]
              ["titulo"],
          font: portugueseQuiz[0]["questoes"][actualQuestion]["textos"][0]
              ["fonte"],
          questionTexts: createQuestionTexts(actualQuestion)),
    );

    print('tipo variavel: ${listTexts}');
    return listTexts;
  }

  createQuestionTexts(int actualQuestion) {
    List<String> listTextsOfQuestion = [];
    int textsQuantity = portugueseQuiz[0]["questoes"][actualQuestion]["textos"]
            [0]["texto"]
        .length;
    for (int i = 0; i < textsQuantity; i++) {
      listTextsOfQuestion.add(portugueseQuiz[0]["questoes"][actualQuestion]
              ["textos"][0]["texto"][i]
          .toString());
    }

    return listTextsOfQuestion;
  }
}
