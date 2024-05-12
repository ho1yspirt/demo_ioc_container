import '../domain/i_app_config.dart';

final class ProdAppConfig implements IAppConfig {
  @override
  String get baseUrl => 'https://192.168.1.1/';

  @override
  String get host => 'prod';
}

final class DevAppConfig implements IAppConfig {
  @override
  String get baseUrl => 'localhost';

  @override
  String get host => 'dev';
}

final class TestAppConfig implements IAppConfig {
  @override
  String get baseUrl => '_';

  @override
  String get host => 'test';
}
