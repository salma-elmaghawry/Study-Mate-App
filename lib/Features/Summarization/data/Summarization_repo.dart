import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:study_mate/Core/networking/api_constants.dart';
import 'package:study_mate/Core/networking/api_service.dart';
import 'package:study_mate/Features/Summarization/presentation/widgets/save_and_open_pdf.dart';

class SummarizeRepo {
  final ApiService apiService;
  final Dio dio;

  SummarizeRepo(this.apiService, this.dio);

  Future<void> summarizePdf(File file) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: MediaType('application', 'pdf'),
        ),
      });

      final response = await dio.post(
        ApiConstants.summarizeAsPdf,
        data: formData,
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
          responseType: ResponseType.bytes,
        ),
      );

      if (response.statusCode == 200) {
        saveAndOpenPdf(Uint8List.fromList(response.data));
      } else {
        throw Exception('Unexpected status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorData = e.response?.data;
      final errorMessage = errorData is Map && errorData['message'] != null
          ? errorData['message']
          : 'Summarization failed';
      throw Exception(errorMessage);
    }
  }
}
