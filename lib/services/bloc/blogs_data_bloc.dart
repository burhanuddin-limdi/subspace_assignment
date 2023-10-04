import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:subspace_project/API/api.dart';

part 'blogs_data_event.dart';
part 'blogs_data_state.dart';

class BlogsDataBloc extends Bloc<BlogsDataEvent, BlogsDataState> {
  BlogsDataBloc() : super(BlogsDataInitial()) {
    on<FetchDataEvent>(fetchData);
  }

  Future<FutureOr<void>> fetchData(
      FetchDataEvent event, Emitter<BlogsDataState> emit) async {
    emit(LoadingState());
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      emit(OfflineState());
    } else {
      try {
        // Replace this with your actual API call
        final List<dynamic> data = await fetchBlogs();
        emit(LoadedState(data));
      } catch (e) {
        emit(ErrorState('Failed to fetch data: $e'));
      }
    }
  }
}
