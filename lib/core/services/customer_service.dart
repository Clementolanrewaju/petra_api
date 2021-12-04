import 'dart:convert';
import 'dart:io';

import 'package:petra_final/core/api_urls.dart';
import 'package:petra_final/core/models/response/create_customer.dart';
import 'package:petra_final/core/models/response/fetch_customer.dart';
import 'package:petra_final/core/models/response/get_all_customers.dart';
import 'package:http/http.dart' as http;

class CustomerService {
  static Future<GetAllCustomersResponse> getAllCustomers() async {
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader:
          'Bearer sk_test_H7w7MvJyI7gHFBeCEvpktRcj7LRnyV84'
    };
    final response =
        await http.get(Uri.parse(ApiUrls.customerurl), headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return GetAllCustomersResponse.fromJson(jsonResponse);
    } else {
      throw Exception('failed to get all customers');
    }
  }

  static Future<CreateCustomerResponse> createCustomer({
     String email,
     String firstname,
     String lastname, reference,
  }) async {
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader:
          'Bearer sk_test_H7w7MvJyI7gHFBeCEvpktRcj7LRnyV84'
    };
    Map<String, String> body = {
      'email': email,
      'first_name': firstname,
      'last_name': lastname,
    };
    final response = await http.post(
      Uri.parse(ApiUrls.customerurl ),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return CreateCustomerResponse.fromJson(jsonResponse);
    } else {
      throw Exception('failed to create customer');
    }
  }
  static Future<Fetch> fetchCustomer({String reference}) async {
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader:
      'Bearer sk_test_H7w7MvJyI7gHFBeCEvpktRcj7LRnyV84'
    };

    final response =
    await http.get(Uri.parse(ApiUrls.customerurl + '/$reference'), headers: headers, );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return Fetch.fromJson(jsonResponse);
    } else {
      throw Exception('failed to get the customers');
    }
  }
}
