part of './repositorys.dart';

class ProducerRepositoryImplementation extends IProducerRepository {
  ProducerRepositoryImplementation({required this.sqlHelper});
  ISqlHelper sqlHelper;

  @override
  Future<Either<bool, bool>> createProducer(ProducerModel producer) async {
    try {
      final query = 'INSERT INTO Producers (name) VALUES ("${producer.name}")';
      final result = await sqlHelper.insert(query: query);
      if (result == true) return const Right(true);
      return const Left(false);
    } catch (e) {
      return const Left(false);
    }
  }

  @override
  Future<Either<bool, List<Producer>>> getAllProducers() async {
    try {
      const query = 'SELECT * FROM Producers';
      final result = await sqlHelper.get(query);
      if (result.isEmpty) return const Right([]);
      final producers = result.map((e) => ProducerModel.fromJson(e)).toList();
      return Right(producers);
    } catch (e) {
      return const Left(false);
    }
  }
}
