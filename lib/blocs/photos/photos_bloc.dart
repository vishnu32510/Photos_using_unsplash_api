import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/models/models.dart';
import 'package:unsplash_api/repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

part 'photos_event.dart';
part 'photos_state.dart';

int addPhotosValue = 10;
int pageCount = 1;
int photoListLength = 10;

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosState(status: PhotosStatus.loading));

  @override
  Stream<Transition<PhotosEvent, PhotosState>> transformEvents(
      Stream<PhotosEvent> events,
      TransitionFunction<PhotosEvent, PhotosState> transitionFn,
      ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<PhotosState> mapEventToState(
    PhotosEvent event,
  ) async* {
    if(event is PhotoFetched){
      yield await _mapPhotoFetchedToState(state);
    }
  }

  Future<PhotosState> _mapPhotoFetchedToState(PhotosState state)async{
    try{
      if (state.status == PhotosStatus.loading) {
        final photos = await view(pageCount, 10, photoListUrl);
        return state.copyWith(status: PhotosStatus.success, photos: photos.photos,page: pageCount);
      }
      if(state.photos.length==30*pageCount){
      return state;}
      photoListLength= photoListLength+addPhotosValue;
      final PhotoList photos = await view(pageCount, photoListLength, photoListUrl);
      print(photos.photos.length);
      List<Photo> addingPhotos = photos.photos.getRange(state.photos.length, state.photos.length+addPhotosValue).toList();
      return state.copyWith(status: PhotosStatus.success,page: pageCount ,photos: List.of(state.photos)..addAll(addingPhotos),hasReachedMax: state.photos.length==30);
    }catch(e){
      print(e);
      return state.copyWith(status: PhotosStatus.failure);
    }
  }
}
