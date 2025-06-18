import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xff1CA1F1);
  static const Color background = Color(0xff15202C);
  static const Color surface = Color(0xff1B2939);
  static const Color card = Color(0xff192734);

  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xff8899A6);
  static const Color textMuted = Color(0xff657786);

  // Border Colors
  static const Color border = Color(0xff38444D);
  static const Color divider = Color(0xff38444D);

  // Action Colors
  static const Color like = Color(0xffE0245E);
  static const Color retweet = Color(0xff17BF63);
  static const Color reply = Color(0xff1CA1F1);
  static const Color share = Color(0xff1CA1F1);

  // Status Colors
  static const Color success = Color(0xff17BF63);
  static const Color error = Color(0xffE0245E);
  static const Color warning = Color(0xffFAD202);
  static const Color info = Color(0xff1CA1F1);
}

class AppSizes {
  // Padding
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;

  // Border Radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;

  // Icon Sizes
  static const double iconS = 16.0;
  static const double iconM = 20.0;
  static const double iconL = 24.0;
  static const double iconXL = 32.0;

  // Avatar Sizes
  static const double avatarS = 32.0;
  static const double avatarM = 40.0;
  static const double avatarL = 48.0;
  static const double avatarXL = 64.0;
}

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.textMuted,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String search = '/search';
  static const String notifications = '/notifications';
  static const String messages = '/messages';
  static const String settings = '/settings';
}

class AppStrings {
  // Auth
  static const String signIn = 'Sign In';
  static const String signUp = 'Sign Up';
  static const String signOut = 'Sign Out';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String forgotPassword = 'Forgot Password?';

  // Navigation
  static const String home = 'Home';
  static const String explore = 'Explore';
  static const String notifications = 'Notifications';
  static const String messages = 'Messages';
  static const String bookmarks = 'Bookmarks';
  static const String lists = 'Lists';
  static const String profile = 'Profile';
  static const String more = 'More';

  // Actions
  static const String tweet = 'Tweet';
  static const String reply = 'Reply';
  static const String retweet = 'Retweet';
  static const String like = 'Like';
  static const String share = 'Share';
  static const String follow = 'Follow';
  static const String unfollow = 'Unfollow';
  static const String edit = 'Edit';
  static const String delete = 'Delete';

  // Messages
  static const String loading = 'Loading...';
  static const String error = 'Error';
  static const String success = 'Success';
  static const String noData = 'No data available';
  static const String retry = 'Retry';
  static const String cancel = 'Cancel';
  static const String save = 'Save';
  static const String confirm = 'Confirm';
}
