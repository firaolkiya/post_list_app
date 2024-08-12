part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();
  
  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}
final class PostLoadingState extends PostState{}
final class PostLoadingErrorState extends PostState{}
final class PostLoadingSuccussState extends PostState{
  final List<PostEntity> listOfPost;

  const PostLoadingSuccussState({required this.listOfPost});
}
