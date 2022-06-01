import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:examen_3/app/core/core_datasource/models/models.dart';
import 'package:examen_3/app/core/core_domain/entities/entites.dart';
import 'package:examen_3/app/core/core_domain/usecases/usecases.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class MovieProvider with ChangeNotifier {
  MovieProvider() {
    movies = null;
    failure = null;
  }
  List<Movie>? movies;
  bool? failure;
  bool isLoading = true;
  List<Actor> selectedActors = [];

  final MovieUseCases movieUseCase = GetIt.instance();

  bool isEmpty() => movies == null;

  void notify() => notifyListeners();

  void clear() {
    movies = null;
    isLoading = true;
    failure = null;
  }

  void initData(List<Movie> movie) {
    movies = movie;
    notifyListeners();
  }

  void getMovies() async {
    final either = await movieUseCase.getAll();
    eitherCheck(either);
  }

  void getMoviesByActor(int idActor) async {
    final either = await movieUseCase.getMoviesByActor(idActor);
    eitherCheck(either);
  }

  void getMoviesByProducer(int idProducer) async {
    final either = await movieUseCase.getMoviesByProducer(idProducer);
    eitherCheck(either);
  }

  void eitherCheck(Either<bool, List<Movie>> either) {
    either.fold((left) {
      failure = true;
      isLoading = false;
      notifyListeners();
    }, (right) {
      movies = right;
      isLoading = false;
      notifyListeners();
    });
  }

  void addActor(Actor actor) {
    selectedActors.add(actor);
    notifyListeners();
    inspect(selectedActors);
  }

  create(MovieModel movie, BuildContext context) async {
    final either = await movieUseCase.createMovie(movie);
    return either.fold((left) {
      return 'Error';
    }, (right) {
      getMovies();
      Navigator.of(context).pop();
      return null;
    });
  }
}
