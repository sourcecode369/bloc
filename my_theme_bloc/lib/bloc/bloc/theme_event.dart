// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {}

class ChangeThemeEvent extends ThemeEvent {
  final int randInt;

  ChangeThemeEvent({required this.randInt});

  @override
  String toString() => 'ChangeThemeEvent(randInt: $randInt)';

  @override
  List<Object?> get props => [randInt];
}
