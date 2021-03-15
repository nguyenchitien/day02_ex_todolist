import 'package:rxdart/rxdart.dart';

class ExpTimeBloc {
  BehaviorSubject<int> _tickController;

  ExpTimeBloc() {
    _tickController = BehaviorSubject<int>();
  }

  Stream<int> get ticker => _tickController.stream;

  void dispose() {
    _tickController.close();
  }
}
