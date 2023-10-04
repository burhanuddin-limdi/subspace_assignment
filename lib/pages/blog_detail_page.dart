import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogDetalPage extends StatelessWidget {
  final dynamic data;
  const BlogDetalPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 75),
              CachedNetworkImage(
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                imageUrl: data['image_url'],
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Text(
                  data['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: Container(
            width: double.infinity,
            height: 75,
            color: const Color(0xff303030),
            child: Row(
              children: [
                // const SizedBox(
                //   width: ,
                // ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Blog Details',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
