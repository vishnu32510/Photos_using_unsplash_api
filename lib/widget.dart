
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:unsplash_api/screens/screens.dart';
import 'models/models.dart';



Widget popup(BuildContext context,Photo photo) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: PopupMenuButton(
      icon: Icon(
        Icons.download_outlined,

      ),
      color: Theme.of(context).primaryColor,
      itemBuilder: (context) => [
        popUpItem(context,'Raw', 1,photo),
        popUpItem(context,'Full', 2,photo),
        popUpItem(context,'Regular', 3,photo),
        popUpItem(context,'Small', 4,photo),
        popUpItem(context,'Thumb', 5,photo),
      ],
    ),
  );
}

PopupMenuItem popUpItem(BuildContext context, String title, int val,Photo photo) {
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

onLoading() {
  return Container(
    child: Lottie.asset(
      'assets/walk_loading.json',
      repeat: true,
    ),
  );
}
onLoadingRocket() {
  return Container(
    child: Lottie.asset(
      'assets/rocket_loading.json',
      repeat: true,
    ),
  );
}
onLoadingTwirling() {
  return Container(
    child: Lottie.asset(
      'assets/twirling_loading.json',
      repeat: true,
    ),
  );
}