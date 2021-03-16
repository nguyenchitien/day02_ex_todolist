import 'dart:async';

import 'package:rxdart/rxdart.dart';

class ExpTickerBloc {
  BehaviorSubject<int> _tickerController;
  Timer _timerTicker;
  int _currentTime = 0;

  ExpTickerBloc() {
    _tickerController = BehaviorSubject.seeded(0);
  }

  Stream<int> get ticker => _tickerController.stream;

  void startTicker() {
    _timerTicker = Timer.periodic(
      Duration(seconds: 1),
      (Timer t) => _tickerController.add(++_currentTime),
    );
  }

  void stopTicker() {
    _timerTicker.cancel();
  }

  void dispose() {
    _tickerController.close();
    _timerTicker.cancel();
  }
}

final kExpTickerBloc = ExpTickerBloc();
