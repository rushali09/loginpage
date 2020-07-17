import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
 
 AnimationController _iconanimationController;
 Animation<double> _iconAnimation;

 @override
 void initState(){
   super.initState();
   _iconanimationController=new AnimationController(
     vsync: this,
     duration: Duration(
       milliseconds: 200,
     ),
    );
     _iconAnimation= new CurvedAnimation(
       parent: _iconanimationController, 
       curve: Curves.easeInCirc,
     );
     _iconAnimation.addListener(()=>this.setState(() {})); 
     _iconanimationController.forward();
 }
 
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage("assets/images/chiamma.png",
            ),
            fit: BoxFit.fill,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            padding: EdgeInsets.all(40),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
               
              children: [

                Padding(
                  padding:  EdgeInsets.all(50),
                  child: FlutterLogo(
                      size: _iconAnimation.value*100,
                  ),
                ),

                Form(
                  child: Theme(
                    data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.blue,
                      inputDecorationTheme: InputDecorationTheme(
                        hintStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          
                        ),
                      ),
                    ), 
                    child: Container(
                      child:Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Enter Email",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          RaisedButton(
                            
                            color: Colors.blue,
                            child: Text("Login",
                               style: TextStyle(
                                 fontWeight:FontWeight.bold,
                                 fontSize:18, 
                               ),
                            ),
                            onPressed:(){} 
                            ),
                        ],
                      ),
                    ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
