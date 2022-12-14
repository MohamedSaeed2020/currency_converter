import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final int statusCode;
  final String errorMessage;

  const ErrorModel({
    required this.statusCode,
    required this.errorMessage,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      statusCode: json["status"],
      errorMessage: json["error"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": statusCode,
      "error": errorMessage,
    };
  }

  @override
  List<Object> get props => [statusCode, errorMessage];
}
