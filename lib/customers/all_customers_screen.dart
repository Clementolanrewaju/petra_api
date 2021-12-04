import 'package:petra_final/core/models/response/customer.dart';
import 'package:petra_final/core/models/response/get_all_customers.dart';
import 'package:petra_final/core/services/customer_service.dart';
import 'package:petra_final/customers/create_customer_screen.dart';
import 'package:flutter/material.dart';

class AllCustomersScreen extends StatefulWidget {
  const AllCustomersScreen({Key key}) : super(key: key);

  @override
  State<AllCustomersScreen> createState() => _AllCustomersScreenState();
}

class _AllCustomersScreenState extends State<AllCustomersScreen> {
  bool _isLoading = false;
  List<Customer> _allCustomers = [];

  Future<void> _getAllCustomers() async {
    setState(() {
      _isLoading = true;
    });

    var apiResponse = await CustomerService.getAllCustomers();

    if (apiResponse.runtimeType == GetAllCustomersResponse) {
      _allCustomers = apiResponse.data
          .map(
            (customer) => Customer(
              id: customer.id,
              firstName: customer.firstName,
              lastName: customer.lastName,
              email: customer.email,
              integration: customer.integration,
              customerReference: customer.customerReference,
              createdAt: customer.createdAt,
              updatedAt: customer.updatedAt

            ),
          )
          .toList();
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Customers',
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var newCustomer = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CreateAllCustomerScreen(),
            ),
          );

          if (newCustomer  = null) {
            setState(() {});
            _allCustomers.insert(0, newCustomer);
            const SnackBar snackBar = SnackBar(
              content: Text('Customer created!'),
              backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        label: const Text(
          'Create Customer',
        ),
      ),
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text(
                    'Loading all customers, please wait...',
                  ),
                ],
              ),
            )
          : ListView(
              children: [
                ..._allCustomers.map(
                  (customer) => Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'id: ' + customer.id,
                          ),
                          Text(
                            'Firstname: ' + customer.firstName,
                          ),
                          Text(
                            'Lastname: ' + customer.lastName,
                          ),
                          Text(
                            'Email: ' + customer.email,
                          ),
                          Text(
                            'integration: ' + customer.integration,
                          ),
                          Text(
                            'customerReference: ' + customer.customerReference,
                          ),
                          Text(
                            'createdAt: ' + customer.createdAt,
                          ),
                          Text(
                            'updatedAt: ' + customer.updatedAt,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
