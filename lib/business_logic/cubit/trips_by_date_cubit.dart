import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/trips_by_date_model.dart';
import '../../data/repository/trips_by_date_repo.dart';

part 'trips_by_date_state.dart';

class TripsByDateCubit extends Cubit<TripsByDateState> {
  final TripsByDateRepository tripsByDateRepository;

  // late TripsByDateModel tripsCubit;

  TripsByDateCubit(this.tripsByDateRepository) : super(TripsByDateInitial());

  Future<void> getTrips({required String date}) async {
    emit(TripsLoading());
    try {
      final t = await tripsByDateRepository.getTripsByDate(date: date);
      emit(TripsLoaded(t));
      // this.tripsCubit = t;
    } catch (e) {
      emit(TripsError(e.toString()));
    }
  }
}
