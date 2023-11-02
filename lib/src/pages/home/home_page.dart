import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Usuários'),
        ),
        body: controller.obx(
          (state) => ListView.builder(
            itemCount: state?.length ?? 0,
            itemBuilder: (context, index) {
              final user = state?[index];
              return ListTile(
                title: Text(user?.name ?? 'Sem nome'),
                subtitle: Text(user?.email ?? 'Sem email'),
              );
            },
          ),
          // onError: (error) => Center(child: Text(error)),
        ));
  }
}
