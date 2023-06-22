import 'package:edu_quiz/app/modules/level/bloc/level_bloc.dart';
import 'package:edu_quiz/app/modules/level/pages/question_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LevelModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<LevelBloc>(
          (i) => LevelBloc(),
          onDispose: (bloc) => bloc.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/:name',
            child: (_, args) => QuestionPage(
                  discipline: args.params['name'],
                )),
      ];
}
