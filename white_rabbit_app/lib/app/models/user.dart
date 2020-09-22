class User {
  String id;
  String username;
  String name;
  String icon;

  User({this.id, this.username, this.name, this.icon});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}
