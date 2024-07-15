import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String repeatpassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[600],
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 80.0, 0 ,60.0 ),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/BigBrew Logo.jpg'),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                  child:
            Text(
              'Create your Account!',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: 2.0,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
                ),
              ],
            ),
            SizedBox(height: 5.0,),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.white,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        label: Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please input your email';
                        }
                        if(value.length < 3){
                          return 'Name should be atleast 4';
                        }
                        return null;
                      },
                      onSaved: (value){
                        name = value!;
                      },
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.white,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        label: Text('Email',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please input your password';
                        }
                        if(value.length < 8){
                          return 'It should be at least 8 characters';
                        }
                        if(value.length > 20){
                          return 'It must be maximum of 20 characters';
                        }
                        return null;
                      },
                      onSaved: (value){
                        email = value!;
                      },
                    ),
                    SizedBox(height: 15.0,),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.white,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        label: Text('Password',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please input your password';
                        }
                        if(value.length < 8){
                          return 'It should be at least 8 characters';
                        }
                        if(value.length > 20){
                          return 'It must be maximum of 20 characters';
                        }
                        return null;
                      },
                      onSaved: (value){
                        password = value!;
                      },
                    ),
                    SizedBox(height: 15.0,),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.white,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        label: Text('Repeat Password',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please input your password';
                        }
                        if(value.length < 8){
                          return 'It should be at least 8 characters';
                        }
                        if(value.length > 20){
                          return 'It must be maximum of 20 characters';
                        }
                        return null;
                      },
                      onSaved: (value){
                        repeatpassword = value!;
                      },
                    ),
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(onPressed: (){
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            Navigator.pushReplacementNamed(context, '/login');
                          }
                        },
                          child: Text (
                            'Signup',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                            foregroundColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Already have an account?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        InkWell(
                          child: Text(
                            'Login here!',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onTap: ()=> Navigator.popAndPushNamed(context, '/login'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}