enum FilterMode { all, active, completed }

extension FilterModeEx on FilterMode {
  String get title => _getTitle(this);

  String _getTitle(FilterMode filterMode) {
    var title;
    switch (filterMode) {
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
