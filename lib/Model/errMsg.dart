class ErrorMSG {
  bool success;
  String massage;
  ErrorMSG({required this.success, required this.massage});
  factory ErrorMSG.fromJson(Map<String, dynamic> json) =>
      ErrorMSG(success: json["success"], massage: json["massage"]);
  Map<String, dynamic> toJson() => {"success": success, "massage": massage};
}
