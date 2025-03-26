import 'package:study_mate/Features/Auth/domain/Repos/auth_repo.dart';

import '../entities/login_entity.dart';
import '../../data/models/login_request_body.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<LoginEntity> call(LoginRequestBody requestBody) async {
    return await repository.login(requestBody);
  }
}