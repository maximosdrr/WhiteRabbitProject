class Token {
  String accessToken;

  Token({this.accessToken});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = 'Bearer ${json['access_token']}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    return data;
  }
}
