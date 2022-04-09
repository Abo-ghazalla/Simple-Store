part of 'imports.dart';

final getIt = GetIt.instance;

void locatorSetup() {
  getIt.registerLazySingleton<APIService>(() => APIService(constants.baseUrl));
}
