class Medicine {
  final int id;
  final String name;
  final DateTime startingDate;
  final String description;
  final int dose;
  final List<String> daysOfTheWeek;

  const Medicine({
    required this.id,
    required this.description,
    required this.name,
    required this.startingDate,
    required this.dose,
    required this.daysOfTheWeek,
  });
}
