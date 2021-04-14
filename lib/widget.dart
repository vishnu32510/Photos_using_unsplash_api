
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter/cupertino.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/screenone/model.dart';
import 'package:unsplash_api/screentwo/photodetails.dart';

import 'screenone/one.dart';


Widget popup(Photo photo) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: PopupMenuButton(
      icon: Icon(
        Icons.download_outlined,

      ),
      color: appbarcolor,
      itemBuilder: (context) => [
        popupitem(context,'Raw', 1,photo),
        popupitem(context,'Full', 2,photo),
        popupitem(context,'Regular', 3,photo),
        popupitem(context,'Small', 4,photo),
        popupitem(context,'Thumb', 5,photo),
      ],
    ),
  );
}

PopupMenuItem popupitem(BuildContext context, String title, int val,Photo photo) {
  return PopupMenuItem(
    value: val,
    child: GestureDetector(

      onTap: () {
        if(val==1) {
          download(context,photo.url.raw);
        }else if(val==2) {
          download(context,photo.url.full);
        }else if(val==3) {
          download(context,photo.url.regular);
        }else if(val==4) {
          download(context,photo.url.small);
        }else {
          download(context,photo.url.thumbnail);
        }
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


Widget popupImagelook() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: PopupMenuButton(
      offset:Offset(0,50),
      icon: Icon(
        Icons.high_quality,
        size: 30,
      ),
      color: appbarcolor,
      itemBuilder: (context) => [
        // popupitemImagelook(context,'Raw', 1),
        // popupitemImagelook(context,'Full', 2),
        popupitemImagelook(context,'Regular', 3),
        popupitemImagelook(context,'Small', 4),
        popupitemImagelook(context,'Thumb', 5),
      ],
    ),
  );
}

PopupMenuItem popupitemImagelook(BuildContext context, String title, int val) {
  return PopupMenuItem(
    value: val,
    child: GestureDetector(
      onTap: () {
        qualityurl = val;
        Navigator.pushAndRemoveUntil(
            context,
            // newRouteName,
            MaterialPageRoute(builder: (context) => one(),),
                (route) => false,
        );
        // Navigator.pop(context);
        print('inside gesture detector');
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