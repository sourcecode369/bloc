part of 'theme_cubit.dart';

enum AppTheme { lightTheme, darkTheme }

class ThemeState extends Equatable {
  final AppTheme appTheme;

  const ThemeState({required this.appTheme});

  factory ThemeState.initial() {
    return const ThemeState(appTheme: AppTheme.darkTheme);
  }

  @override
  List<Object> get props => [appTheme];

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  @override
  bool get stringify => true;
}
