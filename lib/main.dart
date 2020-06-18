import 'package:flutter/material.dart';
import 'package:machinetest/screens/employee_list.dart';
import 'package:provider/provider.dart';
import 'bloc_providers/employee_bloc_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EmployeeBloc>(
        create:(_) => EmployeeBloc(),
        child: MaterialApp(
                title: 'Employee List',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                debugShowCheckedModeBanner: false,
                initialRoute: 'home',
                routes: {
                  'home': (BuildContext context) => EmployeeList(),
                },
              
        ),
    );
  }
}


