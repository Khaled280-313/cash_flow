part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class CategoryLoading extends HomeState {}

class CategoryLoaded extends HomeState {
  final List<CategoryEntities> categories;

  CategoryLoaded({required this.categories});
}

class CategoryError extends HomeState {
  final String message;

  CategoryError({required this.message});
}

class CategoryAdded extends HomeState {
  final CategoryAddMessage category;

  CategoryAdded({required this.category});
}


