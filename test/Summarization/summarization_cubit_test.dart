import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_mate/Features/Summarization/data/Summarization_repo.dart';
import 'package:study_mate/Features/Summarization/domain/cubit/summarization_cubit.dart';

class MockSummarizeRepo extends Mock implements SummarizeRepo {}

void main() {
  late SummarizeCubit cubit;
  late MockSummarizeRepo mockRepo;
  final fakeFile = File('dummy/path/sample.pdf');

  setUp(() {
    mockRepo = MockSummarizeRepo();
    cubit = SummarizeCubit(mockRepo);
  });

  blocTest<SummarizeCubit, SummarizeState>(
    'emits [Loading, Success] when summarizePdf succeeds',
    build: () {
      when(() => mockRepo.summarizePdf(fakeFile))
          .thenAnswer((_) async => Future.value());
      return cubit;
    },
    act: (cubit) => cubit.summarizePdf(fakeFile),
    expect: () => [isA<SummarizeLoading>(), isA<SummarizeSuccess>()],
  );

  blocTest<SummarizeCubit, SummarizeState>(
    'emits [Loading, Error] when summarizePdf throws',
    build: () {
      when(() => mockRepo.summarizePdf(fakeFile))
          .thenThrow(Exception('Failed to summarize'));
      return cubit;
    },
    act: (cubit) => cubit.summarizePdf(fakeFile),
    expect: () => [isA<SummarizeLoading>(), isA<SummarizeError>()],
  );
}
