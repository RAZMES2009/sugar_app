class User {
  final String name;
  final String gender;
  final int age;
  final int weight;
  final int height;
  final double activity;
  final Map<String, int> norms;
  final Map<String, Map<String, int>> ate;

  const User({
    required this.name,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.activity,
    required this.ate,
    required this.norms,
  });
}
