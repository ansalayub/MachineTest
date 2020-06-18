import 'package:flutter/material.dart';
import 'package:machinetest/model/employee_model.dart';

class EmpDetailsPage extends StatelessWidget {
  EmpDetailsPage({Key key, this.empitem}) : super(key: key);
  final Employee empitem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.empitem.name,
              style: TextStyle(fontWeight: FontWeight.bold)),//Name of the Employee
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(this.empitem.profile_image,//Image of the Employee
                    height: 200, width: 400, fit: BoxFit.fill),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(this.empitem.username,),
                                    Text(this.empitem.email),
                                    Text(this.empitem.address),
                                    Text(this.empitem.phone),
                                    Text(this.empitem.website),
                                    Text(this.empitem.company),
                                  ],
                                ),
                      ),
                    ),
              ],
              ),
        ),
      ),
    );
  }
}