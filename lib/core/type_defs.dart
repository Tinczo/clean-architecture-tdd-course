import 'error/failures.dart';
import 'package:dartz/dartz.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
