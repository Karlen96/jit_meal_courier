import 'dart:async';

import '../../constants/requests_url.dart';
import '../../models/token_model/token_model.dart';
import '../../models/user_model/user_model.dart';
import '../dio.dart';

class AuthRepository {
  static Future<TokenModel> signIn({
    required UserModel userModel,
  }) async {
    final res = await dio.post(
      RequestsUrl.auth,
      data: userModel.toJson(),
    );
    return TokenModel.fromJson(res.data);
  }
}
