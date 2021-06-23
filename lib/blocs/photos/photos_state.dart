part of 'photos_bloc.dart';

enum PhotosStatus{loading,success,failure}

class PhotosState extends Equatable {

  final PhotosStatus status;
  final List<Photo> photos;
  final bool hasReachedMax;
  final int page;

  const PhotosState({this.status, this.photos,this.hasReachedMax=false,this.page});

  PhotosState copyWith({
    PhotosStatus status,
    List<Photo> photos,
    bool hasReachedMax=false,
    int page,
  }) {
    return new PhotosState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      hasReachedMax: hasReachedMax?? this.hasReachedMax,
      page: page??this.page
    );
  }

  @override
  String toString() {
    return super.toString();
  }

  @override
  List<Object> get props => [status,photos,hasReachedMax,page];
}

