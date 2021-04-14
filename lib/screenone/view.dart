
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart' as convert;
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/screenone/model.dart';

Future view(int page, int length) async {


  // var response = await http.get(url);
  // var data = jsonDecode(response.body);
  var response = await Dio().get(url,queryParameters: {'page' : page, 'per_page': length});
  var data = response.data;
  print(data);
  print(data[0]['likes']);
  var re = PhotoList.fromjson(data);
  print(re.photos.length);
  return re;
}