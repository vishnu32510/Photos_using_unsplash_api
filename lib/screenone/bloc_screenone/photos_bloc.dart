import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unsplash_api/constants.dart';
import 'package:unsplash_api/screenone/model.dart';
import 'package:unsplash_api/screenone/view.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosState(status: PhotosStatus.loading));

  // @override
  // Stream<Transition<PhotosEvent, PhotosState>> transformEvents(
  //     Stream<PhotosEvent> events,
  //     TransitionFunction<PhotosEvent, PhotosState> transitionFn,
  //     ) {
  //   return super.transformEvents(
  //     events.debounce(const Duration(milliseconds: 500)),
  //     transitionFn,
  //   );
  // }

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
      final photos = await view(1, 20, photosurl);
      print(photos);
      print(photos.photos.length);
      return state.copyWith(
        status: PhotosStatus.success,
        photoList: photos
      );
    }
  }
}
