import '../../../data/models/user_model.dart';

abstract class UsersState {}

///Estado inicial
class UsersInitial extends UsersState {}

///Estado de carga
class UsersLoading extends UsersState {}

///Estado de error
class UsersError extends UsersState {
  final String message;

  UsersError(this.message);
}

///Estado de éxito
class UsersSuccess extends UsersState {
  final List<UserModel> users;
  final List<UserModel>? usersFiltered;

  UsersSuccess(this.users, {this.usersFiltered});

  ///Buscar usuarios por nombre
  List<UserModel> searchUsersByName(String name) {
    return users
        .where((user) => user.name!.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }

  ///Copiar estado
  UsersSuccess copyWith({
    List<UserModel>? users,
    List<UserModel>? usersFiltered,
  }) {
    return UsersSuccess(users ?? this.users, usersFiltered: usersFiltered);
  }
}
