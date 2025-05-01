class ProductsModel {
    List<ProductList> productList;
    ProductsModel(this.productList);
}

class ProductList {
    int? id;
    String? title;
    String? shortContent;
    String? content;
    String? productImage;
    String? productUrl;
    int? displayOrder;

    ProductList({
        required this.id,
        required this.title,
        required this.shortContent,
        required this.content,
        required this.productImage,
        required this.productUrl,
        required this.displayOrder,
    });

    factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        id: json["Id"],
        title: json["Title"],
        shortContent: json["shortContent"],
        content: json["content"],
        productImage: json["ProductImage"],
        productUrl: json["ProductUrl"],
        displayOrder: json["DisplayOrder"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Title": title,
        "shortContent": shortContent,
        "content": content,
        "ProductImage": productImage,
        "ProductUrl": productUrl,
        "DisplayOrder": displayOrder,
    };
}
