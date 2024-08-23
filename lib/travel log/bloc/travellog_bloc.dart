import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testproject/travel%20log/model/data.dart';
import 'package:testproject/travel%20log/model/travellogmodel.dart';

part 'travellog_event.dart';
part 'travellog_state.dart';

class TravellogBloc extends Bloc<TravellogEvent, TravellogState> {
  TravellogBloc() : super(TravellogInitial()) {
    on<GetTravellogs>((event, emit) {
      emit(Travellogloading());
      final travellogs = gettravellog();
      emit(TravellogLoaded(travellogs: travellogs));
    });
  }
}

gettravellog() {
  return travelLogData.map((data) => TravelLogModel.fromMap(data)).toList();
}
