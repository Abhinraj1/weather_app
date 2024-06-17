import 'package:get/get.dart';
import 'package:whether_app/presentation/home_screen.dart';
import 'package:whether_app/presentation/search_screen.dart';
import 'package:whether_app/presentation/settings_screen.dart';
import 'package:whether_app/presentation/splash_Screen.dart';


List<GetPage> appRoutes(){
  return [
    GetPage(name: "/",
        page:()=> const SplashScreen()),
    GetPage(name: "/home",
        page:()=> const HomeScreen()),
    GetPage(name: "/settings",
        page:()=> const SettingsScreen()),
    GetPage(name: "/search",
        page:()=> const SearchScreen(),),
  ];

}
