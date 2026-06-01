# AuraWalls 🎨

A beautiful and modern wallpaper application built with Flutter. Browse, discover, and save stunning wallpapers with an elegant user interface and smooth animations.

## ✨ Features

- 🏠 **Home Screen** - Browse featured and trending wallpapers
- 🔍 **Discover** - Explore new wallpapers across different categories
- 📚 **Collections** - Organized wallpaper collections for easy browsing
- ❤️ **Favorites** - Save and manage your favorite wallpapers
- 👤 **Profile** - Personalize your experience
- 🎯 **Wallpaper Details** - View high-resolution wallpapers with smooth transitions
- 🌙 **Dark Mode** - Beautiful dark theme for comfortable viewing
- 🎭 **Smooth Animations** - Elegant fade and slide transitions throughout the app

## 📸 Screenshots

<div align="center">
  <img src="screenshots/Simulator Screenshot - iPhone 17 Pro Max - 2026-06-01 at 16.26.43.png" width="200" alt="Home Screen"/>
  <img src="screenshots/Simulator Screenshot - iPhone 17 Pro Max - 2026-06-01 at 16.30.07.png" width="200" alt="Discover"/>
  <img src="screenshots/Simulator Screenshot - iPhone 17 Pro Max - 2026-06-01 at 16.30.40.png" width="200" alt="Collections"/>
  <img src="screenshots/Simulator Screenshot - iPhone 17 Pro Max - 2026-06-01 at 16.30.43.png" width="200" alt="Favorites"/>
</div>

<div align="center">
  <img src="screenshots/Simulator Screenshot - iPhone 17 Pro Max - 2026-06-01 at 16.30.46.png" width="200" alt="Profile"/>
  <img src="screenshots/Simulator Screenshot - iPhone 17 Pro Max - 2026-06-01 at 16.39.13.png" width="200" alt="Wallpaper Details"/>
</div>

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.11.4 or higher)
- Dart SDK
- iOS Simulator / Android Emulator / Physical Device

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/wallpapers_app.git
cd wallpapers_app
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## 🛠️ Built With

- **[Flutter](https://flutter.dev/)** - UI framework
- **[Riverpod](https://riverpod.dev/)** - State management (^3.3.1)
- **[GoRouter](https://pub.dev/packages/go_router)** - Navigation and routing (^17.2.3)
- **[Flutter Staggered Grid View](https://pub.dev/packages/flutter_staggered_grid_view)** - Beautiful grid layouts (^0.7.0)

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
└── src/
    ├── app/                  # App configuration
    │   ├── aura_walls_app.dart
    │   └── aura_shell.dart
    ├── core/                 # Core utilities and theme
    │   ├── models/
    │   └── theme/
    └── features/             # Feature modules
        ├── home/
        ├── discover/
        ├── collections/
        ├── favorites/
        ├── profile/
        └── details/
```

## 🎨 Features in Detail

### Navigation
- Bottom navigation bar for quick access to main sections
- Smooth page transitions with fade and slide animations
- Deep linking support for wallpaper details

### UI/UX
- Clean and modern Material Design
- Dark theme optimized for OLED displays
- Staggered grid layout for wallpaper browsing
- Hero animations for seamless transitions

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

Your Name - [@yourusername](https://github.com/yourusername)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- All contributors who help improve this project
- The open-source community

## 📱 Platform Support

- ✅ iOS
- ✅ Android
- ✅ Web
- ✅ macOS
- ✅ Linux
- ✅ Windows

---

<div align="center">
  Made with ❤️ using Flutter
</div>
