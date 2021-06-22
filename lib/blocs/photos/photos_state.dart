part of 'photos_bloc.dart';

enum PhotosStatus{loading,success,failure}

class PhotosState extends Equatable {

  final PhotosStatus status;
  final PhotoList photoList;

  const PhotosState({this.status, this.photoList});

  PhotosState copyWith({
    PhotosStatus status,
    PhotoList photoList,
  }) {
    return new PhotosState(
      status: status ?? this.status,
      photoList: photoList ?? this.photoList,
    );
  }

  @override
  String toString() {
    return super.toString();
  }

  @override
  List<Object> get props => [status,photoList];
}

