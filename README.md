# Blinkit Clone — Flutter + Riverpod

A UI clone of the Blinkit grocery-delivery app, built with **Flutter** and **flutter_riverpod** for state management. Includes an animated splash screen.

## Features

- **Animated splash screen** — logo pops in with an elastic scale + fade, a lightning-bolt icon flickers, then the tagline slides up before navigating to Home.
- **Home screen** — delivery-time header, address bar, search bar, promo banner, category grid, and a horizontally scrolling product rail.
- **Cart management via Riverpod** — `StateNotifierProvider` holds cart state; derived `Provider`s compute item count and total price reactively.
- **Product cards** — ADD button that morphs into a quantity stepper (+/-), discount badges, strikethrough MRP.
- **Cart screen** — full line-item list with quantity controls and a sticky "Proceed to Pay" bar.

## Project structure

```
lib/
├── main.dart                  # App entry point, wraps app in ProviderScope
├── theme/
│   └── app_theme.dart         # Colors & ThemeData
├── models/
│   ├── product.dart
│   └── category.dart
├── providers/
│   ├── product_provider.dart  # Mock product/category data
│   └── cart_provider.dart     # Cart StateNotifier + derived providers
├── screens/
│   ├── splash_screen.dart     # Animated splash
│   ├── home_screen.dart       # Main UI
│   └── cart_screen.dart       # Cart view
└── widgets/
    ├── category_tile.dart
    └── product_card.dart
```

## Getting started

1. Make sure you have the [Flutter SDK](https://docs.flutter.dev/get-started/install) installed (`flutter doctor` should be clean).
2. Unzip this project and open the folder in your terminal.
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run on a connected device / emulator:
   ```bash
   flutter run
   ```

## Notes

- Product & category images are pulled from Unsplash URLs via `cached_network_image` — swap these for your own asset paths or CDN URLs in `lib/providers/product_provider.dart` if you want offline/production imagery.
- All data is mocked in-memory (no backend). To wire up a real API, replace the contents of `product_provider.dart` with `FutureProvider`/`AsyncNotifier` calls to your backend.
- Fonts use Google Fonts (`Poppins`) — requires internet on first load, or bundle the font locally for production.

## Extending this UI

- Add a bottom navigation bar (Home / Categories / Cart / Account) in `main.dart`.
- Add a `ProductDetailScreen` for tapping into a product.
- Persist the cart with `shared_preferences` or `hive` by hooking into `CartNotifier`.
- Add a real address-selection flow instead of the static header text.
