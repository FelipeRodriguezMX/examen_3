import 'package:examen_3/app/core/sql_lite/fill_data.dart';
import 'package:examen_3/app/core/sql_lite/sql_helper.dart';
import 'package:examen_3/app/features/home/injection_container.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void mainInjectionContainer() {
  homeInjectionContainer();
  getIt
    ..registerLazySingleton<ISqlHelper>(
      () => SQLHelperImplementation(),
    )
    ..registerLazySingleton<FillData>(
      () => FillData(
        sqlHelper: getIt<ISqlHelper>(),
      ),
    );
}
