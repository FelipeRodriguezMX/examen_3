part of './usecases.dart';

class ProducerUseCases {
  ProducerUseCases(this.repository);
  final IProducerRepository repository;

  Future<Either<bool, bool>> createProducer(ProducerModel producer) =>
      repository.createProducer(producer);

  Future<Either<bool, List<Producer>>> getAll() => repository.getAllProducers();
}
