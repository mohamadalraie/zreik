part of 'trip_details_cubit.dart';

@immutable
sealed class TripDetailsState {}

final class TripDetailsInitial extends TripDetailsState {}

class TripDetailsLoading extends TripDetailsState {}

class TripDetailsLoaded extends TripDetailsState {
  final TripDetailsModel tripDetailsModel;

  TripDetailsLoaded(this.tripDetailsModel);
}
