class User{
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json){ //Map je data structure, ki shrani pare ključ vrednost;dynamic omogoča fleksibilnost za obdelavo različnih tipov podatkov
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}