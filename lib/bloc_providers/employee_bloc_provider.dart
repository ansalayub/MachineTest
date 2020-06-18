import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:machinetest/model/employee_model.dart';
import 'api_employee_provider.dart';
import 'db_emp_provider.dart';


class EmployeeBloc extends ChangeNotifier{

  EmployeeBloc(){
    this.getAllEmployees();
  }

   List<Employee> _employees;
   UnmodifiableListView<Employee> get employees => 
   UnmodifiableListView(_employees); 


   Future<List<Employee>> getAllEmployees() async {
    var apiProvider = EmployeeApiProvider();
    await apiProvider.getAllEmployees();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    Future<List<Employee>> list = DBProvider.db.getAllEmployees(); 
    print("employess :"+list.toString());
      
    Future<List<Employee>> backuplist = list;
    _employees = backuplist as List<Employee>;
    
    notifyListeners(); 
    return list;
  }
  //searching with name
  Employee searchEmployee(String searchName){
     Employee foundEmp;
     for (int i = 0; i < _employees.length; i++) {
        String data = _employees[i].name;
        if (data.toLowerCase().contains(searchName.toLowerCase())) {
          foundEmp = _employees[i];
        }
      }
      return foundEmp;
  }
 

}