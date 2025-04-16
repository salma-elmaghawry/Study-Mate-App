part of 'summarization_cubit.dart';

abstract class SummarizeState {}

class SummarizeInitial extends SummarizeState {}

class SummarizeLoading extends SummarizeState {}

class SummarizeSuccess extends SummarizeState {}

class SummarizeError extends SummarizeState {
  final String message;
  SummarizeError(this.message);
}
