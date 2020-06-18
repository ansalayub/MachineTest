import 'package:flutter/cupertino.dart';
import 'package:machinetest/bloc_providers/employee_bloc_provider.dart';
import 'package:machinetest/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'employee_details.dart';


//below code - searching
    Widget appBarTitle = new Text(
      "Search Example",
      style: new TextStyle(color: Colors.white),
    );
    Icon icon = new Icon(
      Icons.search,
      color: Colors.white,
    );
    final globalKey = new GlobalKey<ScaffoldState>();
    final TextEditingController _controller = new TextEditingController();

class EmployeeList extends StatelessWidget{

  Future<List<Employee>> employees;

  BuildContext get context => context;

  String _searchText; 
  
  // final items = Product.getProducts();
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<EmployeeBloc>(context);
    employees = bloc.getAllEmployees();
    print("employees in list:"+employees.toString());
    

    return Scaffold(
        appBar: buildAppBar(context),//AppBar(title: Text("Employee List")),
        body: Center(
          child: 
            FutureBuilder<List<Employee>>(
            future: employees,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (snapshot.hasData) {
                return EmployeeBoxList(emplist: snapshot.data);
              } else {
                // return the ListView widget :
                return Center(child: new CircularProgressIndicator());
              }
            },
          ),
          ),
        );
  }//Widget build
  //app bar
  Widget buildAppBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: icon,
        onPressed: () {
              appBarTitle = new TextField(
                controller: _controller,
                style: new TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                    hintStyle: new TextStyle(color: Colors.white)),
                onChanged: searchOperation,
              );
              _handleSearchStart();
              
        },
      ),
    ]);
  }//buildAppBar

  void searchOperation(String searchText) {
    //searchresult.clear();
    //if (_isSearching != null) {
    _searchText = searchText;

    
  }
  //on click of the button - emp will be searched & displayed in details page
  void _handleSearchStart() {
      Employee foundEmp = Provider.of<EmployeeBloc>(context).searchEmployee(_searchText);
      Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmpDetailsPage(empitem: foundEmp),
      ));
  }

}//EmployeeList




class EmployeeBoxList extends StatelessWidget {
  final List<Employee> emplist;
  EmployeeBoxList({Key key, this.emplist});
  
  @override
  Widget build(BuildContext context) {
    print("in prod box : "+emplist.length.toString());
    return ListView.builder(
      itemCount: emplist.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: EmployeeBox(item: emplist[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EmpDetailsPage(empitem: emplist[index]),
              ),
            );
          },
        );
      },
    );
  }
}//EmployeeBoxList

class EmployeeBox extends StatelessWidget {
  EmployeeBox({Key key, this.item}) : super(key: key);
  final Employee item;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.network(this.item.profile_image),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(this.item.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(this.item.company),//Todo - get comp name after parsing to json
                      ],
                    ),
                ),
              ),
            ],
          ),
        ));
  }
}//EmployeeBox