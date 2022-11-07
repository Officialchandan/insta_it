import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SearchEvent extends HomeEvent {
  SearchEvent();
  @override
  List<Object> get props => [];
}

class ChangeHintTextEvent extends HomeEvent {
  final String hintText;
  ChangeHintTextEvent({required this.hintText});
  @override
  List<Object> get props => [hintText];
}
