import 'package:ceiba_app/ui/screens/users/users_screen.dart';
import 'package:flutter/material.dart';

import '../data/models/user_model.dart';
import '../ui/screens/details/details_screen.dart';

///Routes es la clase que contiene las rutas y los nombres
///de las rutas de la aplicación
abstract class AppRoutes {
  ///Ruta de la pantalla de lista de usuarios de la aplicación
  static const String users = '/users';

  ///Ruta de la pantalla de detalle de un usuario de la aplicación
  static const String details = '/details';

  ///Paginas de la aplicación
  static Map<String, Widget Function(BuildContext)> routes = {
    users: (context) => const UsersScreen(),
    details: (context) {
      final user = ModalRoute.of(context)!.settings.arguments as UserModel;

      return DetailsScreen(user: user);
    },
  };
}
