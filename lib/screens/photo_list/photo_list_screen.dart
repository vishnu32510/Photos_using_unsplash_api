import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unsplash_api/blocs/photos/photos_bloc.dart';
import 'package:unsplash_api/models/models.dart';
import 'package:unsplash_api/screens/screens.dart';
import 'package:unsplash_api/widget.dart';

class PhotosListScreen extends StatefulWidget {
  static const String routeName = '/photosList';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) =>
            PhotosListScreen()
    );
  }

  @override
  _PhotosListScreenState createState() => _PhotosListScreenState();
}

class _PhotosListScreenState extends State<PhotosListScreen> {

  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    context.read<PhotosBloc>()..add(PhotoFetched());
    _controller = new ScrollController();
    _controller.addListener(_scrollListener);
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print('Scroll listener');
      // context.read<PhotosBloc>()..add(PhotoFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme
              .of(context)
              .primaryColor,
          centerTitle: true,
          title: Text('UnSplash'),
        ),
        body: BlocBuilder<PhotosBloc, PhotosState>(
          builder: (context, state) {
            switch (state.status) {
              case PhotosStatus.loading:
                return Container(
                  child: Center(
                    child: onLoading(),
                  ),
                );
              case PhotosStatus.success:
                return Container(
                  child: photoList(context,state.photoList),
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  Widget photoList(BuildContext context,PhotoList photoList) {
    return StaggeredGridView.countBuilder(
      controller: _controller,
      crossAxisCount: 2,
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(1, index.isEven ? 2 : 1),
      itemCount: photoList.photos.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .backgroundColor,
          ),
          child: InkWell(
            onTap: () {
              HapticFeedback.mediumImpact();
              Navigator.of(context).pushNamed(
                PhotoDetailsScreen.routeName,
                arguments: photoList.photos[index],
              );
            },
            child: Hero(
              tag: photoList.photos[index].url.raw.toString(),
              child: Image.network(
                '${photoList.photos[index].url.regular}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
