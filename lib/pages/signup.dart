import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
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
  bool isChecked = true;

  bool roundCheckBoxValue = false;

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
              color: Colors.grey[900],
                child: Center(
                  child: Image(
                    image: AssetImage('assets/bigbrew logo.jpg'),
                  ),
                ),
            ),
            SizedBox(height: 20.0,),
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
                color: Colors.black87,
              ),
            ),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.green,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),

                        label: Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.black,
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
                        label: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black87,
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
                        if(value.length > 40){
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
                        label: Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.black87,
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
                        label: Text(
                          'Repeat Password',
                          style: TextStyle(
                            color: Colors.black,
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
                        ElevatedButton(
                          onPressed: isChecked ? null: (){
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
                    SizedBox(height: 15.0,),
                    SizedBox(width: 30.0,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          RoundCheckBox(
                            isChecked: roundCheckBoxValue,
                            onTap: (selected) {
                              setState(() {
                                isChecked = !isChecked;
                                roundCheckBoxValue = !roundCheckBoxValue;
                              });
                            },
                            size: 30.0,
                            checkedWidget: Icon(Icons.check_circle_outline_rounded, color: Colors.black),
                            uncheckedWidget: Icon(Icons.mood),
                          ),
                          const SizedBox(height: 40.0,),
                          SizedBox(width: 30.0,),
                          Column(
                            children: [
                              Text(
                                'By signing up, you acknowledge that you have',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontFamily: 'BodoniFLFBold',
                                ),
                              ),
                              SizedBox(width: 40.0,),
                              SizedBox(height: 2.0,),
                              Text(
                                ' read & agree to our Terms and Conditions.',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontFamily: 'BodoniFLFBold',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0,),
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
                              fontSize: 15.0,
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