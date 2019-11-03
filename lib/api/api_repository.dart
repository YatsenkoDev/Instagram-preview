import 'dart:convert';

import 'package:http/http.dart';
import 'package:insta_preview/api/model/user.dart';

class ApiRepository {
  Future<User> getUser(String token) async {
    String resultPage =
        'https://api.instagram.com/v1/users/self/?access_token=$token';
    Response response = await get(resultPage);
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body)['data']);
    }
    throw Error();
  }

  Future<List<String>> getPhotos(String token) async {
    String resultPage =
        'https://api.instagram.com/v1/users/self/media/recent/?access_token=$token';
    Response response = await get(resultPage);
    if (response.statusCode == 200) {
      List<String> photos = [];
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('List - ${jsonDecode(response.body)['data']}');
      for (Map<String, dynamic> element in data) {
        photos.add(element['images']['thumbnail']['url']);
      }
      print(photos);
      return photos;
    }
    throw Error();
  }
}
