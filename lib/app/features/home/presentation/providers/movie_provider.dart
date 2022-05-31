import 'package:examen_3/app/features/home/domain/entities/entites.dart';
import 'package:examen_3/app/features/home/domain/usecases/usecases.dart';
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

  final MovieUseCases movieUseCase = GetIt.instance();

  bool isEmpty() => movies == null;

  void notify() => notifyListeners();

  void clear() {
    movies = null;
    notifyListeners();
  }

  void initData(List<Movie> movie) {
    movies = movie;
    notifyListeners();
  }

  void getMovies() async {
    final either = await movieUseCase.getAll();
    either.fold((left) {
      failure = true;
      isLoading = false;
      notifyListeners();
    }, (right) {
      movies = right;
      isLoading = false;
      notifyListeners();
    });
    notifyListeners();
  }
}
