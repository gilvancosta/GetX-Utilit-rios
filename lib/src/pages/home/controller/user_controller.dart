// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get/get.dart';
import 'package:getx_utilitarios/src/domain/entities/user_entity.dart';

import 'package:getx_utilitarios/src/domain/repositories/user_repository.dart';

class UserController extends GetxController with StateMixin<List<UserEntity>>, ScrollMixin {
  final UserRepository userRepository;
  late final Worker workerPage;

  final _page = 1.obs;
  final _limit = 12;

  final _loading = false.obs;

  UserController({
    required this.userRepository,
  });

  bool get loading => _loading.value;

  @override
  void onInit() {
    workerPage = ever<int>(_page, (_) {
      findUser();
    });
    super.onInit();
  }

  @override
  void onReady() {
    findUser();
    super.onReady();
  }

  @override
  void onClose() {
    workerPage.dispose();
    super.onClose();
  }

  void nextPage() => _page.value++;

  Future<void> findUser() async {

    _loading.value = true;

    final result = await userRepository.getUsers(_page.value, _limit);
    
    final stateResult = state ?? <UserEntity>[];
// adiciona a lista de usuários no estado
    stateResult.addAll(result);

    // change informa a alteração de estado
    change(stateResult, status: RxStatus.success());
      _loading.value = false;
  }

  @override
  Future<void> onTopScroll() async {}

  @override
  Future<void> onEndScroll() async {
    _page.value++;
    // return super.onEndScroll();
  }
}
