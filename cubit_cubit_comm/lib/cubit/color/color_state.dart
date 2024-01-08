part of 'color_cubit.dart';

class ColorState extends Equatable {
  final Color color;

  const ColorState({required this.color});

  factory ColorState.initial() {
    return const ColorState(color: Colors.red);
  }

  @override
  List<Object> get props => [color];

  @override
  bool get stringify => true;

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }
}
