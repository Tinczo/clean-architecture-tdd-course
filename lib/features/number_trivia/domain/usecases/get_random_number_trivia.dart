import '../../../../core/type_defs.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/number_trivia.dart';
import '../contracts/number_trivia_repository_contract.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepositoryContract repository;

  GetRandomNumberTrivia(this.repository);

  @override
  FutureEither<NumberTrivia> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
