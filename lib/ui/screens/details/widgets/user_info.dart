part of '../details_screen.dart';

class _UserInfo extends StatelessWidget {
  const _UserInfo({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Información del usuario: ',
                    style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 10),

                ///Email y teléfono
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    child: IconText(icon: Icons.email, text: '${user.email}'),
                  ),
                  Expanded(
                      child: IconText(icon: Icons.phone, text: '${user.phone}'))
                ]),
                const SizedBox(height: 10),

                ///Username y website
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    child: IconText(
                        icon: Icons.insert_emoticon_outlined,
                        text: '${user.username}'),
                  ),
                  Expanded(
                      child:
                          IconText(icon: Icons.wifi, text: '${user.website}'))
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
