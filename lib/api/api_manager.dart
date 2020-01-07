import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:insta_preview/api/insta_keys.dart';
import 'package:insta_preview/api/model/user.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  final _mediaUrl =
      'https://graph.instagram.com/me/media?fields=thumbnail_url,media_url&limit=1000&access_token=';
  final _longLivedTokenUrl =
      'https://graph.instagram.com/access_token?grant_type=ig_exchange_token&client_secret=${InstaKeys.appSecret}&access_token=';
  final _refreshTokenUrl =
      'https://graph.instagram.com/refresh_access_token?grant_type=ig_refresh_token&access_token=';
  final _userUrl =
      'https://graph.instagram.com/me?fields=id,username&access_token=';

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

  Future<String> _getLongLivedToken(String token) =>
      _requestToken(_longLivedTokenUrl + token);

  Future<String> _refreshToken(String token) =>
      _requestToken(_refreshTokenUrl + token);

  Future<String> _requestToken(String url) async {
    final response = await http.get(url);
    return response.statusCode == 200 ? _decodeToken(response) : '';
  }

  String _decodeToken(http.Response response) =>
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

  Future<User> getUser(String token) async {
    final response = await http.get(_userUrl + token);
    return response.statusCode == 200
        ? User.fromJson(jsonDecode(response.body))
        : '';
  }

  Future<List<String>> getPhotos(String token) async {
    List<String> photos = [];
    final response = await http.get(_mediaUrl + token);
    if (response.statusCode == 200) {
      photos = await compute(_parseMedia, response.body);
    }
    return photos;
  }
}

List<String> _parseMedia(String json) {
  List<String> photos = [];
  List<dynamic> data = jsonDecode(json)['data'];
  for (Map<String, dynamic> element in data) {
    photos.add(element['thumbnail_url'] ?? element['media_url']);
  }
  return photos;
}
