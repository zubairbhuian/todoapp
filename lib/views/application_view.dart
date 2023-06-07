import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/application_controller.dart';
import 'package:todoapp/views/Products_view.dart';
import 'package:todoapp/views/payment_view.dart';
import 'package:todoapp/views/profile_view.dart';

import 'package:todoapp/views/todo_view.dart';

class ApplicationView extends GetView<ApplicationController> {
  const ApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const ProductsView(),
      const TodoView(),
      const PaymentView(),
      const ProfileView()
    ];

    return GetBuilder<ApplicationController>(
        builder: (controller) => Scaffold(
              body: pages[controller.pageIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.pageIndex,
                onTap: (index) {
                  controller.pageIndex = index;
                  controller.update();
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.production_quantity_limits),
                    label: 'Products',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.message),
                    label: 'Todos',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.payment),
                    label: 'Donate Us',
                  ),
                   BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Donate Us',
                  ),
                ],
              ),
            ));
  }
}
