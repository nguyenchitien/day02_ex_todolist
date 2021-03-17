import 'dart:async';

import 'package:rxdart/rxdart.dart';

class ExpTickerBloc {
  static const RESET_VALUE = -1;

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

  void refreshTicker() {
    stopTicker();
    _tickerController.add(ExpTickerBloc.RESET_VALUE);
    _currentTime = 0;
    kExpTickerBloc.startTicker();
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
