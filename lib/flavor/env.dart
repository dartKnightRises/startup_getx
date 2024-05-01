import 'config/config_dev.dart';
import 'config/config_sit.dart';
import 'config/config_prod.dart';

enum Environment { dev, sit, prod }

class Constants {
  static late Map<String, dynamic> _config;

  static void setEnvironment(Environment environment) {
    switch (environment) {
      case Environment.dev:
        _config = ConfigDev.constants;
        break;
      case Environment.sit:
        _config = ConfigSit.constants;
        break;
      case Environment.prod:
        _config = ConfigProd.constants;
        break;
    }
  }

  static get serverOne {
    return _config['serverOne'];
  }

  static get serverTwo {
    return _config['serverTwo'];
  }

  static get envName {
    return _config['envName'];
  }
}
