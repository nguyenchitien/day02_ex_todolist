enum FilterMode { all, active, completed }

extension FilterModeEx on FilterMode {
  String filterTitle() {
    var title;
    switch (this) {
      case FilterMode.all:
        title = "All";
        break;
      case FilterMode.active:
        title = "Active";
        break;
      case FilterMode.completed:
        title = "Completed";
        break;
    }
    return title;
  }
}
