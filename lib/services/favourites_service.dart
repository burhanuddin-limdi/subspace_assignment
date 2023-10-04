import 'package:hive_flutter/hive_flutter.dart';
import 'package:subspace_project/services/data_manager.dart';

List userFavourites = Hive.box('user').get('favourites', defaultValue: []);

void onLikeBlog(dynamic blogData) {
  userFavourites.add(blogData);
  addOrUpdateData('user', 'favourites', userFavourites);
}

void onDislikeBlog(dynamic blogData) {
  userFavourites.remove(blogData);
  addOrUpdateData('user', 'favourites', userFavourites);
}

bool checkForBlogLiked(dynamic blogData) {
  if (userFavourites.isEmpty) {
    return false;
  } else {
    final foundBlog = userFavourites
        .firstWhere((blog) => blog['id'] == blogData['id'], orElse: () => null);
    if (foundBlog != null) {
      return true;
    } else {
      return false;
    }
  }
}

List getFavouritesList() {
  return userFavourites;
}
