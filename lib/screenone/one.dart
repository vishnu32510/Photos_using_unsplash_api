
import 'package:flutter/material.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/screenone/model.dart';
import 'package:unsplash_api/screenone/view.dart';

import '../widget.dart';

class one extends StatefulWidget {
  @override
  _oneState createState() => _oneState();
}

class _oneState extends State<one> {
  Future _list;
  // List<Photo> val = [];
  PhotoList photoList;
  @override
  void initState() {
    // TODO: implement initState
    _list = view();
    print(_list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Icon(
            Icons.camera_alt_outlined
          ),
          backgroundColor: appbarcolor,
          centerTitle: true,
          title: Text(
            'UnSplash'
          ),
        ),
        body: FutureBuilder(
          future: _list,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              // print('inside if statement');
              // print(snapshot.data);
              photoList = snapshot.data;
              // print(photoList.photos[0]);
              // print(photoList.photos.length);
              // print(snapshot.data);
              // print('inside if statement');
              // return Container(color: Colors.red,);
              return photolist(photoList);
            }else {
              return Container(
                child: Center(child: CircularProgressIndicator(),),
              );
            }
          },

        ),
      ),
    );
  }
}
