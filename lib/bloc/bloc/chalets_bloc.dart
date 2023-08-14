import 'package:chalets/bloc/events/crud_event.dart';
import 'package:chalets/bloc/states/crud_state.dart';
import 'package:chalets/models/chalet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Takes a `Stream` of `Events` as input
/// and transforms them into a `Stream` of `States` as output.
class ChaletsBloc extends Bloc<CrudEvent, CrudState>{
  ChaletsBloc(super.initialState){
    // on<>((event, emit) => )
    on<CreateEvent<Chalet>>(_onCreateEvent);
    on(_onReadEvent);
    on<UpdateEvent<Chalet>>(_onUpdateEvent);
    on<DeleteEvent>(_onDeleteEvent);
    on<ShowEvent>(_onShowEvent);

  }

  void _onCreateEvent(CreateEvent<Chalet> event, Emitter<CrudState> emit){

  }
  void _onReadEvent(ReadEvent event, Emitter<CrudState> emit){}

  void _onUpdateEvent(UpdateEvent<Chalet> event, Emitter<CrudState> emit){}
  void _onDeleteEvent(DeleteEvent event, Emitter<CrudState> emit){}

  void _onShowEvent(ShowEvent event, Emitter<CrudState> emit){}



}