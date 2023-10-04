import 'package:flutter/material.dart';

import 'meeting_bloc.dart';

class MeetingBlocProvider extends InheritedWidget {
  final MeetingBloc bloc;

  MeetingBlocProvider({required this.bloc, required Widget child})
      : super(child: child);

  static MeetingBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MeetingBlocProvider>()!
        .bloc;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
