import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_utilitarios/src/domain/repositories/user_repository.dart';

import 'pages/home/controller/user_controller.dart';
import 'pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => Dio(BaseOptions(baseUrl: 'http://10.0.0.112:8080/')), fenix: true);
        Get.lazyPut(() => UserRepository(dio: Get.find()), fenix: true);
      }),
      getPages: [
        GetPage(
          name: '/',
          binding: BindingsBuilder.put(() => UserController(userRepository: Get.find())),
          page: () => const HomePage(),
        ),
/*         GetPage(
          name: '/getx-controller',
          binding: BindingsBuilder.put(() => Controller()),
          page: () => const ControllerPage(),
        ), */
      ],
    );
  }
}
