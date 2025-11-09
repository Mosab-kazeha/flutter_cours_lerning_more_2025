import 'package:bloc_secion/features/post/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc()..add(GetPost()),
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Builder(
          builder: (context) {
            return BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                if (state is GetPostSuccessfuly) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                state.post.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 35),
                              ),
                              Text(
                                state.post.body,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (state is FilerWithGetPost) {
                  return Center(child: Text("error with service"));
                } else if (state is Loading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(child: Icon(Icons.no_accounts_sharp));
                }
              },
            );
          },
        ),
      ),
    );
  }
}
