import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/user_model.dart';
import '../../data/services/user_services.dart';

///[UsersRepository] es el repositorio de la pantalla de usuarios
class UsersRepository {
  ///[UsersService] es el servicio de la pantalla de usuarios
  final UsersServices _usersService;

  UsersRepository(this._usersService);

  Future<List<UserModel>> getUsers() => _usersService.getUsers();

  Future<UserModel> getUser(int id) => _usersService.getUser(id);
}

final usersRepositoryProvider = Provider<UsersRepository>((ref) {
  return UsersRepository(ref.read(usersServicesProvider));
});
