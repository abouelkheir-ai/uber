part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}
final class LocationLoading extends LocationState {}
final class LocationSucess extends LocationState {}
final class LocationFailure extends LocationState {}
