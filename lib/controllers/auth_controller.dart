import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../services/mock_data_service.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final _currentUser = Rxn<User>();
  final _isLoggedIn = false.obs;
  final _isLoading = false.obs;

  User? get currentUser => _currentUser.value;
  bool get isLoggedIn => _isLoggedIn.value;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');

    if (userId != null) {
      final user = MockDataService.getUserById(userId);
      if (user != null) {
        _currentUser.value = user;
        _isLoggedIn.value = true;
      }
    }
  }

  Future<bool> login(String email, String password) async {
    _isLoading.value = true;

    try {
      // Simulate API delay
      await Future.delayed(Duration(seconds: 1));

      // Mock login logic
      final users = MockDataService.getUsers();
      final user = users.firstWhereOrNull((user) =>
              user.email.toLowerCase() == email.toLowerCase() &&
              password == 'password123' // Mock password
          );

      if (user != null) {
        _currentUser.value = user;
        _isLoggedIn.value = true;

        // Save to local storage
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_id', user.id);

        _isLoading.value = false;
        return true;
      } else {
        _isLoading.value = false;
        return false;
      }
    } catch (e) {
      _isLoading.value = false;
      return false;
    }
  }

  Future<void> logout() async {
    _isLoading.value = true;

    try {
      // Simulate API delay
      await Future.delayed(Duration(milliseconds: 500));

      _currentUser.value = null;
      _isLoggedIn.value = false;

      // Clear local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user_id');

      _isLoading.value = false;
    } catch (e) {
      _isLoading.value = false;
    }
  }

  Future<bool> register(
      String name, String username, String email, String password) async {
    _isLoading.value = true;

    try {
      // Simulate API delay
      await Future.delayed(Duration(seconds: 2));

      // Mock registration logic
      final users = MockDataService.getUsers();
      final existingUser = users.firstWhereOrNull((user) =>
          user.email.toLowerCase() == email.toLowerCase() ||
          user.username.toLowerCase() == username.toLowerCase());

      if (existingUser != null) {
        _isLoading.value = false;
        return false; // User already exists
      }

      // Create new user (in real app, this would be saved to database)
      final newUser = User(
        id: (users.length + 1).toString(),
        name: name,
        username: username,
        email: email,
        createdAt: DateTime.now(),
      );

      _currentUser.value = newUser;
      _isLoggedIn.value = true;

      // Save to local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', newUser.id);

      _isLoading.value = false;
      return true;
    } catch (e) {
      _isLoading.value = false;
      return false;
    }
  }
}
