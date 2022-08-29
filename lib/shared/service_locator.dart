import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:university_list/business_logic/university_provider.dart';
import 'package:university_list/data/repositories/university_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(
    Dio(BaseOptions(baseUrl: "http://universities.hipolabs.com/")),
  );
  getIt.registerSingleton<UniversityRepository>(
    UniversityRepository(http: getIt.get<Dio>()),
  );
  getIt.registerSingleton<UniversityProvider>(UniversityProvider(
      universityRepository: getIt.get<UniversityRepository>()));
}
