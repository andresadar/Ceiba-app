import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../data/models/user_model.dart';
import '../../../domain/repositories/database_repository.dart';
import 'users_state.dart';

///[UsersController] es la clase que contiene el controlador de la pantalla de usuarios
class UsersController extends StateNotifier<UsersState> {
  UsersController(this._databaseRepository) : super(UsersInitial()) {
    ///Se obtienen los usuarios de la base de datos
    ///al iniciar el controlador
    getUsers();
  }

  ///[DatabaseRepository] es el repositorio de la base de datos local
  final DatabaseRepository _databaseRepository;

  ///Canviar estado
  void changeState(UsersState state) => this.state = state;

  ///Lista de usuarios
  List<UserModel> listUsers() {
    if (state is UsersSuccess) {
      return (state as UsersSuccess).users;
    } else {
      return [];
    }
  }

  ///Obtener usuarios de la base de datos local o del API
  void getUsers() async {
    changeState(UsersLoading());
    try {
      final users = await _databaseRepository.getUsers();
      changeState(UsersSuccess(users));
    } catch (e) {
      changeState(UsersError(e.toString()));
    }
  }

  ///Controlador de la bsuqueda de usuarios
  void searchUsers(String name) {
    final state = this.state as UsersSuccess;

    ///Si el nombre es vacío, se muestran todos los usuarios
    if (name.isEmpty) {
      changeState(state.copyWith(usersFiltered: null));
      return;
    }

    ///Se filtran los usuarios por nombre
    final filtered = state.searchUsersByName(name);
    changeState(state.copyWith(usersFiltered: filtered));
  }

  @override
  void dispose() {
    log('UsersController dispose');
    Hive.close();
    super.dispose();
  }
}

final usersControllerProvider =
    StateNotifierProvider.autoDispose<UsersController, UsersState>(
  (ref) => UsersController(
    ref.read(databaseRepositoryProvider),
  ),
);
