import 'package:bloc/bloc.dart';
import 'package:edu_quiz/app/core/bloc/base_states.dart';
import 'package:edu_quiz/app/core/services/remote_config_service.dart';
import 'package:edu_quiz/app/modules/level/bloc/level_events.dart';
import 'package:edu_quiz/app/modules/level/bloc/level_states.dart';
import 'package:edu_quiz/app/modules/level/models/level.dart';

class LevelBloc extends Bloc<LevelEvent, AppState> {
  LevelBloc() : super(InitialState()) {
    on<CreateLevel>(_createLevel);
    // on<buyProduct>(_buyProduct);
  }

  late Level level;
  int actualQuestion = 0;
  bool levelCreated = false;

  // Função para criar lista de produtos
  Future<void> _createLevel(
    CreateLevel event,
    Emitter<AppState> emit,
  ) async {
    emit(CreatingLevel());

    try {
      if (event.discipline == "portuguese") {
        level = RemoteConfigService().createLevel(event.discipline);
      }
      levelCreated = true;
      emit(SuccessfullyCreatedLevel());
    } catch (exception) {
      emit(UnableToCreateLevel());
    }
  }
}
