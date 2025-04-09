
class Product {
 late final  int? id;
 late final  String? title;
 late final  num? price;
 late final String? description;
 late final  String? category;
 late final   String? image;
 late final   Rating? rating;
 bool isFavorite = false;

  Product({id, title, price, description, category, image, rating});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }

 @override
 bool operator ==(Object other) {
   if (identical(this, other)) return true;

   return other is Product &&
       other.id == id &&
       other.title == title &&
       other.price == price &&
       other.description == description &&
       other.category == category &&
       other.image == image &&
       other.rating == rating;
 }

 @override
 int get hashCode {
   return id.hashCode ^
   title.hashCode ^
   price.hashCode ^
   description.hashCode ^
   category.hashCode ^
   image.hashCode ^
   rating.hashCode;
 }



}

class Rating {
  num? rate;
  int? count;

  Rating({rate, count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
