import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
part 'location_permission_state.dart';


class LocationPermissionCubit extends Cubit<LocationPermissionState> {
  LocationPermissionCubit() : super(LocationPermissionLoading());
  Position? position;

  locationInit() async{
    emit(LocationPermissionLoading());
   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
   
    LocationPermission permission = await Geolocator.checkPermission();
    
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(LocationPermissionMissing());
      }
    }
    if (permission == LocationPermission.deniedForever) {
      emit(LocationPermissionMissing());
    }
    position = await Geolocator.getCurrentPosition();
    if(!serviceEnabled){
      emit(LocationPermissionNotEnabled());
    }
    if(position != null){
     final lName = await _getLocationName(position: position!);
      emit(LocationPermissionSuccess(locationName: lName,position: position!));
    }else{
      emit(LocationPermissionMissing());
    }
  }

  Future<String> _getLocationName({required Position position})async{
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    return placemarks.first.administrativeArea ?? "";
  }

}
