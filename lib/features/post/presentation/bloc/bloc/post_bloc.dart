import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_list/features/post/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_list/features/post/data/repository/post_repository_impl.dart';
import 'package:infinite_list/features/post/domain/post_entity/post_entity.dart';
import 'package:infinite_list/features/post/domain/usecase/get_all_post_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetAllPostUsecase getAllPostUsecase = GetAllPostUsecase(postRepository: PostRepositoryImpl(remoteDataSourceImpl: RemoteDataSourceImpl(client: http.Client())));
  PostBloc() : super(PostInitial()) {
    on<FetchData>((event, emit) async{
      print('calling..................');
      try {
      emit(PostLoadingState());
       final List<PostEntity>? result =await getAllPostUsecase.call();
       if(result!=null){
         emit(PostLoadingSuccussState(listOfPost: result));
       }
       else{
        emit(PostLoadingErrorState());
       }
      } catch (e) {
        emit(PostLoadingErrorState());
      }
    });
    Future.microtask(() => add(FetchData()));
    
  }
  
}
