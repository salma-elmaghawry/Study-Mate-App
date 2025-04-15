
import 'package:dio/dio.dart';
import 'package:study_mate/Core/networking/api_constants.dart';
import 'package:study_mate/Core/networking/api_service.dart';

class SummarizationRepository {
  final ApiService apiService;
  SummarizationRepository(this.apiService);

  Future<String> summarizeFile(String text) async {
    try {
      final response = await apiService.post(
        ApiConstants.summarize,
        data: {'text': text},
      );
      return response.data['summary'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Summarization failed');
    }
  }
}