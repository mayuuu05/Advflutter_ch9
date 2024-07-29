class ECommerceModal {
  late List<Product> products;

  ECommerceModal({required this.products});

  factory ECommerceModal.fromJson(Map m1) {
    return ECommerceModal(
      products: (m1['products'] as List).map((e) => Product.fromJson(e),).toList(),
    );
  }
}

class Product {
  late String title, description, category, thumbnail;
  late double price, discountPercentage, rating;
  late List<Review> reviews;

  Product({
    required this.title,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.reviews,
  });

  factory Product.fromJson(Map m1) {
    return Product(
      title: m1['title'],
      description: m1['description'],
      category: m1['category'],
      thumbnail: m1['thumbnail'],
      price: m1['price'].toDouble(),
      discountPercentage: m1['discountPercentage'].toDouble(),
      rating: m1['rating'].toDouble(),
      reviews: (m1['reviews'] as List)
          .map(
            (e) => Review.fromJson(e),
      )
          .toList(),
    );
  }
}

class Review {
  late String comment, date, reviewerName, reviewerEmail;
  late int rating;

  Review({
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
    required this.rating,
  });

  factory Review.fromJson(Map m1) {
    return Review(
      comment: m1['comment'],
      date: m1['date'],
      reviewerName: m1['reviewerName'],
      reviewerEmail: m1['reviewerEmail'],
      rating: m1['rating'],
    );
  }
}

