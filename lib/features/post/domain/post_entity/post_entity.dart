import 'package:equatable/equatable.dart';

class PostEntity extends Equatable{
    final int id;
    final int userId;
    final String body;
    final String title;

  const PostEntity({required this.id, required this.userId, required this.body, required this.title});
  
  @override
  List<Object?> get props => [id,userId,title,body];
}