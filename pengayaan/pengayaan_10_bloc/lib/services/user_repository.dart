

import 'dart:convert';

import 'package:http/http.dart';
import 'package:pengayaan_10_bloc/model/user_mode.dart';

class UserRepository {
  String useUrl = 'https://reqres.in/api/users/?page=2';
  Future<List<UserModel>> getUsers() async{
    Response response = await get(Uri.parse(useUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}