part of 'blogs_data_bloc.dart';

@immutable
sealed class BlogsDataState {}

final class BlogsDataInitial extends BlogsDataState {}

class LoadingState extends BlogsDataState {}

class LoadedState extends BlogsDataState {
  final List<dynamic> data;

  LoadedState(this.data);
}

class OfflineState extends BlogsDataState {}

class ErrorState extends BlogsDataState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}
