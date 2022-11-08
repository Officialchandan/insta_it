import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../models/books_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class SearchState extends HomeState {
  final List<Item> bookItem;
  final StreamController<List<Item>> searchStream;
  const SearchState({required this.searchStream, required this.bookItem});
  @override
  List<Object> get props => [bookItem, searchStream];
}

class ChangeHintTextState extends HomeState {
  final String hintText;
  const ChangeHintTextState({required this.hintText});
  @override
  List<Object> get props => [hintText];
}
