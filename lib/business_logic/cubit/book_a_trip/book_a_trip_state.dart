part of 'book_a_trip_cubit.dart';

@immutable
sealed class BookATripState {}

final class BookATripInitial extends BookATripState {}

class BookATripLoading extends BookATripState {}

class BookATripDone extends BookATripState {
  final BookATripResponseModel bookATripResponseModel;

  BookATripDone(this.bookATripResponseModel);
}
