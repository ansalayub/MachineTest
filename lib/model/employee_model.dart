import 'dart:convert';

List<Employee> employeeFromJson(String str) => 
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Employee { 
   final int id; 
   final String name; 
   final String username; 
   final String email; 
   final String profile_image; 
   final String address; 
   final String phone; 
   final String website; 
   final String company; 

   static final columns = ["id", "name", "username", "email","profile_image", "address","phone","website","company"]; 
   
   Employee(this.id, this.name, this.username, this.email,this.profile_image, this.address, this.phone,this.website,this.company); 
   
   factory Employee.fromJson(Map<String, dynamic> data) {
      return Employee( 
         data['id'], 
         data['name'], 
         data['username'], 
         data['email'], 
         data['profile_image'], 
         data['address'],
         data['phone'], 
         data['website'], 
         data['company']
      ); 
   }

  
   Map<String, dynamic> toJson() => {
      "id": id, 
      "name": name, 
      "username": username, 
      "email": email, 
      "profile_image": profile_image, 
      "address": address,
      "phone":phone,
      "website":website,
      "company":company

   }; 
}