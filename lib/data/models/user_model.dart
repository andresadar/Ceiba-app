import 'package:hive/hive.dart';

///Código autogenerado por [HiveGenerator]
part 'user_model.g.dart';

///[UserModel] es la clase que contiene el modelo de usuario de la aplicación
@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? username;

  @HiveField(3)
  String? email;

  @HiveField(4)
  String? phone;

  @HiveField(5)
  String? website;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.website});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['website'] = website;
    return data;
  }
}
