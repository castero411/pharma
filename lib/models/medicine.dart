class Medicine {
  final String id; // Unique Firestore document ID
  final String name;
  final String description;
  final String type;
  final String dose;
  final List<String> daysOfTheWeek; // Days medicine should be taken
  final DateTime time;

  Medicine({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.dose,
    required this.daysOfTheWeek,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'description': description,
      'dose': dose,
      'daysOfTheWeek': daysOfTheWeek,
      'time': time.toIso8601String(),
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      id: map['id'] ?? '',
      type: map['type'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      dose: map['dose'] ?? '',
      daysOfTheWeek: List<String>.from(map['daysOfTheWeek'] ?? []),
      time: DateTime.parse(map['time']),
    );
  }
}
