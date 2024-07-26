// ignore: camel_case_types
class CartModel {
  int? _id;
  int? _userId;
  String? _date;
  List<Products>? _products;
  int? _iV;

  CartModel(
      {int? id, int? userId, String? date, List<Products>? products, int? iV}) {
    if (id != null) {
      this._id = id;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (date != null) {
      this._date = date;
    }
    if (products != null) {
      this._products = products;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  int? get id => _id;

  get quantity => null;

  get price => null;
  set id(int? id) => _id = id;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get date => _date;
  set date(String? date) => _date = date;
  List<Products>? get products => _products;
  set products(List<Products>? products) => _products = products;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  CartModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['userId'];
    _date = json['date'];
    if (json['products'] != null) {
      _products = <Products>[];
      json['products'].forEach((v) {
        _products!.add(new Products.fromJson(v));
      });
    }
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['userId'] = this._userId;
    data['date'] = this._date;
    if (this._products != null) {
      data['products'] = this._products!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this._iV;
    return data;
  }

  toList() {}
}

class Products {
  int? _productId;
  int? _quantity;

  Products({int? productId, int? quantity}) {
    if (productId != null) {
      this._productId = productId;
    }
    if (quantity != null) {
      this._quantity = quantity;
    }
  }

  int? get productId => _productId;
  set productId(int? productId) => _productId = productId;
  int? get quantity => _quantity;
  set quantity(int? quantity) => _quantity = quantity;

  Products.fromJson(Map<String, dynamic> json) {
    _productId = json['productId'];
    _quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this._productId;
    data['quantity'] = this._quantity;
    return data;
  }
}
