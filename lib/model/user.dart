class UserModel {
  late String id;
  late String name;
  late String email;
  late List<String> interests;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.interests,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    id = json['id'] ?? '';
    email = json['email'] ?? '';
    interests = json['interests'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['email'] = email;
    data['interests'] = interests;
    return data;
  }
}
