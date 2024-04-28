part of 'active_widget_cubit.dart';

@immutable
sealed class ActiveWidgetState {}

final class ActiveWidgetInitial extends ActiveWidgetState {}
final class ActiveWidgetChanged extends ActiveWidgetState {
  ActiveWidgetChanged(int idex);
}
