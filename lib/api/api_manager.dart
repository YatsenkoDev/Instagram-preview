import 'dart:convert';

import 'package:http/http.dart';
import 'package:insta_preview/api/insta_keys.dart';
import 'package:insta_preview/api/model/user.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  final _longLivedTokenUrl =
      'https://graph.instagram.com/access_token?grant_type=ig_exchange_token&client_secret=${InstaKeys.appSecret}&access_token=';
  final _refreshTokenUrl =
      'https://graph.instagram.com/refresh_access_token?grant_type=ig_refresh_token&access_token=';

  Future<String> requestToken(String code) async {
    final response =
        await http.post('https://api.instagram.com/oauth/access_token', body: {
      'app_id': InstaKeys.appId,
      'app_secret': InstaKeys.appSecret,
      'grant_type': 'authorization_code',
      'redirect_uri': InstaKeys.redirectUrl,
      'code': code,
    });
    return response.statusCode == 200
        ? _getLongLivedToken(_decodeToken(response))
        : '';
  }

  Future<String> _getLongLivedToken(String token) async {
    final response = await http.get(_longLivedTokenUrl + token);
    return response.statusCode == 200 ? _decodeToken(response) : '';
  }

  Future<void> _refreshToken(String token) async {
    final response = await http.get(_refreshTokenUrl + token);
    if (response.statusCode == 200) {
      return _decodeToken(response);
    }
  }

  String _decodeToken(Response response) =>
      jsonDecode(response.body)['access_token'];

//  Future<User> getUser(String token) async {
//    String resultPage =
//        'https://api.instagram.com/v1/users/self/?access_token=$token';
//    Response response = await get(resultPage);
//    if (response.statusCode == 200) {
//      return User.fromJson(jsonDecode(response.body)['data']);
//    }
//    throw Error();
//  }
//
//  Future<List<String>> getPhotos(String token) async {
//    String resultPage =
//        'https://api.instagram.com/v1/users/self/media/recent/?access_token=$token';
//    Response response = await get(resultPage);
//    if (response.statusCode == 200) {
//      List<String> photos = [];
//      List<dynamic> data = jsonDecode(response.body)['data'];
//      print('List - ${jsonDecode(response.body)['data']}');
//      for (Map<String, dynamic> element in data) {
//        photos.add(element['images']['thumbnail']['url']);
//      }
//      print(photos);
//      return photos;
//    }
//    throw Error();
//  }
}
