
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter/cupertino.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/screenone/model.dart';
import 'package:unsplash_api/screentwo/photodetails.dart';

// Widget photolist(PhotoList photoList) {
//   return ListView.builder(
//       itemCount: photoList.photos.length,
//       itemBuilder: (BuildContext context, int index) {
//         var photourl = photoList.photos[index].url.regular;
//         // print('inside listview');
//         // print(photourl);
//         return Container(
//           child: Image.network('$photourl'),
//           // child: Text(
//           //   '$photourl'
//           // ),
//         );
//       }
//   );
// }
//
// staggeredTileBuilder: (int index) =>
// new StaggeredTile.count(2, index.isEven ? 2 : 1),
// mainAxisSpacing: 4.0,
// crossAxisSpacing: 4.0,

Widget photolist(PhotoList photoList) {
  return StaggeredGridView.countBuilder(
    crossAxisCount: 2,
    staggeredTileBuilder: (int index) =>
    new StaggeredTile.count(1, index.isEven ? 2 : 1),
    // mainAxisSpacing: 4.0,
    // crossAxisSpacing: 4.0,
      itemCount: photoList.photos.length,
      itemBuilder: (BuildContext context, int index) {
        var photourl = photoList.photos[index].url.regular;
        // print('inside listview');
        // print(photourl);
        return Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: backgroundcolor,
            // borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => photodetails(photoList.photos[index]))
              );
            },
            child: Image.network(
                '$photourl',
              fit: BoxFit.cover,
            ),
          ),
          // child: Text(
          //   '$photourl'
          // ),
        );
      },
  );
}