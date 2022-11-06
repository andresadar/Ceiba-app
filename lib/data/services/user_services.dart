import 'package:ceiba_app/app/resource.dart';
import 'package:ceiba_app/data/models/user_model.dart';
import 'package:ceiba_app/data/services/database_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///[UserServices] es la clase que contiene los servicios de la aplicación
///comunicándose con la API de la aplicación
///Comunicandose con la base de datos local de la aplicación
class UserService {
  ///[UserService] es el constructor de la clase
  UserService(this._databaseServices);

  ///[DatabaseServices] es el servicio de la base de datos local de la aplicación
  final DatabaseServices _databaseServices;

  ///[_dio] es el cliente de la API de la aplicación
  final _dio = Dio(
      BaseOptions(baseUrl: Resource.apiURL, contentType: 'application/json'));

  ///[getUsers] es el método que obtiene los usuarios del API de la aplicación
  Future<List<UserModel>> getUsers() async {
    final response = await _dio.get('/users');

    if (response.statusCode == 200) {
      final usersData = response.data as List;

      final users = usersData.map((user) => UserModel.fromJson(user)).toList();

      await Future.wait(
          [_databaseServices.resetUsers(), _databaseServices.saveUsers(users)]);

      return users;
    } else {
      throw Exception('Error al obtener los usuarios');
    }
  }

  ///[getUser] es el método que obtiene un usuario del API de la aplicación
  Future<UserModel> getUser(int id) async {
    final response = await _dio.get('/users/$id');

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception('Error al obtener el usuario');
    }
  }
}

final userServicesProvider = Provider.autoDispose(
    (ref) => UserService(ref.read(databaseServicesProvider)));
