
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:convert/convert.dart' as convert;
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/screenone/model.dart';

Future view() async {
  var response = await http.get(url);
  var data = jsonDecode(response.body);
  print(data);
  print(data[0]['likes']);
  var re = PhotoList.fromjson(data);
  return re;
}