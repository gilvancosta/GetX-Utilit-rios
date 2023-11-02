// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get/get.dart';
import 'package:getx_utilitarios/src/domain/entities/user_entity.dart';

import 'package:getx_utilitarios/src/domain/repositories/user_repository.dart';

class UserController extends GetxController with StateMixin<List<UserEntity>> {
  final UserRepository userRepository;
  UserController({
    required this.userRepository,
  });

  @override
  void onReady() {
    super.onReady();
    findUser();
  }
  
  void findUser() async {
    final result = await   userRepository.getUsers();

    change(result, status: RxStatus.success());
 
  }

  
}
