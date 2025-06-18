# 🐦 Twitter Clone - Flutter App

A modern Twitter clone built with Flutter, featuring a beautiful UI, authentication system, and real-time interactions using GetX state management.

![Twitter Clone](https://img.shields.io/badge/Flutter-3.10+-blue?style=for-the-badge&logo=flutter)
![GetX](https://img.shields.io/badge/GetX-4.6+-green?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

## ✨ Features

### 🔐 Authentication
- **Login/Register System** - Secure authentication with email and password
- **Session Management** - Persistent login state using SharedPreferences
- **Demo Credentials** - Test the app with provided demo accounts

### 🎨 Modern UI/UX
- **Material 3 Design** - Latest Material Design guidelines
- **Dark Theme** - Beautiful dark theme matching Twitter's aesthetic
- **Responsive Design** - Works perfectly on mobile, tablet, and desktop
- **Smooth Animations** - Fluid transitions and micro-interactions

### 📱 Core Twitter Features
- **Tweet Feed** - Scrollable timeline with real tweets
- **Like/Unlike** - Interactive like functionality with counters
- **Retweet** - Share tweets with retweet functionality
- **User Profiles** - Detailed user profiles with stats
- **Search** - Search through tweets and users
- **Real-time Updates** - Live updates using GetX reactive programming

### 🛠️ Technical Features
- **GetX State Management** - Efficient state management and dependency injection
- **Mock Data Service** - Comprehensive mock data for testing
- **Clean Architecture** - Well-organized code structure
- **Cross-platform** - Runs on Android, iOS, Web, and Desktop

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.10.0 or higher)
- Dart SDK (3.0.0 or higher)
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/twitter-clone-flutter.git
   cd twitter-clone-flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For web
   flutter run -d chrome
   
   # For mobile
   flutter run
   
   # For desktop
   flutter run -d windows
   ```

### Demo Credentials
Use these credentials to test the app:
- **Email:** `elon@tesla.com`
- **Password:** `password123`

## 📱 Screenshots

### Login Screen
![Login Screen](assets/screenshots/login.png)

### Home Feed
![Home Feed](assets/screenshots/home.png)

### Profile
![Profile](assets/screenshots/profile.png)

## 🏗️ Project Structure

```
lib/
├── controllers/          # GetX Controllers
│   ├── auth_controller.dart
│   └── tweet_controller.dart
├── models/              # Data Models
│   ├── user_model.dart
│   └── tweet_model.dart
├── screens/             # UI Screens
│   ├── login_screen.dart
│   ├── home.dart
│   ├── home_body.dart
│   └── profile.dart
├── services/            # Business Logic
│   └── mock_data_service.dart
├── utils/               # Utilities
│   └── constants.dart
└── main.dart           # App Entry Point
```

## 🎯 Key Technologies

- **Flutter** - UI Framework
- **GetX** - State Management & Navigation
- **Font Awesome** - Icons
- **SharedPreferences** - Local Storage
- **Material 3** - Design System

## 🔧 Configuration

### Environment Setup
The app is configured to work out of the box. No additional environment variables are required.

### Customization
You can customize the app by modifying:
- `lib/utils/constants.dart` - Colors, sizes, and text styles
- `lib/services/mock_data_service.dart` - Mock data
- `lib/controllers/` - Business logic

## 📊 Features in Detail

### Authentication System
- Email validation
- Password strength checking
- Session persistence
- Secure logout

### Tweet Management
- Create new tweets
- Like/unlike tweets
- Retweet functionality
- Tweet search
- User-specific feeds

### User Experience
- Loading states
- Error handling
- Smooth navigation
- Responsive design
- Accessibility support

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Twitter** - For the original design inspiration
- **Flutter Team** - For the amazing framework
- **GetX Community** - For the excellent state management solution

## 📞 Support

If you have any questions or need help, feel free to:
- Open an issue on GitHub
- Contact the maintainer
- Check the documentation

---

⭐ **Star this repository if you found it helpful!**
