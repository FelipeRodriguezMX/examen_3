part of './repositorys.dart';

abstract class IProducerRepository {
  Future<Either<bool, bool>> createProducer(ProducerModel producer);
  Future<Either<bool, List<Producer>>> getAllProducers();
}
