import 'package:bloc/bloc.dart';
import 'package:bloc_secion/features/Auth/model/base_model.dart';
import 'package:bloc_secion/features/post/model/post_model.dart';
import 'package:bloc_secion/features/post/service/post_service.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<GetPost>((event, emit) async {
      emit(Loading());
      BaseModel temp = await PostService(dio: Dio()).getPoset();

      if (temp is PostModel) {
        emit(GetPostSuccessfuly(post: temp));
      }
      if (temp is FilerModel) {
        emit(FilerWithGetPost(error: temp));
      }
    });
  }
}
