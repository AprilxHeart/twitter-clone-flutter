import 'package:get/get.dart';
import '../models/tweet_model.dart';
import '../models/user_model.dart';
import '../services/mock_data_service.dart';
import 'auth_controller.dart';

class TweetController extends GetxController {
  static TweetController get to => Get.find();

  final _tweets = <Tweet>[].obs;
  final _isLoading = false.obs;
  final _searchQuery = ''.obs;
  final _filteredTweets = <Tweet>[].obs;

  List<Tweet> get tweets => _tweets;
  bool get isLoading => _isLoading.value;
  String get searchQuery => _searchQuery.value;
  List<Tweet> get filteredTweets =>
      _searchQuery.value.isEmpty ? _tweets : _filteredTweets;

  @override
  void onInit() {
    super.onInit();
    loadTweets();
  }

  Future<void> loadTweets() async {
    _isLoading.value = true;

    try {
      // Simulate API delay
      await Future.delayed(Duration(milliseconds: 800));

      final tweets = MockDataService.getTweets();
      _tweets.assignAll(tweets);

      _isLoading.value = false;
    } catch (e) {
      _isLoading.value = false;
      Get.snackbar('Error', 'Failed to load tweets');
    }
  }

  Future<void> addTweet(String content, {List<String>? images}) async {
    _isLoading.value = true;

    try {
      // Simulate API delay
      await Future.delayed(Duration(seconds: 1));

      final currentUser = AuthController.to.currentUser;
      if (currentUser == null) {
        Get.snackbar('Error', 'You must be logged in to tweet');
        return;
      }

      final newTweet = Tweet(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: content,
        author: currentUser,
        createdAt: DateTime.now(),
        images: images,
      );

      MockDataService.addTweet(newTweet);
      _tweets.insert(0, newTweet);

      _isLoading.value = false;
      Get.snackbar('Success', 'Tweet posted successfully!');
    } catch (e) {
      _isLoading.value = false;
      Get.snackbar('Error', 'Failed to post tweet');
    }
  }

  void toggleLike(String tweetId) {
    MockDataService.toggleLike(tweetId);

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

  void toggleRetweet(String tweetId) {
    MockDataService.toggleRetweet(tweetId);

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

  void searchTweets(String query) {
    _searchQuery.value = query;

    if (query.isEmpty) {
      _filteredTweets.clear();
    } else {
      final results = MockDataService.searchTweets(query);
      _filteredTweets.assignAll(results);
    }
  }

  void clearSearch() {
    _searchQuery.value = '';
    _filteredTweets.clear();
  }

  List<Tweet> getTweetsByUser(String userId) {
    return MockDataService.getTweetsByUserId(userId);
  }

  Tweet? getTweetById(String id) {
    return MockDataService.getTweetById(id);
  }

  void refreshTweets() {
    loadTweets();
  }
}
