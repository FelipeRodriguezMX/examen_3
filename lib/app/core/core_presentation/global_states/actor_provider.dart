import 'dart:async';

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

  FutureOr<String?> create(ActorModel actor, BuildContext context) async {
    final either = await actorUseCases.createActor(actor);
    return either.fold((left) {
      return 'Error';
    }, (right) {
      getActors();
      Navigator.of(context).pop();
      return null;
    });
  }

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
