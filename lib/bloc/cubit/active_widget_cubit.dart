import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'active_widget_state.dart';

class ActiveWidgetCubit extends Cubit<ActiveWidgetState> {
  ActiveWidgetCubit() : super(ActiveWidgetInitial());

  void changeActiveWidget(int index) {
    emit(ActiveWidgetChanged(index));
  }
  
}
