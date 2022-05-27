import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  UserModel._();

  factory UserModel({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    @JsonKey(name: 'Password') String? password,
    @JsonKey(name: 'Username') String? userName,
  }) = _UserModel;

  late final fullName = '$firstName $lastName';

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
