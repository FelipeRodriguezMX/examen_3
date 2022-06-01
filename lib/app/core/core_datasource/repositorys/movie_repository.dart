part of './repositorys.dart';

class MovieRepositoryImplementation extends IMovieRepository {
  MovieRepositoryImplementation({required this.sqlHelper});
  ISqlHelper sqlHelper;

  @override
  Future<Either<bool, bool>> createMovie(MovieModel movie) async {
    try {
      final query =
          'INSERT INTO movies (name, description, producer_id) VALUES ("${movie.name}", "${movie.description}", ${movie.producer_id})';
      final result = await sqlHelper.insert(query: query);
      if (result == false) return const Left(true);
      for (var actor in movie.actors!) {
        final query =
            'INSERT INTO MovieActors (movie_id, actor_id) VALUES (${movie.id},${actor.id})';
        final result = await sqlHelper.insert(query: query);
        if (result == false) return const Left(true);
      }
      return const Right(true);
    } catch (e) {
      inspect(e);
      return const Left(true);
    }
  }

  @override
  Future<Either<bool, List<Movie>>> getAllMovies() async {
    try {
      const query = 'SELECT * FROM Movies';
      final result = await sqlHelper.get(query);
      if (result.isEmpty) return const Right([]);
      List<Movie> movies = [];
      for (var item in result) {
        Movie movie = MovieModel.fromJson(item);
        final producer = await sqlHelper
            .get('SELECT * FROM Producers WHERE id = ${movie.producer_id}');
        movie.producer = ProducerModel.fromJson(producer[0]);
        movies.add(movie);
      }
      return Right(movies);
    } catch (e) {
      return const Left(true);
    }
  }

  @override
  Future<Either<bool, List<Movie>>> getMoviesByActor(int id) async {
    try {
      final query =
          'SELECT * FROM Movies AS m INNER JOIN MovieActors AS ma ON m.id = ma.movie_id WHERE ma.actor_id = $id';
      final result = await sqlHelper.get(query);
      if (result.isEmpty) return const Right([]);
      List<Movie> movies = [];
      for (var item in result) {
        Movie movie = MovieModel.fromJson(item);
        final producer = await sqlHelper
            .get('SELECT * FROM Producers WHERE id = ${movie.producer_id}');
        movie.producer = ProducerModel.fromJson(producer[0]);
        movies.add(movie);
      }

      return Right(movies);
    } catch (e) {
      return const Left(true);
    }
  }

  @override
  Future<Either<bool, List<Movie>>> getMoviesByProducer(int id) async {
    try {
      final query = 'SELECT * FROM Movies WHERE producer_id = $id';
      final result = await sqlHelper.get(query);
      if (result.isEmpty) return const Right([]);
      List<Movie> movies = [];
      for (var item in result) {
        Movie movie = MovieModel.fromJson(item);
        final producer = await sqlHelper
            .get('SELECT * FROM Producers WHERE id = ${movie.producer_id}');
        movie.producer = ProducerModel.fromJson(producer[0]);
        movies.add(movie);
      }
      return Right(movies);
    } catch (e) {
      return const Left(true);
    }
  }
}
