class Warranty {
  final String title;
  final String onDate;
  final String validTill;

  Warranty({
    required this.title,
    required this.onDate,
    required this.validTill,
  });
}

final List<Warranty> dummyWarranties = [
  Warranty(
    title: 'AC Service',
    onDate: '01-01-2025',
    validTill: '01-01-2026',
  ),
  Warranty(
    title: 'Refrigerator Repair',
    onDate: '01-01-2025',
    validTill: '01-01-2026',
  ),
];
