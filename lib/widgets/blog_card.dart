import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:subspace_project/pages/blog_detail_page.dart';
import 'package:subspace_project/services/favourites_service.dart';

class BlogCard extends StatefulWidget {
  final dynamic blogData;
  const BlogCard({super.key, required this.blogData});

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  late bool blogLiked;

  @override
  void initState() {
    super.initState();
    blogLiked = checkForBlogLiked(widget.blogData);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BlogDetalPage(data: widget.blogData),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff303030),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                      imageUrl: widget.blogData['image_url'],
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: IconButton(
                      onPressed: () {
                        blogLiked
                            ? onDislikeBlog(widget.blogData)
                            : onLikeBlog(widget.blogData);
                        setState(() {
                          blogLiked = checkForBlogLiked(widget.blogData);
                        });
                      },
                      icon: Icon(
                        blogLiked
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                  widget.blogData['title'],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
