
import 'package:infinite_list/features/post/domain/post_entity/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>>getPosts();
}