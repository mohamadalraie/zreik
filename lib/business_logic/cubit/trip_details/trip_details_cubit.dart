import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zreiq/data/models/trip_details_model.dart';
import 'package:zreiq/data/models/trips_by_date_model.dart';

import '../../../data/repository/trip_detail_repo.dart';

part 'trip_details_state.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  final TripDetailsRepo tripDetailsRepo;

  TripDetailsCubit(this.tripDetailsRepo) : super(TripDetailsInitial());

  Future<void> getDetails({required Trip trip}) async {
    emit(TripDetailsLoading());
    final tripDetails = await tripDetailsRepo.getTripDetails(trip);
    emit(TripDetailsLoaded(tripDetails));
  }
}
