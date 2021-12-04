import 'package:petra_final/core/models/response/create_customer.dart';
import 'package:petra_final/core/models/response/customer.dart';
import 'package:petra_final/core/services/customer_service.dart';
import 'package:flutter/material.dart';

class CreateAllCustomerScreen extends StatefulWidget {
  const CreateAllCustomerScreen({Key key}) : super(key: key);

  @override
  State<CreateAllCustomerScreen> createState() =>
      _CreateAllCustomerScreenState();
}

class _CreateAllCustomerScreenState extends State<CreateAllCustomerScreen> {
  bool _isLoading = false;
  String _firstName = '';
  String _lastName = '';
  String _email = '';

  Future<void> _createCustomer() async {
    setState(() {
      _isLoading = true;
    });

    var apiResponse = await CustomerService.createCustomer(
      email: _email,
      firstname: _firstName,
      lastname: _lastName,
    );

    if (apiResponse.runtimeType == CreateCustomerResponse) {
      Customer customer = Customer(
        id: apiResponse.data.id,
        email: apiResponse.data.email,
        firstName: apiResponse.data.firstName,
        lastName: apiResponse.data.lastName,
      );
      Navigator.pop(context, customer);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Customer',
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'First Name',
              ),
              onChanged: (val) {
                setState(() {
                  _firstName = val;
                });
              },
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Last Name',
              ),
              onChanged: (val) {
                setState(() {
                  _lastName = val;
                });
              },
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              onChanged: (val) {
                setState(() {
                  _email = val;
                });
              },
            ),
            const SizedBox(height: 25),
            FlatButton(
              onPressed: _createCustomer,
              color: Colors.blue,
              height: 55,
              minWidth: double.infinity,
              textColor: Colors.white,
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Create Customer',
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
