part of './usecases.dart';

class MovieUseCases {
  MovieUseCases(this.repository);
  final IMovieRepository repository;

  Future<Either<bool, bool>> createMovie(MovieModel movie) =>
      repository.createMovie(movie);

  Future<Either<bool, List<Movie>>> getAll() => repository.getAllMovies();
  Future<Either<bool, List<Movie>>> getMoviesByActor(int idActor) =>
      repository.getMoviesByActor(idActor);
  Future<Either<bool, List<Movie>>> getActorsByMovie(int idMovie) =>
      repository.getActorsByMovie(idMovie);
}
