
import 'dart:convert';

import 'package:infinite_list/features/post/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:infinite_list/features/post/data/model/post_model.dart';
import 'package:infinite_list/features/post/domain/repository/post_repository.dart';

class PostRepositoryImpl extends PostRepository{
  final RemoteDataSourceImpl remoteDataSourceImpl;

  PostRepositoryImpl({required this.remoteDataSourceImpl});

  @override
  Future<List<PostModel>> getPosts() async{
    try{
      final result = json.decode(await remoteDataSourceImpl.getPosts()) as List;
    List<PostModel> postModels = [];
    for(Map<String,dynamic> js in result){
        postModels.add(PostModel.fromJson(js));
    }
    return postModels;
    }
    catch(e){
      
      throw Exception();}
  }

}