import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:meta/meta.dart';
import 'package:whether_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:whether_app/widgets/custom_widget/custom_snackBar.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  getLocationSuggestion({required String searchItem}) async{

    emit(SearchLoading());
    try {
      List<Placemark> finalSearchItems = [];
      List<Location> locations = await locationFromAddress(searchItem);

      locations.forEach((element) async {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            element.latitude, element.longitude);
        finalSearchItems.add(placemarks.first);
      },);

      emit(SearchLoaded(locations: locations, placeMarks: finalSearchItems));
    }catch(e){
      if (kDebugMode) {
        print("ERROR SEARCH =$e");
      }
      // customSnackBar(message: "Something went wrong please try again later",isErrorMessage: true);
    }
  }
}
