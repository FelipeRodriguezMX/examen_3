import 'package:examen_3/app/core/sql_lite/sql_helper.dart';
import 'package:examen_3/app/features/home/datasource/repositorys/repositorys.dart';
import 'package:examen_3/app/features/home/domain/repositorys/repositorys.dart';
import 'package:examen_3/app/features/home/domain/usecases/usecases.dart';
import 'package:examen_3/injection_container.dart';

void homeInjectionContainer() {
  getIt
    ..registerLazySingleton<IMovieRepository>(
      () => MovieRepositoryImplementation(
        sqlHelper: getIt<ISqlHelper>(),
      ),
    )
    ..registerLazySingleton<IActorsRepository>(
      () => ActorRepositoryImplementation(
        sqlHelper: getIt<ISqlHelper>(),
      ),
    )
    ..registerLazySingleton<IProducerRepository>(
      () => ProducerRepositoryImplementation(
        sqlHelper: getIt<ISqlHelper>(),
      ),
    )
    ..registerLazySingleton<MovieUseCases>(
      () => MovieUseCases(
        getIt<IMovieRepository>(),
      ),
    )
    ..registerLazySingleton<ActorUseCases>(
      () => ActorUseCases(
        getIt<IActorsRepository>(),
      ),
    )
    ..registerLazySingleton<ProducerUseCases>(
      () => ProducerUseCases(
        getIt<IProducerRepository>(),
      ),
    );
}
