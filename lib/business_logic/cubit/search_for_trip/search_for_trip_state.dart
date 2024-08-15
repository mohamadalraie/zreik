part of 'search_for_trip_cubit.dart';

@immutable
sealed class SearchForTripState {}

final class SearchForTripInitial extends SearchForTripState {}

class SearchError extends SearchForTripState {
  final String message;
  SearchError(this.message);
}

class SearchLoading extends SearchForTripState {}

class SearchLoaded extends SearchForTripState {
  final TripsByDateModel tripsState;

  SearchLoaded(this.tripsState);
}
