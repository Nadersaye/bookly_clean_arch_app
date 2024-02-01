import 'package:dartz/dartz.dart';
import '../errors/failure.dart';

abstract class BaseUseCase<T, Param> {
  Future<Either<Failure, T>> call([Param param]);
}
