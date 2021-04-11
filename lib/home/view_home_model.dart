import 'package:http/http.dart' as http;
// import 'package:convert/convert.dart' as convert;
import 'dart:convert';
import '../constants.dart';
import 'home_model.dart';

Future<HomeModel> getphoto() async {
  var response = await http.get(url1);
  print(response.statusCode);
  if(response.statusCode==200) {
    var data = json.decode(response.body);
    print(data);
    print(data['likes']);
    print(data['urls']['small']);
    var home = HomeModel.fromJson(data);
    // var home = Home.fromJson(data);
    print(home);
    return home;
  }else {
    print('no data');
    return null;
  }
}