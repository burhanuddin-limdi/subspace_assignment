import 'package:flutter/material.dart';
import 'package:subspace_project/services/favourites_service.dart';
import 'package:subspace_project/widgets/blog_card.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  late List favouritesList;
  @override
  void initState() {
    super.initState();
    favouritesList = getFavouritesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 75),
                if (favouritesList.isNotEmpty)
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: favouritesList.length,
                    itemBuilder: (context, index) {
                      return BlogCard(blogData: favouritesList[index]);
                    },
                  )
                else
                  const Center(
                    child: Text(
                      'There are no Favourite Blogs',
                    ),
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
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const Text(
                        'Favourite Blogs',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
