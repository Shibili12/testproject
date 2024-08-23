part of 'travellog_bloc.dart';

@immutable
sealed class TravellogEvent {}

class GetTravellogs extends TravellogEvent {}
