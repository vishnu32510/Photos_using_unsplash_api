// import 'dart:js';

import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/screenone/model.dart';
import 'package:image_downloader/image_downloader.dart';


class photodetails extends StatelessWidget {
  Photo photo;

  void download(String photo) async {
    try {
      var imageId = await ImageDownloader.downloadImage(photo);
      // print(photo);
      // Fluttertoast.showToast(
      //     msg: "Image downloaded",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );
      print('inside');
      if (imageId == null) {
        return;
      }else {
        // Fluttertoast.showToast(
        //     msg: "Image downloaded",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0
        // );
      }
      var path = await ImageDownloader.findPath(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }

  photodetails(this.photo);
  int page=1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          popup(),
          // IconButton(
          //   icon: Icon(Icons.download_outlined),
          //     onPressed: () {
          //     // download();
          //     }
          // )
        ],
        backgroundColor: appbarcolor,
        title: Text(
          'Photo details'
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
                child: Image.network(photo.url.regular)
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(500)
                // ),
                child: ListTile(
                  tileColor: appbarcolor,
                  subtitle: Text(
                    '${photo.alt_description}',
                    style: TextStyle(
                        color: Colors.white.withAlpha(70),
                    ),
                  ),
                  leading: Icon(
                    Icons.photo,
                    color: Colors.white30,
                    size: 45,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Text(
                      '${photo.user.username}',
                      style: TextStyle(
                          color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  trailing: Text(
                    '❤️  ${photo.likes}  ',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget popup() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: PopupMenuButton(
        icon: Icon(
          Icons.download_outlined,

        ),
        color: appbarcolor,
        // child: Center(
        //     child: Icon(
        //       Icons.download_outlined,
        //     ),
        // ),
        itemBuilder: (context) => [
          popupitem(context,'Raw', 1),
          popupitem(context,'Full', 2),
          popupitem(context,'Regular', 3),
          popupitem(context,'Small', 4),
          popupitem(context,'Thumb', 5),
          // popupitem('Raw', 1),
          // popupitem('Raw', 1),
        ],
        // itemBuilder: (context) {
        //   return List.generate(1, (index) {
        //     return PopupMenuItem(
        //       child: Text('button no $index'),
        //     );
        //   });
        // },
      ),
    );
  }

  PopupMenuItem popupitem(BuildContext context, String title, int val) {
    return PopupMenuItem(
      value: val,
      child: GestureDetector(
        onTap: () {
          if(val==1) {
            download(photo.url.raw);
          }else if(val==2) {
            download(photo.url.full);
          }else if(val==3) {
            download(photo.url.regular);
          }else if(val==4) {
            download(photo.url.small);
          }else {
            download(photo.url.thumbnail);
          }
          Fluttertoast.showToast(
              msg: "Image downloaded",
              // toastLength: Toast.LENGTH_SHORT,
              // gravity: ToastGravity.CENTER,
              // timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
          // FocusScope.of(context).requestFocus();
          Navigator.pop(context);
        },
        child: Text(
          '$title',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
