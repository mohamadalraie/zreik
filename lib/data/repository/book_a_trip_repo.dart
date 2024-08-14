import 'package:zreiq/data/apis/booking/book_a_trip_api.dart';
import 'package:zreiq/data/models/book_a_trip_model.dart';

class BookATripRepo {
  final BookATripApi bookATripApi;

  BookATripRepo(this.bookATripApi);

  Future<BookATripResponseModel> bookATrip(
      {required BookATripRequestModel bookATripRequestModel,
      required int tripId}) async {
    final bookingResponse = await bookATripApi.bookATrip(
        model: bookATripRequestModel, tripId: tripId);

    return bookingResponse;
  }
}
