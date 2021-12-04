import 'package:petra_final/core/models/response/customer.dart';

class CreateCustomerResponse {
  CreateCustomerResponse({
    this.status,
    this.message,
    this.data,
  });
   bool status;
   String message;
    Customer data;

  CreateCustomerResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Customer.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}
