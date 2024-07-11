import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeEvent {}

class SelectPageEvent extends HomeEvent {
  final int pageIndex;
  SelectPageEvent(this.pageIndex);
}

class HomeState {
  final int selectedIndex;
  HomeState({required this.selectedIndex});
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(selectedIndex: 0)) {
    on<SelectPageEvent>((event, emit) {
      emit(HomeState(selectedIndex: event.pageIndex));
    });
  }
}
