part of 'blogs_data_bloc.dart';

@immutable
sealed class BlogsDataEvent {}

class FetchDataEvent extends BlogsDataEvent {}
