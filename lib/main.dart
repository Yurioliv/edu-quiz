import 'package:edu_quiz/app/core/services/remote_config_service.dart';
import 'package:edu_quiz/app/core/storage/hive_initializer.dart';
import 'package:edu_quiz/app/root_module.dart';
import 'package:edu_quiz/app/root_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await RemoteConfigService().inicializar();

  // Esconde a barra inferior do android
  // Arrastando para cima na area da barra faz ela reaparecer
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  /*Força a tela a estar na vertical. Pode não funcionar em alguns 
    dispositivos IOS.*/

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Variavel de testes para verificar se questões ja foram baixadas do Firebase

  hiveInitializer(
      execute: () =>
          runApp(ModularApp(module: RootModule(), child: const RootWidget())));
}
