import 'package:flutter/material.dart';
import 'package:personal_finance_tracker/pages/dashboard_page.dart';
import 'package:personal_finance_tracker/pages/your_transactions_page.dart';
import 'package:personal_finance_tracker/pages/contact_admin_page.dart';
import 'package:personal_finance_tracker/pages/add_transactions_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const Color customButtonColor = Color(0xff2563eb);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const DashboardPage();
        break;
      case 1:
        page = const YourTransactionsPage();
        break;
      case 2:
        page = const AddTransactionsPage();
        break;
      case 3:
        page = const ContactAdminPage();
        break;
      default:
        page = const DashboardPage();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  backgroundColor: const Color.fromARGB(255, 11, 99, 188),
                  indicatorColor: DashboardScreen.customButtonColor,
                  extended: constraints.maxWidth >= 600,
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.dashboard, color: Colors.white),
                      label: Text(
                        'Dashboard',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.receipt, color: Colors.white),
                      label: Text(
                        'Your Transactions',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text(
                        'Add Transactions',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.contact_support, color: Colors.white),
                      label: Text(
                        'Contact Admin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 11, 99, 188),
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
