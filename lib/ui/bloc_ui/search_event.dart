import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../models/books_model.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SearchEvent extends HomeEvent {
  final List<Item> bookItem;
  final StreamController<List<Item>> searchStream;
  SearchEvent({required this.searchStream, required this.bookItem});
  @override
  List<Object> get props => [bookItem, searchStream];
}

class ChangeHintTextEvent extends HomeEvent {
  final String hintText;
  ChangeHintTextEvent({required this.hintText});
  @override
  List<Object> get props => [hintText];
}
