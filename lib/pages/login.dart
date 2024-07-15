import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget buttonContent = Text('Log in');

  Widget loadingDisplay = CircularProgressIndicator();

  Future<bool> login(User user)async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/auth/login'),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String,dynamic>{
        'usernameOrEmail' : user.email,
        'password' : user.password,
      }),
    );
    if(response.statusCode == 200){
      return true;
    }
    return false;
    //print(response.body);
  }

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
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0 ),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/BigBrew Logo.jpg'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.0,),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0,),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors.white,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            label: Text(
                              'Email',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Please input your email';
                            }
                            if(value.length < 2){
                              return 'Wrong Email';
                            }
                            return null;
                          },
                          onSaved: (value){
                            email = value!;
                          },
                        ),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors.white,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            label: Text(
                              'Password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
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
                        SizedBox(height: 25.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(

                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  User user = User(
                                      username: '',
                                      email: email,
                                      password: password
                                  );
                                  /*if (login(user)) {
                                    Navigator.pushReplacementNamed(
                                        context, '/dashboard');
                                  }*/
                                  setState(() {
                                    buttonContent = FutureBuilder(
                                        future: login(user),
                                        builder: (context, snapshots){
                                          if(snapshots.connectionState == ConnectionState.waiting){
                                            return loadingDisplay;
                                          }
                                          if(snapshots.hasData){

                                          }
                                          return Text('Log in');
                                        }
                                    );
                                  });
                                  Navigator.pushReplacementNamed(context, '/dashboard');
                                }
                              },
                              child: buttonContent,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown[500],
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0,),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Text(
                        'Or Sign up with',
                        style: TextStyle(
                            color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      const Expanded(
                          child: Divider(
                            height: 1,
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[400],
                            foregroundColor: Colors.grey[200]
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ImageIcon(
                              AssetImage('assets/google.png'),
                              color : null,
                            ),
                            SizedBox(width: 80,),
                            Text('Login with Google')
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[900],
                            foregroundColor: Colors.grey[200]
                        ),
                        child:  const Row(
                          children: <Widget>[
                            Icon(Icons.facebook),
                            SizedBox(width: 80,),
                            Text('Login with Facebook'),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Dont have an account?',
                        style: TextStyle(
                          color : Colors.black,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      InkWell(
                        child: Text(
                          'Sign up here',
                          style: TextStyle(
                            color: Colors.brown[900],
                          ),
                        ),
                        onTap: ()=> Navigator.popAndPushNamed(context, '/Signup'),
                      ),
                    ],
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}







