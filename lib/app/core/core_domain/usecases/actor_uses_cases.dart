part of './usecases.dart';

class ActorUseCases {
  ActorUseCases(this.repository);
  final IActorsRepository repository;

  Future<Either<bool, bool>> createActor(ActorModel actor) =>
      repository.createActor(actor);

  Future<Either<bool, List<Actor>>> getAll() => repository.getAllActors();
  Future<Either<bool, List<Actor>>> getActorsByMovie(int idMovie) =>
      repository.getActorsByMovie(idMovie);
}
