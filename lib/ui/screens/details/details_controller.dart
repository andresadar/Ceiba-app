import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/post_model.dart';
import '../../../domain/repositories/details_repository.dart';

///Controlador de los detalles del usuario
class DetailsController {
  ///[DetailsRepository] es la clase que contiene los repositorios de la aplicación
  final DetailsRepository _detailsRepository;

  DetailsController(this._detailsRepository);

  ///Obtener post
  Future<List<PostModel>> getPosts(int? userId) =>
      _detailsRepository.getPosts(userId);
}

final detailsControllerProvider =
    Provider.autoDispose<DetailsController>((ref) {
  return DetailsController(ref.read(detailsRepositoryProvider));
});
