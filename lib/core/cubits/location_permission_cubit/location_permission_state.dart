part of 'location_permission_cubit.dart';

@immutable
abstract class LocationPermissionState {}

class LocationPermissionLoading extends LocationPermissionState {}
class LocationPermissionNotEnabled extends LocationPermissionState {}
class LocationPermissionMissing extends LocationPermissionState {}
class LocationPermissionSuccess extends LocationPermissionState {
  final String locationName;
  final Position position;
  LocationPermissionSuccess({required this.position ,required this.locationName});
}

