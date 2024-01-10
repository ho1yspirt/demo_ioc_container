abstract class AppConfig {
  String get baseUrl;

  String get host;
}

class ProdAppConfig implements AppConfig {
  @override
  String get baseUrl => 'https://192.168.1.1/';

  @override
  String get host => 'prod';
}

class DevAppConfig implements AppConfig {
  @override
  String get baseUrl => 'localhost';

  @override
  String get host => 'dev';
}

class TestAppConfig implements AppConfig {
  @override
  String get baseUrl => '_';

  @override
  String get host => 'test';
}
