import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class LoginResponse extends Equatable {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'candidate_id')
  final String? candidateId;
  @JsonKey(name: 'candidate_id_no_enc')
  final int? candidateIdNoEnc;
  @JsonKey(name: 'full_name')
  final String? fullName;
  @JsonKey(name: 'dob')
  final String? dob;
  @JsonKey(name: 'photo')
  final String? photo;
  @JsonKey(name: 'full_path_photo')
  final String? fullPhoto;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'id_number')
  final String? idNumber;
  @JsonKey(name: 'registeredForm')
  final String? registeredForm;
  @JsonKey(name: 'show_popup')
  final int? showPopup;

  const LoginResponse({
    this.message,
    this.token,
    this.candidateId,
    this.candidateIdNoEnc,
    this.fullName,
    this.dob,
    this.photo,
    this.fullPhoto,
    this.email,
    this.phone,
    this.idNumber,
    this.registeredForm,
    this.showPopup,
  });

  static LoginResponse fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String?, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  List<Object?> get props => [
        message,
        token,
        candidateId,
        candidateIdNoEnc,
        fullName,
        dob,
        photo,
        fullPhoto,
        email,
        phone,
        idNumber,
        registeredForm,
        showPopup,
      ];

  @override
  String toString() {
    return 'LoginResponse{message: $message, token: $token, candidateId: $candidateId, candidateIdNoEnc: $candidateIdNoEnc, fullName: $fullName, dob: $dob, photo: $photo, email: $email, phone: $phone, idNumber: $idNumber, registeredForm: $registeredForm, showPopup: $showPopup}';
  }
}
