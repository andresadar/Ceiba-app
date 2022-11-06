import 'package:ceiba_app/app/routes.dart';
import 'package:ceiba_app/ui/screens/users/users_controller.dart';
import 'package:ceiba_app/ui/screens/users/users_state.dart';
import 'package:ceiba_app/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/user_model.dart';
import '../../widgets/error.dart';
import '../../widgets/icon_text.dart';

///Widget que contiene el appBar de la pantalla de usuarios
part 'widgets/app_bar.dart';

///Widget que contiene el campo de búsqueda de usuarios
part 'widgets/search.dart';

///Widget qye contiene la lista de usuarios
part 'widgets/users_list.dart';

///[UsersScreen] es la pantalla de usuarios
class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///Listener para escuchar los cambios de estado de la pantalla de usuarios
    ///y desplegar un mensaje de error en caso de que ocurra un error
    ref.listen(usersControllerProvider, (next, previous) {
      ///Si el estado es [UsersError] se muestra un mensaje de error
      if (next is UsersError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(next.message)));
      }
    });

    return Consumer(
      builder: (context, ref, _) {
        ///Se obtiene el estado de la pantalla de usuarios
        final state = ref.watch(usersControllerProvider);

        ///Carga de la pantalla de usuarios
        if (state is UsersLoading || state is UsersInitial) {
          return const LoadingView();
        }

        ///Error al cargar la pantalla de usuarios
        if (state is UsersError) {
          return ErrorView(message: state.message);
        }

        ///Se obtienen los usuarios de la pantalla de usuarios
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => const [
              ///AppBar de la pantalla de usuarios
              _SliverAppBar(),

              ///Se muestra el campo de búsqueda de usuarios
              _Search()
            ],
            body: const _UsersList(),
          ),
        );
      },
    );
  }
}
