import 'package:http/http.dart' as http;
import 'package:infinite_list/core/constant/remote_data_info.dart';


abstract class RemoteDataSource {
  Future<String>getPosts();
}

class RemoteDataSourceImpl extends RemoteDataSource{
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<String> getPosts() async {
    try{
      final response = await client.get(Uri.parse(RemoteDataInfo.baseUrl));
      return response.body;
    }
    catch(e){
      throw Exception();
    }
  }
  
}