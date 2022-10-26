import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  var _index = 0;

  static HomeCubit get(context) {
    return BlocProvider.of(context);
  }

  int get index => _index;

  void jumpToTab(int newValue) {
    if (_index == newValue) {
      return;
    }
    _index = newValue;
    emit(ChangeBottomNavigationBarState());
  }

  bool isActive(int currentIndex) => currentIndex == _index;
}
