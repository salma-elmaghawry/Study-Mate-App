import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:study_mate/Core/networking/api_constants.dart';
import 'package:study_mate/Core/networking/api_service.dart';

class SummarizeRepo {
  final ApiService apiService;
  final Dio dio;

  SummarizeRepo(this.apiService, this.dio);

  Future<File> summarizePdf(File file) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path, filename: 'upload.pdf'),
      });

      final response = await dio.post(
        ApiConstants.summarizeAsPdf,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
          responseType: ResponseType.bytes,
        ),
      );

      final bytes = response.data;
      final directory = await getApplicationDocumentsDirectory();
      final savedFile = File('${directory.path}/summary_${DateTime.now().millisecondsSinceEpoch}.pdf');
      return await savedFile.writeAsBytes(bytes);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Summarization failed');
    }
  }
}
