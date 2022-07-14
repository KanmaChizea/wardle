import 'package:flutter_bloc/flutter_bloc.dart';

enum CurrentPage { menu, level, info, game }

class CurrentPageCubit extends Cubit<CurrentPage> {
  CurrentPageCubit() : super(CurrentPage.menu);
  void goTo(CurrentPage currentPage) {
    emit(currentPage);
  }
}
