part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

 class SearchLoading extends SearchState {}

 class SearchLoaded extends SearchState {
 final List<Location> locations;
 final List<Placemark> placeMarks;
 SearchLoaded({required this.locations,required this.placeMarks});
 }