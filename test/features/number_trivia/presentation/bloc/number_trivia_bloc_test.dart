import 'package:clean_architecture_tdd_course/core/util/input_converter.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'number_trivia_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetConcreteNumberTrivia>(),
  MockSpec<GetRandomNumberTrivia>(),
  MockSpec<InputConverter>(),
])
void main() {
  late MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  late MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  late MockInputConverter mockInputConverter;
  late NumberTriviaBloc bloc;
  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();
    bloc = NumberTriviaBloc(
      getConcreteNumberTrivia: mockGetConcreteNumberTrivia,
      getRandomNumberTrivia: mockGetRandomNumberTrivia,
      inputConverter: mockInputConverter,
    );
  });

  test('initial state should be Empty', () async {
    // arrange

    // act

    // assert
    expect(bloc.state, isA<Empty>());
  });

  group('GetTriviaForConcreteNumber', () {
    final tNumberString = '1';
    final tNumberParsed = 1;
    final tNumberTrivia = NumberTrivia(number: 1, text: 'test trivia');

    test(
      'should call the InputConverter to validate and convert the string to an unsigned integer',
      () async {
        // arrange
        when(
          mockInputConverter.stringToUnsignedInteger(any),
        ).thenReturn(Right(tNumberParsed));
        // act
        bloc.add(GetTriviaForConcreteNumber(tNumberString));
        await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
        // assert
        verify(mockInputConverter.stringToUnsignedInteger(tNumberString));
      },
    );

    test('should emit [Error] when the input is invalid', () async {
      // arrange
      when(
        mockInputConverter.stringToUnsignedInteger(any),
      ).thenReturn(Left(InvalidInputFailure()));
      // assert later
      final expected = [Error(message: INVALID_INPUT_FAILURE_MESSAGE)];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(GetTriviaForConcreteNumber(tNumberString));
    });
  });
}
