import 'package:edu_quiz/app/modules/initial_menu/initial_menu_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RootModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/',
            module: InitialMenuModule(),
            transition: TransitionType.fadeIn,
            duration: const Duration(microseconds: 5)),
      ];
}
