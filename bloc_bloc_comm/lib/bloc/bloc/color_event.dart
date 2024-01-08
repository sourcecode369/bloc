part of 'color_bloc.dart';

@immutable
sealed class ColorEvent {}

class ChangeColorEvent extends ColorEvent {}
