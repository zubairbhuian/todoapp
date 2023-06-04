// ignore_for_file: constant_identifier_names
import 'package:get/get.dart';
import 'package:todoapp/views/intro_view.dart';


import '../../bindings/appllication_bindings.dart';
import '../../bindings/login_bindings.dart';
import '../../bindings/regestration_bindings.dart';
import '../../views/application_view.dart';
import '../../views/login_view.dart';
import '../../views/regestration_view.dart';
import '../middlewares/router_welcome.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const SIGN_IN = AppRoutes.SIGN_IN;
  static const APPLICATION = AppRoutes.Application;

  static List<GetPage> routes = [
    GetPage(
        name: INITIAL,
        page: () => const IntroView(),
        middlewares: [RouteWlcomMiddleware(priority: 1)]),
    GetPage(
        name: SIGN_IN, page: () => const LoginView(), binding: LogInBinding()),
    GetPage(
        name: AppRoutes.REGESTATION,
        page: () => const RegestrationView(),
        binding: RegestrationBinding()),
    GetPage(
        name: APPLICATION,
        page: () => const ApplicationView(),
        binding: ApplicationBinding()),
  
 
  ];
}
