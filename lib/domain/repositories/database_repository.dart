import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/user_model.dart';
import '../../data/services/database_services.dart';

class DatabaseRepository {
  final DatabaseServices _databaseServices;

  DatabaseRepository(this._databaseServices);

  Future<List<UserModel>> getUsers() => _databaseServices.getUsers();
}

final databaseRepositoryProvider = Provider<DatabaseRepository>((ref) {
  return DatabaseRepository(ref.read(databaseServicesProvider));
});
