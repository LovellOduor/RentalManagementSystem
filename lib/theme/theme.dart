import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      background: Color(0xfff5fafb) ,
      onBackground: Color(0xff171d1e),
      brightness: Brightness.light,
      primary: Color(4282408849),
      surfaceTint: Color(4282408849),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292273151),
      onPrimaryContainer: Color(4278197054),
      secondary: Color(4281492109),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291814911),
      onSecondaryContainer: Color(4278197556),
      tertiary: Color(4282081423),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4292142079),
      onTertiaryContainer: Color(4278197305),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294310651),
      onSurface: Color(4279704862),
      onSurfaceVariant: Color(4282664782),
      outline: Color(4285822847),
      outlineVariant: Color(4291086032),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inversePrimary: Color(4289382399),

    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      background: Color(0xfff5fafb) ,
      onBackground: Color(0xff171d1e),
      brightness: Brightness.light,
      primary: Color(4280501107),
      surfaceTint: Color(4282408849),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283921832),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278994543),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283070629),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279977074),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283594407),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310651),
      onSurface: Color(4279704862),
      onSurfaceVariant: Color(4282401610),
      outline: Color(4284243815),
      outlineVariant: Color(4286085763),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inversePrimary: Color(4289382399),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      background: Color(0xfff5fafb) ,
      onBackground: Color(0xff171d1e),
      brightness: Brightness.light,
      primary: Color(4278198602),
      surfaceTint: Color(4282408849),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280501107),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278199358),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278994543),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278199108),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4279977074),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310651),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280362027),
      outline: Color(4282401610),
      outlineVariant: Color(4282401610),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inversePrimary: Color(4293258495),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      background: Color(0xff0e1415) ,
      onBackground: Color(0xffdee3e5),
      brightness: Brightness.dark,
      primary: Color(4289382399),
      surfaceTint: Color(4289382399),
      onPrimary: Color(4278792287),
      primaryContainer: Color(4280764279),
      onPrimaryContainer: Color(4292273151),
      secondary: Color(4288531452),
      onSecondary: Color(4278203221),
      secondaryContainer: Color(4279454324),
      onSecondaryContainer: Color(4291814911),
      tertiary: Color(4288989694),
      onTertiary: Color(4278202717),
      tertiaryContainer: Color(4280305782),
      onTertiaryContainer: Color(4292142079),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279112725),
      onSurface: Color(4292797413),
      onSurfaceVariant: Color(4291086032),
      outline: Color(4287533209),
      outlineVariant: Color(4282664782),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797413),
      inversePrimary: Color(4282408849),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
       background: Color(0xff0e1415) ,
      onBackground: Color(0xffdee3e5),
      brightness: Brightness.dark,
      primary: Color(4289842175),
      surfaceTint: Color(4289382399),
      onPrimary: Color(4278195764),
      primaryContainer: Color(4285829574),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4288860159),
      onSecondary: Color(4278196268),
      secondaryContainer: Color(4284978371),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289449471),
      onTertiary: Color(4278196016),
      tertiaryContainer: Color(4285436869),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112725),
      onSurface: Color(4294376701),
      onSurfaceVariant: Color(4291349204),
      outline: Color(4288717740),
      outlineVariant: Color(4286612364),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797413),
      inversePrimary: Color(4280830072),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
       background: Color(0xff0e1415) ,
      onBackground: Color(0xffdee3e5),
      brightness: Brightness.dark,
      primary: Color(4294703871),
      surfaceTint: Color(4289382399),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289842175),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294638335),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4288860159),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294703871),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289449471),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112725),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294703871),
      outline: Color(4291349204),
      outlineVariant: Color(4291349204),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797413),
      inversePrimary: Color(4278200664),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
