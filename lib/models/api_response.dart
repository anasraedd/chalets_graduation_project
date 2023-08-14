

class ApiResponse<T> {
  final String message;
  final bool success;
  T? object;
  String? requestId;

  ApiResponse(this.message, this.success, {this.object, this.requestId});

}