import 'package:either_dart/either.dart';
import 'package:examen_3/app/core/core_datasource/models/models.dart';
import 'package:examen_3/app/core/core_domain/entities/entites.dart';
import 'package:examen_3/app/core/core_domain/usecases/usecases.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class ActorProvider with ChangeNotifier {
  ActorProvider() {
    actors = null;
    failure = null;
  }
  List<Actor>? actors;
  bool? failure;
  bool isLoading = true;

  final ActorUseCases actorUseCases = GetIt.instance();

  bool isEmpty() => actors == null;

  void notify() => notifyListeners();

  void clear() {
    actors = null;
    isLoading = true;
    failure = null;
  }

  void getActors() async {
    final either = await actorUseCases.getAll();
    eitherCheck(either);
  }

  void getActorsByMovie(int idMovie) async {
    final either = await actorUseCases.getActorsByMovie(idMovie);
    eitherCheck(either);
  }

  Future<Either<bool, bool>> create(ActorModel actor) async =>
      actorUseCases.createActor(actor);

  void eitherCheck(Either<bool, List<Actor>> either) {
    either.fold((left) {
      failure = true;
      isLoading = false;
      notifyListeners();
    }, (right) {
      actors = right;
      isLoading = false;
      notifyListeners();
    });
  }
}
