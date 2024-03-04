import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:jyothika_s_application8/presentation/received_requests_screen/models/received_requests_model.dart';
part 'received_requests_event.dart';
part 'received_requests_state.dart';

/// A bloc that manages the state of a ReceivedRequests according to the event that is dispatched to it.
class ReceivedRequestsBloc
    extends Bloc<ReceivedRequestsEvent, ReceivedRequestsState> {
  ReceivedRequestsBloc(ReceivedRequestsState initialState)
      : super(initialState) {
    on<ReceivedRequestsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ReceivedRequestsInitialEvent event,
    Emitter<ReceivedRequestsState> emit,
  ) async {
    emit(state.copyWith(nameController: TextEditingController()));
  }
}
