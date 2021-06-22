import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/models/models.dart';
import 'package:unsplash_api/repositories/repositories.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosState(status: PhotosStatus.loading));

  @override
  Stream<PhotosState> mapEventToState(
    PhotosEvent event,
  ) async* {
    if(event is PhotoFetched){
      yield await _mapPhotoFetchedToState(state);
    }
  }

  Future<PhotosState> _mapPhotoFetchedToState(PhotosState state)async{
    if(state.status==PhotosStatus.loading){
      final photos = await view(1, 20, photoListUrl);
      // print(photos);
      // print(photos.photos.length);
      return state.copyWith(
        status: PhotosStatus.success,
        photoList: photos
      );
    }else{return state;}
  }
}
