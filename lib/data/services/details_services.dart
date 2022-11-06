import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/resource.dart';
import '../models/post_model.dart';

///[DetailsServices] es la clase que contiene los servicios de la aplicación
///comunicándose con la API de la aplicación para obtener los post del usuario
class DetailsServices {
  ///[_dio] es el cliente de la API de la aplicación
  final _dio = Dio(
      BaseOptions(baseUrl: Resource.apiURL, contentType: 'application/json'));

  ///[getPosts] es el método que obtiene los post del usuario del API de la aplicación
  Future<List<PostModel>> getPosts(int? userId) async {
    final response = await _dio.get('/posts?userid=$userId');

    if (response.statusCode == 200) {
      final postsData = response.data as List;

      final posts = postsData.map((post) => PostModel.fromJson(post)).toList();

      return posts;
    } else {
      throw Exception('Error al obtener los post');
    }
  }
}

final detailsServicesProvider =
    Provider.autoDispose((ref) => DetailsServices());
