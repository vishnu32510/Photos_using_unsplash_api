// import 'dart:js';

import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/screenone/model.dart';
import 'package:image_downloader/image_downloader.dart';

import '../widget.dart';


class photodetails extends StatelessWidget {
  Photo photo;



  photodetails(this.photo);
  int page=1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          popup(photo),
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
              height: size.height,
              width: size.width,
              child: AspectRatio(
                aspectRatio: 1,
                child: PhotoView(
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 2,
                  imageProvider: NetworkImage(
                      photo.url.regular,
                  ),
                ),
              ),
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

}

void download(BuildContext context, String photourl) async {
  try {
    var imageId;
    imageId = await ImageDownloader.downloadImage(photourl);
    print('inside');
    if (imageId == null) {
      final snackBar = SnackBar(
        backgroundColor: appbarcolor,
        content: Text('Something went wrong'),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }else {
      final snackBar = SnackBar(
        content: Text('Image Downloaded'),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    var path = await ImageDownloader.findPath(imageId);
  } on PlatformException catch (error) {
    print(error);
  }
}