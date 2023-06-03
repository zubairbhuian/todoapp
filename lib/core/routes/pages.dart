// ignore_for_file: constant_identifier_names
import 'package:get/get.dart';
import 'package:todoapp/views/application/index.dart';
import 'package:todoapp/views/intro/intro_view.dart';
import 'package:todoapp/views/login/index.dart';
import 'package:todoapp/views/payment/index.dart';
import 'package:todoapp/views/todo/index.dart';

import '../../views/products/index.dart';
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
        middlewares:[ RouteWlcomMiddleware(priority: 1)]
        ),
    GetPage(
        name: SIGN_IN,
        page: () => const LoginView(),
        binding: LogInBinding()),
    GetPage(
        name: APPLICATION,
        page: () => const ApplicationView(),
        binding: ApplicationBinding()),
    GetPage(
        name:AppRoutes.TODO,
        page: () => const TodoView(),
        binding: TodoBinding()),   
    GetPage(
        name:AppRoutes.PRODUCTS,
        page: () => const ProductsView(),
        binding: ProductsBinding()),
     GetPage(
        name:AppRoutes.PAYMENT,
        page: () => const PaymentView(),
        binding: PaymentBinding()),
  ];
}
