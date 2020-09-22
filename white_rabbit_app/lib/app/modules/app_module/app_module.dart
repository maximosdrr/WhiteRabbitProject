import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:white_rabbit_app/app/assets/splashs/loadScreen.dart';
import 'package:white_rabbit_app/app/modules/app_module/repositories/auth/repository.dart';
import 'package:white_rabbit_app/app/modules/app_module/repositories/prefs/repository.dart';
import 'package:white_rabbit_app/app/modules/home/home_module.dart';
import 'package:white_rabbit_app/app/modules/home/repositories/message/repository.dart';
import 'package:white_rabbit_app/app/modules/login/login_module.dart';
import 'package:white_rabbit_app/app/modules/registration/registration_module.dart';

import 'app_controller.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind((i) => AuthRepository()),
        Bind((i) => PrefsRepository()),
        Bind((i) => MessageRepository())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/', module: LoginModule()),
        ModularRouter(
          '/load',
          child: (_, args) => LoadScreen(
            text: args.data,
          ),
        ),
        ModularRouter(
          '/registration',
          module: RegistrationModule(),
        )
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
