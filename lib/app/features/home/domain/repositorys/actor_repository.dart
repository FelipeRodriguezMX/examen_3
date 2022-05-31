part of './repositorys.dart';

abstract class IActorsRepository {
  Future<Either<bool, bool>> createActor(ActorModel actor);
  Future<Either<bool, List<Actor>>> getAllActors();
}
