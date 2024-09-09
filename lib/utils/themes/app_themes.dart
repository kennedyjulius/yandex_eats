import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:yandex_eats/utils/themes/colors.dart';

/// {@template app_theme}
/// The Default App [ThemeData].
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme();

  /// Defines the brightness of the theme.
  Brightness get brightness => Brightness.light;

  /// Defines the primary color of the theme.
  Color get primary => AppColors.deepBlue;

  /// Defines light [ThemeData].
  ShadThemeData get theme => ShadThemeData(
        brightness: Brightness.light,
        colorScheme: ShadBlueColorScheme.light(primary: primary),
        textTheme: shadTextTheme,
        inputTheme: ShadInputTheme(
          placeholderStyle: textTheme.bodyMedium?.copyWith(
            color: AppColors.grey,
          ),
        ),
      );

  /// Defines shadcn_ui [TextTheme].
  ShadTextTheme get shadTextTheme => ShadTextTheme(
        family: 'Inter',
        package: 'app_ui',
        h1Large: textTheme.displayMedium,
        h1: textTheme.displaySmall,
        h2: textTheme.headlineLarge,
        h3: textTheme.headlineSmall,
        h4: textTheme.titleLarge,
        p: textTheme.bodyLarge,
        table: textTheme.labelLarge,
        small: textTheme.bodyLarge,
        muted: textTheme.bodyMedium,
      );

  /// Text theme of the App theme.
  TextTheme get textTheme => uiTextTheme;

  /// The content text theme based on [TextStyle].
  static final uiTextTheme = const TextTheme(
    displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
    titleLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
    labelLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
    bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
    labelSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500),
  ).apply(
    bodyColor: AppColors.black,
    displayColor: AppColors.black,
    decorationColor: AppColors.black,
  );
}

/// {@template app_dark_theme}
/// Dark Mode App [ThemeData].
/// {@endtemplate}
class AppDarkTheme extends AppTheme {
  /// {@macro app_dark_theme}
  const AppDarkTheme();

  @override
  Brightness get brightness => Brightness.dark;

  @override
  TextTheme get textTheme => AppTheme.uiTextTheme.apply(
        bodyColor: AppColors.white,
        displayColor: AppColors.white,
        decorationColor: AppColors.white,
      );

  @override
  ShadThemeData get theme => ShadThemeData(
        brightness: brightness,
        colorScheme: ShadBlueColorScheme.dark(primary: primary),
        textTheme: shadTextTheme,
        inputTheme: ShadInputTheme(
          placeholderStyle: textTheme.bodyMedium?.copyWith(
            color: AppColors.grey,
          ),
        ),
      );
}

/// Theme for the [SystemUiOverlayStyle]
class SystemUiOverlayTheme {
  /// {@macro system_ui_overlay_theme}
  const SystemUiOverlayTheme();

  /// Defines iOS light SystemUiOverlayStyle.
  static const SystemUiOverlayStyle iOSLightSystemBarTheme =
      SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: AppColors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  /// Defines iOS dark SystemUiOverlayStyle.
  static const SystemUiOverlayStyle iOSDarkSystemBarTheme =
      SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: AppColors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  /// Defines Android light SystemUiOverlayStyle.
  static const SystemUiOverlayStyle androidLightSystemBarTheme =
      SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: AppColors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  /// Defines Android dark SystemUiOverlayStyle.
  static const SystemUiOverlayStyle androidDarkSystemBarTheme =
      SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: AppColors.black,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  /// Defines Android light transparent SystemUiOverlayStyle.
  static const SystemUiOverlayStyle androidTransparentLightSystemBarTheme =
      SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: AppColors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  /// Defines Android dark transparent SystemUiOverlayStyle.
  static const SystemUiOverlayStyle androidTransparentDarkSystemBarTheme =
      SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: AppColors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  /// Defines adaptive iOS SystemUiOverlayStyle.
  static SystemUiOverlayStyle adaptiveOSSystemBarTheme({
    required bool light,
    required bool persistLight,
  }) {
    return light
        ? iOSLightSystemBarTheme
        : persistLight
            ? iOSLightSystemBarTheme
            : iOSDarkSystemBarTheme;
  }

  /// Defines adaptive Android SystemUiOverlayStyle.
  static SystemUiOverlayStyle adaptiveAndroidTransparentSystemBarTheme({
    required bool light,
    required bool persistLight,
  }) {
    return light
        ? androidTransparentLightSystemBarTheme
        : persistLight
            ? androidTransparentLightSystemBarTheme
            : androidTransparentDarkSystemBarTheme;
  }

  /// Sets the device orientation to portrait only.
  static void setPortraitOrientation() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
  }
}
