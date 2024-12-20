
class Heberge {
  final String id;
final String type;
 final  String nom;
  final String adresse;
  final int rating;
  final String cost;
  final List<String> image;
  final List<String> offres;
  Heberge( {required this.id,required this.offres,required this.type, required this.nom, required this.adresse, required this.rating, required this.cost, required this.image});
 factory Heberge.fromJson(Map<String, dynamic> json) {
    return Heberge(
      id: json['_id']??"",
      nom: json['name']??"",
      adresse: json['adresse']??"",
      rating: json['rating']??"",
      cost: json['price']??"",
      image: ['https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'], 
      offres: [''] ,
      type: json['type']??"",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': nom,
      'adresse': adresse,
      'rating': rating,
      'price': cost,
      'imageList': image,
    };
  }
}
enum TypeHeberge {
  hotel,
  maison,camp
}

