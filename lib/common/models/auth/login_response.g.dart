// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      candidateId: json['candidate_id'] as String?,
      candidateIdNoEnc: (json['candidate_id_no_enc'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      dob: json['dob'] as String?,
      photo: json['photo'] as String?,
      fullPhoto: json['full_path_photo'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      idNumber: json['id_number'] as String?,
      registeredForm: json['registeredForm'] as String?,
      showPopup: (json['show_popup'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'candidate_id': instance.candidateId,
      'candidate_id_no_enc': instance.candidateIdNoEnc,
      'full_name': instance.fullName,
      'dob': instance.dob,
      'photo': instance.photo,
      'full_path_photo': instance.fullPhoto,
      'email': instance.email,
      'phone': instance.phone,
      'id_number': instance.idNumber,
      'registeredForm': instance.registeredForm,
      'show_popup': instance.showPopup,
    };
