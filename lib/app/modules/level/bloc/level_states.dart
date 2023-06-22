import 'package:edu_quiz/app/core/bloc/base_states.dart';

// estados para a variavel productList em ShopBloc
class CreatingLevel implements ProcessingState {}

class SuccessfullyCreatedLevel implements SuccessState {}

class UnableToCreateLevel implements ErrorState {}
