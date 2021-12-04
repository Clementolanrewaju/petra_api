import 'package:petra_final/core/models/response/customer.dart';

class GetAllCustomersResponse {
  GetAllCustomersResponse({
     this.status,
    this.message,
     this.data,
     this.meta,
  });
    bool status;
    String message;
   List<Customer> data;
    Meta meta;

  GetAllCustomersResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e) => Customer.fromJson(e)).toList();
    meta = Meta.fromJson(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['meta'] = meta.toJson();
    return _data;
  }
}

class Meta {
  Meta({
     this.totalItems,
     this.itemCount,
     this.itemsPerPage,
     this.totalPages,
     this.currentPage,
  });
    int totalItems;
    int itemCount;
    int itemsPerPage;
    int totalPages;
    int currentPage;

  Meta.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    itemCount = json['itemCount'];
    itemsPerPage = json['itemsPerPage'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['totalItems'] = totalItems;
    _data['itemCount'] = itemCount;
    _data['itemsPerPage'] = itemsPerPage;
    _data['totalPages'] = totalPages;
    _data['currentPage'] = currentPage;
    return _data;
  }
}
