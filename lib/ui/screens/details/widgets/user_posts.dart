part of '../details_screen.dart';

class _UserPosts extends ConsumerStatefulWidget {
  const _UserPosts({super.key, required this.user});

  final UserModel user;

  @override
  ConsumerState<_UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends ConsumerState<_UserPosts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ref.read(detailsControllerProvider).getPosts(widget.user.id),
      builder: ((context, snapshot) {
        ///Cargando datos
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        ///Error al cargar los datos
        if (snapshot.hasError || snapshot.data == null) {
          return const ErrorView(message: 'Revisa tu conexión');
        }

        final posts = snapshot.data as List<PostModel>;

        ///Datos cargados
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: ((context, index) => _ItemPost(post: posts[index])),
        );
      }),
    );
  }
}

class _ItemPost extends StatelessWidget {
  const _ItemPost({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.article),
      title: Text('${post.title}'),
      subtitle: Text('${post.body}'),
    );
  }
}
