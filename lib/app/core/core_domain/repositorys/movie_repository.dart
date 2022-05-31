part of './repositorys.dart';

abstract class IMovieRepository {
  Future<Either<bool, bool>> createMovie(MovieModel movie);
  Future<Either<bool, List<Movie>>> getAllMovies();

  Future<Either<bool, List<Movie>>> getMoviesByActor(int id);
}
