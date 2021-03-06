part of './repositorys.dart';

class ActorRepositoryImplementation extends IActorsRepository {
  ActorRepositoryImplementation({required this.sqlHelper});
  ISqlHelper sqlHelper;

  @override
  Future<Either<bool, bool>> createActor(ActorModel actor) async {
    try {
      final query =
          'INSERT INTO Actors (name, alias) VALUES ("${actor.name}", "${actor.alias}")';
      final result = await sqlHelper.insert(query: query);
      if (result > 0) return const Right(true);
      return const Left(false);
    } catch (e) {
      return const Left(false);
    }
  }

  @override
  Future<Either<bool, List<Actor>>> getAllActors() async {
    try {
      const query = 'SELECT * FROM Actors';
      final result = await sqlHelper.get(query);
      if (result.isEmpty) return const Right([]);
      final actors = result.map((e) => ActorModel.fromJson(e)).toList();
      return Right(actors);
    } catch (e) {
      return const Left(false);
    }
  }

  @override
  Future<Either<bool, List<Actor>>> getActorsByMovie(int movieId) async {
    try {
      final query =
          'SELECT * FROM MovieActors AS ma INNER JOIN Actors AS a ON ma.actor_id = a.id WHERE ma.movie_id = $movieId';
      final result = await sqlHelper.get(query);
      if (result.isEmpty) return const Right([]);
      final actors = result.map((e) => ActorModel.fromJson(e)).toList();
      return Right(actors);
    } catch (e) {
      return const Left(false);
    }
  }
}
