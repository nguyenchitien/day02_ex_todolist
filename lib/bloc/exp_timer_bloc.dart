import 'dart:async';

import 'package:rxdart/rxdart.dart';

class ExpTimeBloc {
  BehaviorSubject<int> _tickController;

  ExpTimeBloc() {
    _tickController = BehaviorSubject.seeded(1);

    // run ticker timer
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer t) => _tickController.add(1),
    );
  }

  Stream<int> get ticker => _tickController.stream;

  void dispose() {
    _tickController.close();
  }
}

final kExpTimeTickerBloc = ExpTimeBloc();
