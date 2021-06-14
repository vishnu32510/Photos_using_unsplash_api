part of 'photos_bloc.dart';

abstract class PhotosEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PhotoFetched extends PhotosEvent {}
