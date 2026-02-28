class User {
  final String id;
  final String name;
  final String? phone;
  final String? avatarUrl;
  final DateTime? createdAt;

  User({
    required this.id,
    required this.name,
    this.phone,
    this.avatarUrl,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? 'NewsNow用户',
      phone: json['phone'],
      avatarUrl: json['avatar_url'],
      createdAt: json['created_at'] != null 
          ? DateTime.tryParse(json['created_at']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'avatar_url': avatarUrl,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? phone,
    String? avatarUrl,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  String get maskedPhone {
    if (phone == null || phone!.length < 7) return '';
    return '${phone!.substring(0, 3)}****${phone!.substring(phone!.length - 4)}';
  }

  static User get defaultUser => User(
    id: '882347',
    name: 'NewsNow用户',
    phone: '133****3333',
  );
}
