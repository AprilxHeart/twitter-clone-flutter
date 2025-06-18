import 'user_model.dart';

class Tweet {
  final String id;
  final String content;
  final User author;
  final DateTime createdAt;
  final int likesCount;
  final int retweetsCount;
  final int repliesCount;
  final List<String>? images;
  final bool isLiked;
  final bool isRetweeted;
  final Tweet? retweetedTweet;
  final Tweet? replyTo;

  Tweet({
    required this.id,
    required this.content,
    required this.author,
    required this.createdAt,
    this.likesCount = 0,
    this.retweetsCount = 0,
    this.repliesCount = 0,
    this.images,
    this.isLiked = false,
    this.isRetweeted = false,
    this.retweetedTweet,
    this.replyTo,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      id: json['id'],
      content: json['content'],
      author: User.fromJson(json['author']),
      createdAt: DateTime.parse(json['createdAt']),
      likesCount: json['likesCount'] ?? 0,
      retweetsCount: json['retweetsCount'] ?? 0,
      repliesCount: json['repliesCount'] ?? 0,
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      isLiked: json['isLiked'] ?? false,
      isRetweeted: json['isRetweeted'] ?? false,
      retweetedTweet: json['retweetedTweet'] != null
          ? Tweet.fromJson(json['retweetedTweet'])
          : null,
      replyTo: json['replyTo'] != null ? Tweet.fromJson(json['replyTo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'author': author.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'likesCount': likesCount,
      'retweetsCount': retweetsCount,
      'repliesCount': repliesCount,
      'images': images,
      'isLiked': isLiked,
      'isRetweeted': isRetweeted,
      'retweetedTweet': retweetedTweet?.toJson(),
      'replyTo': replyTo?.toJson(),
    };
  }

  Tweet copyWith({
    String? id,
    String? content,
    User? author,
    DateTime? createdAt,
    int? likesCount,
    int? retweetsCount,
    int? repliesCount,
    List<String>? images,
    bool? isLiked,
    bool? isRetweeted,
    Tweet? retweetedTweet,
    Tweet? replyTo,
  }) {
    return Tweet(
      id: id ?? this.id,
      content: content ?? this.content,
      author: author ?? this.author,
      createdAt: createdAt ?? this.createdAt,
      likesCount: likesCount ?? this.likesCount,
      retweetsCount: retweetsCount ?? this.retweetsCount,
      repliesCount: repliesCount ?? this.repliesCount,
      images: images ?? this.images,
      isLiked: isLiked ?? this.isLiked,
      isRetweeted: isRetweeted ?? this.isRetweeted,
      retweetedTweet: retweetedTweet ?? this.retweetedTweet,
      replyTo: replyTo ?? this.replyTo,
    );
  }
}
