import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/screenone/bloc_screenone/photos_bloc.dart';
import 'package:unsplash_api/screenone/model.dart';
import 'package:unsplash_api/screenone/view.dart';
import 'package:unsplash_api/screentwo/photodetails.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widget.dart';

class one extends StatefulWidget {
  @override
  _oneState createState() => _oneState();
}

class _oneState extends State<one> {
  Future _list;
  int page = 1;
  int length = 30;
  bool visible = false;
  ScrollController _controller;
  var photourl;
  TextEditingController searchbar = new TextEditingController();
  int searchval = 0;
  List list = [];
  PhotosBloc _photosBloc;

  // List<Photo> val = [];
  // PhotoList photoList;

  @override
  void initState() {
    if (qualityurl == 3) {
      qualityurl = 3;
    }
    if (searchval == 0) {
      _list = view(page, length, photosurl);
    } else {
      _list = searchview(page, length, searchurl, searchbar.text, context);
    }
    _list = view(page, length, photosurl);
    _controller = ScrollController();
    // _controller.addListener(_scrollListener);
    // print(_list);
    super.initState();
    _photosBloc = context.read<PhotosBloc>();
  }

  _tothetop() {
    _controller.animateTo(_controller.position.minScrollExtent,
        duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
  }

  // _scrollListener() {
  //   if (_controller.offset >= _controller.position.maxScrollExtent &&
  //       !_controller.position.outOfRange)
  //   {
  //     print('inside scroll listner');
  //     print(_controller.offset);
  //     print(_controller.position);
  //     print(_controller.position.outOfRange);
  //     print(_controller.position.maxScrollExtent);
  //     print('inside scroll listner');
  //     setState(() {
  //       // message = "reach the bottom";
  //       length= length+10;
  //       if(searchval == 0) {
  //         _list = view(page,length,photosurl);
  //       }else {
  //         _list = searchview(page, length, searchurl, searchbar.text,context);
  //       }
  //       // _list = view(page,length,photosurl);
  //
  //     }
  //     );
  //   }
  //   if (_controller.offset <= _controller.position.minScrollExtent &&
  //       !_controller.position.outOfRange) {
  //     setState(() {
  //       // message = "reach the top";
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            popupImagelook(),
          ],
          leading: PopupMenuButton(
            icon: Icon(Icons.image_search),
            color: appbarcolor,
            offset: Offset(0, 60),
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: Container(
                width: size.width,
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                  controller: searchbar,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      icon: IconButton(
                        onPressed: () {
                          if (searchbar.text != null) {
                            setState(() {
                              searchval = 1;
                              _list = searchview(page, length, searchurl,
                                  searchbar.text, context);
                              // searchbar = null;
                              FocusScope.of(context).requestFocus(FocusNode());
                            });
                            Navigator.pop(context);
                          }
                        },
                        icon: Icon(Icons.search),
                        color: Colors.white,
                      ),
                      labelText: 'Search',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ))
            ],
          ),
          backgroundColor: appbarcolor,
          centerTitle: true,
          title: InkWell(
            onTap: () {
              setState(() {
                searchval = 0;
                page = 1;
                _list = view(page, length, photosurl);
                FocusScope.of(context).requestFocus(FocusNode());
              });
            },
            child: Text('UnSplash'),
          ),
        ),
        // body: FutureBuilder(
        //   future: _list,
        //   builder: (context, snapshot) {
        //     if(snapshot.hasData) {
        //       // print('inside if statement');
        //       // print(snapshot.data);
        //       photoList = snapshot.data;
        //       list = photoList.photos;
        //       // print(photoList.photos[0]);
        //       // print(photoList.photos.length);
        //       // print(snapshot.data);
        //       // print('inside if statement');
        //       // return Container(color: Colors.red,);
        //       return photolist();
        //     }else {
        //       return Container(
        //         child: Center(child: onloading(),),
        //       );
        //     }
        //   },
        //
        // ),
        body: BlocBuilder<PhotosBloc, PhotosState>(
          builder: (context, state) {
            switch (state.status) {
              case PhotosStatus.loading:
                return Container(
                  child: Center(
                    child: onloading(),
                  ),
                );
              case PhotosStatus.success:
                return Container(
                  child: photolist(state.photoList),
                );
              default:
                return Container();
            }
          },
        ),
        floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Visibility(
                visible: visible,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (page >= 2) {
                        length = 10;
                        if (searchval == 0) {
                          _list = view(--page, length, photosurl);
                          // _tothetop();
                        } else {
                          _list = searchview(--page, length, searchurl,
                              searchbar.text, context);
                          // _tothetop();
                        }
                        // _list = view(--page,length,photourl);
                      }
                      if (page == 1) {
                        visible = false;
                      }
                    });
                  },
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.skip_previous,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    // length=10;
                    if (searchval == 0) {
                      _list = view(++page, length, photosurl);
                      _tothetop();
                    } else {
                      _list = searchview(
                          ++page, length, searchurl, searchbar.text, context);
                      _tothetop();
                    }
                    // _list = view(++page,length,photosurl);
                    visible = true;
                    // length=10;
                  });
                },
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.skip_next,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget photolist(PhotoList photoList) {
    return StaggeredGridView.countBuilder(
      controller: _controller,
      crossAxisCount: 2,
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 2 : 1),
      // mainAxisSpacing: 4.0,
      // crossAxisSpacing: 4.0,
      // itemCount: list.length,
      itemCount: photoList.photos.length,
      itemBuilder: (BuildContext context, int index) {
        photourl = photoList.photos[index].url.regular;
        // if (qualityurl == 5) {
        //   print(qualityurl);
        //   photourl = list[index].url.thumbnail;
        // } else if (qualityurl == 4) {
        //   print(qualityurl);
        //   photourl = list[index].url.small;
        // } else {
        //   print(qualityurl);
        //   photourl = list[index].url.regular;
        // }
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
                  MaterialPageRoute(
                      builder: (context) =>
                          photodetails(photoList.photos[index])));
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

  Widget qualitysnackermsg(String msg) {
    return SnackBar(
      content: Text('$msg'),
      action: SnackBarAction(
        label: 'Change',
        onPressed: () {},
      ),
    );
  }
}
