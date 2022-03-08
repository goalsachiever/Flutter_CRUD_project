import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({Key? key}) : super(key: key);

  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {

  final _formkey = GlobalKey<FormState>();

  var name = "";
  var email = "";
  var password = "";

  // create a Text controller help us to retrieve the data
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose()
  {
    // clean the controller when the widget is disposed.
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  clearText()
  {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  addUser()
  {
    print("User Added");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Student Details'),
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
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: nameController,
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
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: emailController,
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
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: passwordController,
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
                              setState(() {
                                name = nameController.text;
                                email = emailController.text;
                                password = passwordController.text;
                                addUser();
                                clearText();
                              });
                            }

                        }, child:Text('Register', style: TextStyle(fontSize: 18.0,),),
                        ),
                        ElevatedButton(onPressed: (){

                          clearText();

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
