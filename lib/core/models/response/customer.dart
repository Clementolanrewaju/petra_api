class Customer {
  Customer({
     this.id,
     this.firstName,
     this.lastName,
     this.email,
    this.integration,
    this.domain,
    this.customerReference,
    this.createdAt,
    this.updatedAt,
  });
    String id;
    String firstName;
    String lastName;
    String email;
  String integration;
  String domain;
  String customerReference;
  String createdAt;
  String updatedAt;

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    integration = json['integration'];
    domain = json['domain'];
    customerReference = json['customer_reference'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['integration'] = integration;
    _data['domain'] = domain;
    _data['customer_reference'] = customerReference;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
