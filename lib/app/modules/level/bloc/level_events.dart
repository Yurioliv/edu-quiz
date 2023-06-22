abstract class LevelEvent {}

class CreateLevel implements LevelEvent {
  CreateLevel({required this.discipline});
  String discipline;
}
