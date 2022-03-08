import 'package:flutter/material.dart';
class UpdateStudentPage extends StatefulWidget {
  const UpdateStudentPage({Key? key}) : super(key: key);

  @override
  _UpdateStudentPageState createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {

  final _formkey = GlobalKey<FormState>();



  updateUser()
  {
    print("User updated");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Student Details'),
        ),

        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                  child: TextFormField(
                    initialValue: 'vishu',
                    autofocus: false,
                    onChanged: (value)=> {},
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    validator: (value)
                    {
                      if(value == null || value.isEmpty)
                      {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                  child: TextFormField(
                    autofocus: false,
                    initialValue: 'vishu@gmail.com',
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    validator: (value)
                    {
                      if(value == null || value.isEmpty)
                      {
                        return 'Please Enter Name';
                      }
                      else if(!value.contains('@'))
                      {
                        return 'Please Enter valid mail';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                  child: TextFormField(
                    autofocus: false,
                    initialValue: '123456',
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                    validator: (value)
                    {
                      if(value == null || value.isEmpty)
                      {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(onPressed: (){

                        // Validate true is the form is valid otherwise false
                        if(_formkey.currentState!.validate())
                        {
                          updateUser();
                          Navigator.pop(context);

                        }

                      }, child:Text('Update', style: TextStyle(fontSize: 18.0,),),
                      ),
                      ElevatedButton(onPressed: (){



                      }, child:Text('Reset', style: TextStyle(fontSize: 18.0,),),
                        style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
