part of '../users_screen.dart';

///[Search] es el widget que contiene el campo de búsqueda de usuarios
class _Search extends StatefulWidget {
  const _Search({super.key});

  @override
  State<_Search> createState() => _SearchState();
}

class _SearchState extends State<_Search> {
  ///Controlador del campo de texto
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Consumer(
              builder: (context, ref, _) {
                return TextField(
                  controller: _controller,
                  onChanged:
                      ref.read(usersControllerProvider.notifier).searchUsers,
                  decoration: const InputDecoration(
                    labelText: 'Buscar usuario',
                    prefixIcon: Icon(Icons.search),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
