import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_it/ui/bloc_ui/search_event.dart';
import 'package:insta_it/ui/bloc_ui/search_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<SearchEvent>(
      (event, emit) async {
        print("Hey_Chandan");
        return emit(SearchState(
            bookItem: event.bookItem, searchStream: event.searchStream));
      },
    );
    on<ChangeHintTextEvent>(
      (event, emit) async {
        return emit(ChangeHintTextState(hintText: event.hintText));
      },
    );
    // on<GetVendorsByCategory>(getVendors);
  }
}
