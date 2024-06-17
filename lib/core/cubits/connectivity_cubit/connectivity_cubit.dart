import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityInitial());
  late StreamSubscription subscription;

  // checkConnectivity(){
  //   subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
  //     if(result != ConnectivityResult.mobile || result != ConnectivityResult.wifi){
  //       ///SHOW ERROR SCREEN
  //     }else{
  //
  //     }
  //     // Got a new connectivity status!
  //   });
  // }

  @override
  Future<void> close() async {
    await subscription.cancel();
    return super.close();
  }
}
