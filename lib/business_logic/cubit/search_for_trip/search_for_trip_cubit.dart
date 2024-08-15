import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/trips_by_date_model.dart';
import '../../../data/repository/search_for_trip_repo.dart';

part 'search_for_trip_state.dart';

class SearchForTripCubit extends Cubit<SearchForTripState> {
  final SearchForTripRepo searchForTripRepo;

  SearchForTripCubit(this.searchForTripRepo) : super(SearchForTripInitial());

  Future<void> searchForTripsWithDate(
      {String? date, required String from, required String to}) async {
    emit(SearchLoading());
    try {
      final t = await searchForTripRepo.search(from: from, to: to);
      emit(SearchLoaded(t));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  Future<void> searchForTripsWithoutDate(
      {String? date, required String from, required String to}) async {
    emit(SearchLoading());
    try {
      final t = await searchForTripRepo.search(date: date, from: from, to: to);
      emit(SearchLoaded(t));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
