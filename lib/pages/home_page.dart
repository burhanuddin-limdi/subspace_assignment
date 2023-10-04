import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_project/services/bloc/blogs_data_bloc.dart';
import 'package:subspace_project/services/offline_content.dart';
import 'package:subspace_project/widgets/offline_blogs.dart';
import 'package:subspace_project/widgets/online_blogs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BlogsDataBloc>(context).add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlogsDataBloc, BlogsDataState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
        if (state is LoadedState) {
          setOfflineData(state.data);
          return OnlineBlogs(
            ctx: context,
            blogsData: state.data,
          );
        }
        if (state is OfflineState) {
          return OfflineBlogs(
            ctx: context,
          );
        }
        return const Scaffold(
          body: Center(
              child: Center(
            child: Text(
              'Unknown Error Occured',
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          )),
        );
      },
    );
  }
}
