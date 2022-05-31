part of './repositorys.dart';

class MovieRepositoryImplementation extends IMovieRepository {
  MovieRepositoryImplementation({required this.sqlHelper});
  ISqlHelper sqlHelper;

  @override
  Future<Either<bool, bool>> createMovie(MovieModel movie) async {
    try {
      return const Right(true);
    } catch (e) {
      return const Left(false);
    }
  }

  @override
  Future<Either<bool, List<Movie>>> getAllMovies() async {
    try {
      const query = 'SELECT * FROM Movies';
      final result = await sqlHelper.get(query);
      if (result.isEmpty) return const Right([]);
      inspect(result);
      final movies = result.map((e) => MovieModel.fromJson(e)).toList();
      inspect(movies);
      return Right(movies);
    } catch (e) {
      inspect(e);
      return const Left(false);
    }
  }

  @override
  Future<Either<bool, List<Movie>>> getActorsByMovie(int movieId) async {
    try {
      return const Right([]);
    } catch (e) {
      return const Left(false);
    }
  }

  @override
  Future<Either<bool, List<Movie>>> getMoviesByActor(int actorId) async {
    try {
      final query =
          'SELECT * FROM Movies AS m INNER JOIN MovieActors AS ma ON m.id = ma.movieId INNER JOIN Actors AS a ON ma.actorId = a.id WHERE a.id = $actorId';
      final result = await sqlHelper.get(query);
      if (result.isEmpty) return const Right([]);
      final movies = result.map((e) => MovieModel.fromJson(e)).toList();
      return Right(movies);
    } catch (e) {
      return const Left(false);
    }
  }
}
