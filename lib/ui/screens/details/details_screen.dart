import 'package:ceiba_app/data/models/post_model.dart';
import 'package:ceiba_app/data/models/user_model.dart';
import 'package:ceiba_app/ui/screens/details/details_controller.dart';
import 'package:ceiba_app/ui/widgets/icon_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Appbar de la pantalla de detalles
part 'widgets/app_bar.dart';

///Widget que contiene la información del usuario
part 'widgets/user_info.dart';

///Widget que contiene los posts del usuario
part 'widgets/user_posts.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          ///AppBar de la pantalla de detalles
          _SliverAppBar(user: user),

          ///Información del usuario
          _UserInfo(user: user),
        ],
        body: _UserPosts(user: user),
      ),
    );
  }
}
