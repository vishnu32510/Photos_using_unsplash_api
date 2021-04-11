

import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/screenone/model.dart';

class photodetails extends StatelessWidget {
  Photo photo;
  photodetails(this.photo);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
}
