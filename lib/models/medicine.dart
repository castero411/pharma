class Medicine {
  final int id;
  final String name;
  final DateTime startingDate;
  final DateTime edingDate;
  final String description;

  const Medicine({
    required this.id,
    required this.description,
    required this.name,
    required this.startingDate,
    required this.edingDate,
  });
}
