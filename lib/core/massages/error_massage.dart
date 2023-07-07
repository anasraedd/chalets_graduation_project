import 'package:equatable/equatable.dart';

class ErrorMessage extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

 const ErrorMessage({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];

  factory ErrorMessage.fromJson({required Map<String, dynamic> json}) {
    return ErrorMessage(
      statusCode: json['status_code'],
      statusMessage: json['status-message'],
      success: json['success'],
    );
  }

}
