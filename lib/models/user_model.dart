class User {
  final String id;
  final String name;
  final String username;
  final String email;
  final String? profileImage;
  final String? bannerImage;
  final String? bio;
  final int followersCount;
  final int followingCount;
  final int tweetsCount;
  final bool isVerified;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.profileImage,
    this.bannerImage,
    this.bio,
    this.followersCount = 0,
    this.followingCount = 0,
    this.tweetsCount = 0,
    this.isVerified = false,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      profileImage: json['profileImage'],
      bannerImage: json['bannerImage'],
      bio: json['bio'],
      followersCount: json['followersCount'] ?? 0,
      followingCount: json['followingCount'] ?? 0,
      tweetsCount: json['tweetsCount'] ?? 0,
      isVerified: json['isVerified'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'profileImage': profileImage,
      'bannerImage': bannerImage,
      'bio': bio,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'tweetsCount': tweetsCount,
      'isVerified': isVerified,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
