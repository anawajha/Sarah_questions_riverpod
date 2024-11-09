class AppResponse {
  bool success;
  int? code;
  String? message;
  dynamic data;

  AppResponse({
    required this.data,
    this.success = false,
    this.code,
    this.message,
  });

  factory AppResponse.fromJson(Map<String, dynamic> json) => AppResponse(
        success: json['success'],
        code: json['code'],
        message: json['message'],
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'message': message,
        'data': data,
      };
}
