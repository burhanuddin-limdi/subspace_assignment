import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_project/pages/favourites_page.dart';
import 'package:subspace_project/services/bloc/blogs_data_bloc.dart';
import 'package:subspace_project/services/offline_content.dart';
import 'package:subspace_project/widgets/blog_card.dart';

class OfflineBlogs extends StatefulWidget {
  final BuildContext ctx;
  const OfflineBlogs({super.key, required this.ctx});

  @override
  State<OfflineBlogs> createState() => _OfflineBlogsState();
  Future<void> _pullRefresh() async {
    BlocProvider.of<BlogsDataBloc>(ctx).add(FetchDataEvent());
  }
}

class _OfflineBlogsState extends State<OfflineBlogs> {
  final _key = GlobalKey<ScaffoldState>();
  late final List offlineData;
  @override
  void initState() {
    super.initState();
    offlineData = getOfflineData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      const snackBar = SnackBar(content: Text('No Internet Connection'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Drawer(
        backgroundColor: const Color(0xff303030),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(9999))),
                      child: const Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'User 1',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FavouritesPage(),
                    ),
                  );
                },
                child: const Text(
                  'View Favourites',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => widget._pullRefresh(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 75),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: offlineData.length,
                    itemBuilder: (context, index) {
                      return BlogCard(blogData: offlineData[index]);
                    },
                  )
                ],
              ),
            ),
            Positioned(
              child: Container(
                width: double.infinity,
                height: 65,
                color: const Color(0xff303030),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Image(
                        width: 175,
                        image: AssetImage(
                          'assets/images/subspace_logo.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          onPressed: () => _key.currentState?.openEndDrawer(),
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
