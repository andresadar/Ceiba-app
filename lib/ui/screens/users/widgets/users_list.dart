part of '../users_screen.dart';

class _UsersList extends ConsumerWidget {
  const _UsersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///Obtener la lista de usuarios del estado
    final state = (ref.watch(usersControllerProvider) as UsersSuccess);

    final users = state.usersFiltered ?? state.users;

    ///Si la lista de usuarios filtrados es vacía, se muestra un mensaje
    if (users.isEmpty) {
      return const Center(child: Text('List is empty'));
    }

    ///Se muestra la lista de usuarios
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return _ItemUser(user: users[index]);
      },
    );
  }
}

///Item de la lista de usuarios
class _ItemUser extends StatelessWidget {
  const _ItemUser({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.account_circle),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text('${user.name}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconText(icon: Icons.email, text: '${user.email}'),
          IconText(icon: Icons.phone, text: '${user.phone}'),
        ],
      ),
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.details,
        arguments: user,
      ),
    );
  }
}
