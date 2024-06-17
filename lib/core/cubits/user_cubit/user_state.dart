part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class Loading extends UserState {}

final class HasData extends UserState {
  final WeatherModel model;
  final String? name;
  HasData({required this.model,this.name});
}
