import 'package:infinite_list/features/post/domain/post_entity/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel(
      {required super.id,
      required super.userId,
      required super.body,
      required super.title}
      );
  factory PostModel.fromJson(Map<String,dynamic>js){
   return PostModel(
            id: js['id'], 
            userId: js['userId'], 
            body: js['body'], 
            title: js['title']
          );
  }


}
