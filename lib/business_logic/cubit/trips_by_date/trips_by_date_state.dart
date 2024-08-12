part of 'trips_by_date_cubit.dart';

@immutable
abstract class TripsByDateState {}

class TripsByDateInitial extends TripsByDateState {}

class TripsLoading extends TripsByDateState {}

class TripsError extends TripsByDateState {
  final String message;
  TripsError(this.message);
}

class TripsLoaded extends TripsByDateState {
  final TripsByDateModel tripsState;

  TripsLoaded(this.tripsState);
}
