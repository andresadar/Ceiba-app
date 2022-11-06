import 'package:flutter_riverpod/flutter_riverpod.dart';

///[DatabaseServices] es la clase que contiene los servicios de la aplicación
///comunicándose con la base de datos local de la aplicación
class DatabaseServices {
  ///[DatabaseServices] es el constructor de la clase
  DatabaseServices();

  ///[resetUsers] es el método que reinicia los usuarios de la base de datos local

  ///[saveUsers] es el método que agrega un usuario a la base de datos local

  ///[getUsers] es el método que obtiene los usuarios de la base de datos local
  // Future<List<UserModel>> getUsers() async {
  //   final db = await database;
  //   final users = await db.query('users');
  //   return users.map<UserModel>((user) => UserModel.fromJson(user)).toList();
  // }

  ///[getUser] es el método que obtiene un usuario de la base de datos local

}

final databaseServicesProvider =
    Provider.autoDispose((ref) => DatabaseServices());
