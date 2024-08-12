import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/features/post/presentation/bloc/bloc/post_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    //context.read<PostBloc>().add(FetchData());
    super.initState();
  }
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Posts'),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is PostLoadingErrorState){
            return const Center(
              child: Text('something went wrong'),
            );
          }
          if(state is PostLoadingState || state is PostInitial){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: (state as PostLoadingSuccussState).listOfPost.length,
              itemBuilder: (context, index) => 
              Container(
                margin:const  EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [BoxShadow(
                    blurRadius: 2,
                    color: Colors.black12,
                    spreadRadius: 5
                  )]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text((state).listOfPost[index].title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                    const SizedBox(height: 10,),
                    Text((state).listOfPost[index].body),
                  ],
                ),
              )
              
            ),
          );
        },
      ),
    );
  }
}
