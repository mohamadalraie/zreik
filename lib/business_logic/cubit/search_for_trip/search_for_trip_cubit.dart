import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_for_trip_state.dart';

class SearchForTripCubit extends Cubit<SearchForTripState> {
  SearchForTripCubit() : super(SearchForTripInitial());
}
