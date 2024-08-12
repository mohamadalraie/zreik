import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zreiq/data/models/book_a_trip_model.dart';
import 'package:zreiq/data/repository/book_a_trip_repo.dart';

part 'book_a_trip_state.dart';

class BookATripCubit extends Cubit<BookATripState> {
  final BookATripRepo bookATripRepo;

  BookATripCubit(this.bookATripRepo) : super(BookATripInitial());

  Future<void> book(
      BookATripRequestModel bookATripRequestModel, int tripId) async {
    emit(BookATripLoading());
    final bookResponse = await bookATripRepo.bookATrip(
        bookATripRequestModel: bookATripRequestModel, tripId: tripId);
    emit(BookATripDone(bookResponse));
  }
}
