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
        (state) {
          final totalItems = state?.length ?? 0;
          return ListView.builder(
            controller: controller.scroll,
            itemCount: totalItems + 1,
            itemBuilder: (context, index) {
              if (index == totalItems) {
                return Obx(() => Visibility(
                      visible: controller.isLoading,
                      child: const Center(
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              'Carregando...',
                              style: TextStyle(fontSize: 16.0, color: Colors.red),
                            )),
                      ),
                    ));
              }

              final user = state?[index];
              return ListTile(
                title: Text('${user?.id} - ${user?.name}'),
                subtitle: Text(user?.email ?? 'Sem email'),
              );
            },
          );
        },
        // onError: (error) => Center(child: Text(error)),
      ),
/*       floatingActionButton: FloatingActionButton(
        onPressed: controller.nextPage,
        child: const Icon(Icons.add),
      ), */
    );
  }
}
