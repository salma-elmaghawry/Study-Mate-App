import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:study_mate/Features/Summarization/data/Summarization_repo.dart';

part 'summarization_state.dart';

class SummarizeCubit extends Cubit<SummarizeState> {
  final SummarizeRepo summarizeRepo;

  SummarizeCubit(this.summarizeRepo) : super(SummarizeInitial());

  Future<void> summarizePdf(File file) async {
    emit(SummarizeLoading());
    print("Start summarizing...");

    try {
      await summarizeRepo.summarizePdf(file);
      emit(SummarizeSuccess());
    } catch (e) {
      print("Error: $e");
      emit(SummarizeError(e.toString()));
    }
  }
}
