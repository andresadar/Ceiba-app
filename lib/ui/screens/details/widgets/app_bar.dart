part of '../details_screen.dart';

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('${user.name}'),
    );
  }
}
