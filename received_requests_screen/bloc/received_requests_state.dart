// ignore_for_file: must_be_immutable

part of 'received_requests_bloc.dart';

/// Represents the state of ReceivedRequests in the application.
class ReceivedRequestsState extends Equatable {
  ReceivedRequestsState({
    this.nameController,
    this.receivedRequestsModelObj,
  });

  TextEditingController? nameController;

  ReceivedRequestsModel? receivedRequestsModelObj;

  @override
  List<Object?> get props => [
        nameController,
        receivedRequestsModelObj,
      ];
  ReceivedRequestsState copyWith({
    TextEditingController? nameController,
    ReceivedRequestsModel? receivedRequestsModelObj,
  }) {
    return ReceivedRequestsState(
      nameController: nameController ?? this.nameController,
      receivedRequestsModelObj:
          receivedRequestsModelObj ?? this.receivedRequestsModelObj,
    );
  }
}
