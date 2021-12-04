// To parse this JSON data, do
//
//     final fetch = fetchFromJson(jsonString);

import 'dart:convert';

Fetch fetchFromJson(String str) => Fetch.fromJson(json.decode(str));

String fetchToJson(Fetch data) => json.encode(data.toJson());

class Fetch {
  Fetch({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  Data data;

  factory Fetch.fromJson(Map<String, dynamic> json) => Fetch(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
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
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    integration: json["integration"],
    domain: json["domain"],
    customerReference: json["customer_reference"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "integration": integration,
    "domain": domain,
    "customer_reference": customerReference,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
