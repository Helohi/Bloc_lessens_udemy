class User {
  User({required this.id, required this.name, this.email, this.phone});

  int id;
  String name;
  String? email;
  String? phone;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        email: json['email'] ?? '',
        phone: json['phone'] ?? '');
  }
}
