part of 'travellog_bloc.dart';

@immutable
sealed class TravellogState {}

final class TravellogInitial extends TravellogState {}

class Travellogloading extends TravellogState {}

class TravellogLoaded extends TravellogState {
  final List<TravelLogModel> travellogs;
  TravellogLoaded({required this.travellogs});
}
