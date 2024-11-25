enum drugType {
  pills,
}

class Medicine {
  final String name;
  final drugType type;
  final DateTime startingDate;
  final DateTime edingDate;
  final String description;

  const Medicine(
      {required this.description,
      required this.name,
      required this.startingDate,
      required this.edingDate,
      required this.type});
}
