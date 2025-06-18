import '../models/user_model.dart';
import '../models/tweet_model.dart';

class MockDataService {
  static final List<User> _users = [
    User(
      id: '1',
      name: 'Elon Musk',
      username: 'elonmusk',
      email: 'elon@tesla.com',
      profileImage: 'assets/images/face1.jpeg',
      bio:
          'Mars, cars, rockets, AI, solar, batteries, tunnels, brain chips, sustainable energy, dogecoin',
      followersCount: 150000000,
      followingCount: 500,
      tweetsCount: 25000,
      isVerified: true,
      createdAt: DateTime(2009, 6, 2),
    ),
    User(
      id: '2',
      name: 'Twitter',
      username: 'Twitter',
      email: 'support@twitter.com',
      profileImage: 'assets/images/face2.jpeg',
      bio: 'What\'s happening?!',
      followersCount: 65000000,
      followingCount: 0,
      tweetsCount: 15000,
      isVerified: true,
      createdAt: DateTime(2007, 3, 21),
    ),
    User(
      id: '3',
      name: 'Flutter',
      username: 'FlutterDev',
      email: 'flutter@google.com',
      profileImage: 'assets/images/face3.jpeg',
      bio:
          'Flutter is Google\'s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
      followersCount: 500000,
      followingCount: 100,
      tweetsCount: 5000,
      isVerified: true,
      createdAt: DateTime(2017, 5, 17),
    ),
    User(
      id: '4',
      name: 'Carol Danvers',
      username: 'dan_carol',
      email: 'carol@marvel.com',
      profileImage: 'assets/images/face4.jpeg',
      bio: 'Higher, further, faster. Captain Marvel.',
      followersCount: 2500000,
      followingCount: 150,
      tweetsCount: 1200,
      isVerified: true,
      createdAt: DateTime(2019, 3, 8),
    ),
    User(
      id: '5',
      name: 'Tony Stark',
      username: 'ironman',
      email: 'tony@starkindustries.com',
      profileImage: 'assets/images/face5.jpeg',
      bio: 'Genius, billionaire, playboy, philanthropist. And now, a dad.',
      followersCount: 5000000,
      followingCount: 200,
      tweetsCount: 3000,
      isVerified: true,
      createdAt: DateTime(2008, 5, 2),
    ),
  ];

  static final List<Tweet> _tweets = [
    Tweet(
      id: '1',
      content:
          'Create the highest, grandest vision possible for your life, because you become what you believe.',
      author: _users[0],
      createdAt: DateTime.now().subtract(Duration(hours: 2)),
      likesCount: 15000,
      retweetsCount: 2500,
      repliesCount: 800,
    ),
    Tweet(
      id: '2',
      content: 'When you can\'t find the sunshine, be the sunshine ☀️',
      author: _users[1],
      createdAt: DateTime.now().subtract(Duration(hours: 4)),
      likesCount: 8500,
      retweetsCount: 1200,
      repliesCount: 450,
      images: ['assets/images/image1.jpeg'],
    ),
    Tweet(
      id: '3',
      content: 'The grass is greener where you water it 💚',
      author: _users[2],
      createdAt: DateTime.now().subtract(Duration(hours: 6)),
      likesCount: 3200,
      retweetsCount: 800,
      repliesCount: 200,
    ),
    Tweet(
      id: '4',
      content: 'Wherever life plants you, bloom with grace 🌸',
      author: _users[3],
      createdAt: DateTime.now().subtract(Duration(hours: 8)),
      likesCount: 12000,
      retweetsCount: 1800,
      repliesCount: 600,
      images: ['assets/images/face4.jpeg'],
    ),
    Tweet(
      id: '5',
      content:
          'So, what if, instead of thinking about solving your whole life, you just think about adding additional good things. One at a time. Just let your pile of good things grow.',
      author: _users[4],
      createdAt: DateTime.now().subtract(Duration(hours: 10)),
      likesCount: 8500,
      retweetsCount: 1500,
      repliesCount: 400,
    ),
    Tweet(
      id: '6',
      content:
          'Little by little, day by day, what is meant for you WILL find its way ✨',
      author: _users[0],
      createdAt: DateTime.now().subtract(Duration(hours: 12)),
      likesCount: 22000,
      retweetsCount: 3500,
      repliesCount: 1200,
      images: ['assets/images/image2.jpeg'],
    ),
  ];

  // Get all users
  static List<User> getUsers() {
    return List.from(_users);
  }

  // Get user by ID
  static User? getUserById(String id) {
    try {
      return _users.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get all tweets
  static List<Tweet> getTweets() {
    return List.from(_tweets);
  }

  // Get tweets by user ID
  static List<Tweet> getTweetsByUserId(String userId) {
    return _tweets.where((tweet) => tweet.author.id == userId).toList();
  }

  // Get tweet by ID
  static Tweet? getTweetById(String id) {
    try {
      return _tweets.firstWhere((tweet) => tweet.id == id);
    } catch (e) {
      return null;
    }
  }

  // Add new tweet
  static void addTweet(Tweet tweet) {
    _tweets.insert(0, tweet);
  }

  // Like/Unlike tweet
  static void toggleLike(String tweetId) {
    final index = _tweets.indexWhere((tweet) => tweet.id == tweetId);
    if (index != -1) {
      final tweet = _tweets[index];
      final newLikesCount =
          tweet.isLiked ? tweet.likesCount - 1 : tweet.likesCount + 1;
      _tweets[index] = tweet.copyWith(
        isLiked: !tweet.isLiked,
        likesCount: newLikesCount,
      );
    }
  }

  // Retweet/Unretweet
  static void toggleRetweet(String tweetId) {
    final index = _tweets.indexWhere((tweet) => tweet.id == tweetId);
    if (index != -1) {
      final tweet = _tweets[index];
      final newRetweetsCount =
          tweet.isRetweeted ? tweet.retweetsCount - 1 : tweet.retweetsCount + 1;
      _tweets[index] = tweet.copyWith(
        isRetweeted: !tweet.isRetweeted,
        retweetsCount: newRetweetsCount,
      );
    }
  }

  // Search users
  static List<User> searchUsers(String query) {
    final lowercaseQuery = query.toLowerCase();
    return _users
        .where((user) =>
            user.name.toLowerCase().contains(lowercaseQuery) ||
            user.username.toLowerCase().contains(lowercaseQuery) ||
            (user.bio?.toLowerCase().contains(lowercaseQuery) ?? false))
        .toList();
  }

  // Search tweets
  static List<Tweet> searchTweets(String query) {
    final lowercaseQuery = query.toLowerCase();
    return _tweets
        .where((tweet) =>
            tweet.content.toLowerCase().contains(lowercaseQuery) ||
            tweet.author.name.toLowerCase().contains(lowercaseQuery) ||
            tweet.author.username.toLowerCase().contains(lowercaseQuery))
        .toList();
  }
}
