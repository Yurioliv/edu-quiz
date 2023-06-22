import 'package:edu_quiz/app/modules/initial_menu/pages/initial_menu_page.dart';
import 'package:edu_quiz/app/modules/level/level_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialMenuModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const InitialMenuPage()),
        ModuleRoute('/Level', module: LevelModule()),
      ];
}
