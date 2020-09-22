import 'registration_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'registration_page.dart';

class RegistrationModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $RegistrationController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => RegistrationPage()),
      ];

  static Inject get to => Inject<RegistrationModule>.of();
}
