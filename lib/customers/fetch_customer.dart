import 'package:petra_final/core/models/response/create_customer.dart';
import 'package:petra_final/core/models/response/customer.dart';
import 'package:petra_final/core/models/response/fetch_customer.dart';
import 'package:petra_final/core/services/customer_service.dart';
import 'package:flutter/material.dart';
import 'package:petra_final/customers/create_customer_screen.dart';


class fetch_screen extends StatefulWidget {
  const fetch_screen({Key key}) : super(key: key);

  @override
  _fetch_screenState createState() =>
      _fetch_screenState();
}

class _fetch_screenState extends State<fetch_screen> {
  bool _isLoading = false;
  String _reference ='';
  var customer;


  Future<void> fetch_screen() async {
    setState(() {
      _isLoading = true;
    });

    var apiResponse = await CustomerService.fetchCustomer(
      reference:_reference,
    );

    if (apiResponse.runtimeType == Fetch) {
       customer = Customer(
        id: apiResponse.data.id,
        email: apiResponse.data.email,
        firstName: apiResponse.data.firstName,
        lastName: apiResponse.data.lastName,
         customerReference: apiResponse.data.customerReference,
      );
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
          'fetch customer',
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'reference',
              ),
              onChanged: (val) {
                setState(() {
                 _reference = val;
                });
              },
            ),

            const SizedBox(height: 25),
            FlatButton(
              onPressed: fetch_screen,
              color: Colors.blue,

              minWidth: double.infinity,
              textColor: Colors.white,
              child: _isLoading
                  ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
                  : const Text(
                'fetch customer',
              ),
            ),
            SizedBox(height: 30,),
            if (customer != null)
              Card(
                elevation: 0,
                child: Column(
                  children: [
                    Text('id: ${customer.id}'),
                    Text('email: ${customer.email}'),
                    Text('firstName: ${customer.firstName}'),
                    Text('lastName: ${customer.lastName}'),
                    Text('customerReference: ${customer.customerReference}'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
