part of './usecases.dart';

class ProducerUseCases {
  ProducerUseCases(this.repository);
  final IProducerRepository repository;

  Future<Either<bool, bool>> createMovie(ProducerModel producer) =>
      repository.createProducer(producer);

  Future<Either<bool, List<Producer>>> getAll() => repository.getAllProducers();
}
