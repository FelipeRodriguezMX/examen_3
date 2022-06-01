import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:examen_3/app/core/core_datasource/models/models.dart';
import 'package:examen_3/app/core/core_domain/entities/entites.dart';
import 'package:examen_3/app/core/core_domain/usecases/usecases.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class ProducerProvider with ChangeNotifier {
  ProducerProvider() {
    producers = null;
    failure = null;
  }
  List<Producer>? producers;
  bool? failure;
  bool isLoading = true;

  final ProducerUseCases producersUseCases = GetIt.instance();

  bool isEmpty() => producers == null;

  void notify() => notifyListeners();

  void clear() {
    producers = null;
    isLoading = true;
    failure = null;
  }

  void getProducers() async {
    final either = await producersUseCases.getAll();
    eitherCheck(either);
  }

  void eitherCheck(Either<bool, List<Producer>> either) {
    either.fold((left) {
      failure = true;
      isLoading = false;
      notifyListeners();
    }, (right) {
      producers = right;
      isLoading = false;
      notifyListeners();
    });
  }

  FutureOr<String?> create(ProducerModel producer, BuildContext context) async {
    final either = await producersUseCases.createProducer(producer);
    return either.fold((left) {
      return 'Error';
    }, (right) {
      getProducers();
      Navigator.of(context).pop();
      return null;
    });
  }
}
