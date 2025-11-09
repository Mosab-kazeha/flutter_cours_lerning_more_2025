part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class Loading extends PostState {}

final class GetPostSuccessfuly extends PostState {
  PostModel post;
  GetPostSuccessfuly({required this.post});
}

final class FilerWithGetPost extends PostState {
  FilerModel error;
  FilerWithGetPost({required this.error});
}
