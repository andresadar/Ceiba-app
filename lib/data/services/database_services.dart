import 'package:ceiba_app/data/services/user_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../models/user_model.dart';

///[DatabaseServices] es la clase que contiene los servicios de la aplicación
///comunicándose con la base de datos local de la aplicación
class DatabaseServices {
  DatabaseServices(this._usersServices);

  ///[UsersServices] es la clase que contiene los servicios de la aplicación
  final UsersServices _usersServices;

  ///[resetUsers] es el método que reinicia los usuarios de la base de datos local
  Future<void> _resetUsers() async {
    final Box<UserModel> usersBox = Hive.box<UserModel>('users');
    await usersBox.clear();
  }

  ///[saveUsers] es el método que agrega un usuario a la base de datos local
  Future<List<int>> _saveUsers(List<UserModel> users) async {
    _resetUsers();
    final box = await Hive.openBox<UserModel>('users');
    return (await box.addAll(users)).toList();
  }

  ///[getUsers] es el método que obtiene los usuarios de la base de datos local
  Future<List<UserModel>> getUsers() async {
    final box = await Hive.openBox<UserModel>('users');

    ///Si la base de datos local no tiene usuarios, se obtienen del API
    if (box.isEmpty) {
      final users = await _usersServices.getUsers();
      await _saveUsers(users);
      return users;
    } else {
      return box.values.toList();
    }
  }
}

final databaseServicesProvider = Provider.autoDispose(
    (ref) => DatabaseServices(ref.read(usersServicesProvider)));
