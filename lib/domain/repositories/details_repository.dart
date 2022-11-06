import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/post_model.dart';
import '../../data/services/details_services.dart';

///[DetailsRepository] es el repositorio de la pantalla de usuarios
class DetailsRepository {
  ///[DetailsService] es el servicio de la pantalla de usuarios
  final DetailsServices _detailsServices;

  DetailsRepository(this._detailsServices);

  Future<List<PostModel>> getPosts(int? userId) =>
      _detailsServices.getPosts(userId);
}

final detailsRepositoryProvider =
    Provider.autoDispose<DetailsRepository>((ref) {
  return DetailsRepository(ref.read(detailsServicesProvider));
});
