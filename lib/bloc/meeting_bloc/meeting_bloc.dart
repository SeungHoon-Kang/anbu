import 'dart:async';

class MeetingBloc {
  final _isJoinedController = StreamController<bool>();

  Stream<bool> get isJoinedStream => _isJoinedController.stream;

  MeetingBloc({required bool initialIsJoined}) {
    _isJoinedController.add(initialIsJoined);
  }

  void joinMeeting() {
    _isJoinedController.sink.add(true);
  }

  void leaveMeeting() {
    _isJoinedController.sink.add(false);
  }

  void dispose() {
    _isJoinedController.close();
  }
}
