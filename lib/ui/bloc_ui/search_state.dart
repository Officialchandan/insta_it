import 'package:equatable/equatable.dart';

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
  @override
  List<Object> get props => [];
}

class ChangeHintTextState extends HomeState {
  final String hintText;
  const ChangeHintTextState({required this.hintText});
  @override
  List<Object> get props => [hintText];
}
