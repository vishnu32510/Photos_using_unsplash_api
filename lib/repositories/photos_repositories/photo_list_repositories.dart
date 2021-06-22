
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/models/models.dart';

Future<PhotoList> view(int page, int length,String url) async {


  // var response = await http.get(url);
  // var data = jsonDecode(response.body);
  // var response = await Dio().get('https://api.unsplash.com/photos/?client_id=4flU2VputqN2M8QwJI5jWaI4KyIYAbYKbsXKatwwy7U',queryParameters: {'page' : page, 'per_page': length});
  // print(baseurl+url+clientid);
  var response = await Dio().get('$baseUrl$url$clientId',queryParameters: {'page' : page, 'per_page': length});
  var data = response.data;
  // print(data);
  // print(data[0]['likes']);
  var re = PhotoList.fromJson(data);
  // print(re.photos.length);
  return re;
}

Future searchView(int page, int length,String url,String search,BuildContext context) async {


  // var response = await http.get(url);
  // var data = jsonDecode(response.body);
  // var response = await Dio().get('https://api.unsplash.com/photos/?client_id=4flU2VputqN2M8QwJI5jWaI4KyIYAbYKbsXKatwwy7U',queryParameters: {'page' : page, 'per_page': length});
  // print(baseurl+url+clientid);
  var response = await Dio().get('$baseUrl$url$clientId',queryParameters: {'page' : page, 'per_page': length, 'query' : search});
  var data = response.data;
  print(data);
  print(data['results']);


  final snackBar = SnackBar(
    content: Text(
      '${data['total']} results found',
      style: TextStyle(
        fontStyle: FontStyle.italic,
      ),
    ),
    action: SnackBarAction(
      label: 'Dismiss',
      onPressed: () {
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);

  var re = PhotoList.fromJson(data['results']);
  print(re.photos.length);
  return re;
}

