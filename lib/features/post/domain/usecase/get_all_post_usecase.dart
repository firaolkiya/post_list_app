
import 'package:infinite_list/features/post/domain/post_entity/post_entity.dart';
import 'package:infinite_list/features/post/domain/repository/post_repository.dart';

class GetAllPostUsecase {
  final PostRepository postRepository;

  GetAllPostUsecase({required this.postRepository});
    Future<List<PostEntity>>call(){
      return postRepository.getPosts();
    }
}