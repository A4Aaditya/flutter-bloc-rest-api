class ErrorEntiry {
  String? title;
  String? message;
  String? resolution;

  ErrorEntiry({this.title, this.message, this.resolution});

  ErrorEntiry.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    resolution = json['resolution'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    data['resolution'] = resolution;
    return data;
  }
}
