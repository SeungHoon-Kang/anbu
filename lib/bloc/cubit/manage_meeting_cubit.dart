import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/pages/views/meeting/component/meeting.dart';

class MeetingCubit extends Cubit<List<Meeting>> {
  MeetingCubit() : super([]);

  void updateMeetings(List<Meeting> meetings) {
    emit(meetings);
  }

  void updateJoinedMeetings() {
    // Implement the logic to update the list of joined meetings here
    // For example, you can fetch data from an API or update the state based on your requirements
    final updatedMeetings =
        <Meeting>[]; // Replace with your logic to update the list of joined meetings
    emit(updatedMeetings);
  }

  void updateMyMeetings() {
    // Implement the logic to update the list of my meetings here
    // For example, you can fetch data from an API or update the state based on your requirements
    final updatedMeetings =
        <Meeting>[]; // Replace with your logic to update the list of my meetings
    emit(updatedMeetings);
  }
}
