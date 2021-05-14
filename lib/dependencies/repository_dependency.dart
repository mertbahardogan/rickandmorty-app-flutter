import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/services/api_manager.dart';
import 'package:rick_and_morty_app/services/object_manager.dart';

GetIt getIt = GetIt.instance;


void setupDependency(){
  getIt.registerLazySingleton(() => ApiManager());

  getIt.registerLazySingleton(() => ObjectManager());
}