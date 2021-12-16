import 'package:flutter/material.dart';
import 'package:flutter_application_1/startpage.dart';

void main() {
  runApp(const MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
           color: Colors.white
           ),
        // ignore: prefer_const_constructors
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [SizedBox(
                  width : double.infinity,
                  child: Padding(padding: const EdgeInsets.only(top : 20),
                  child: Image.asset("assets/images/deliveryguy.PNG",width: 250,height: 250,fit: BoxFit.contain,),),
                ),
    
                SizedBox(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                     Text("Discovers Resturants \nClose to You", style: TextStyle(
                  fontSize: 25,fontWeight: FontWeight.bold, letterSpacing: 1
                ), textAlign: TextAlign.center),
    
                  Text("Get your food delievered to you at \nthe comfort of your home",
                   style: TextStyle(
                  fontSize: 15,fontWeight: FontWeight.bold,
                 color: Colors.black26
                ), 
                textAlign: TextAlign.center),
                  ],)
                ),
               
                
                SizedBox(
                  height: 140,
      
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    GestureDetector(
                      // ignore: avoid_print
                      onTap: () =>Navigator.push(context, PageRouteBuilder( 
                        pageBuilder: (context, animation, secondaryAnimation) => StartScreen(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1, 0);
                              const end = Offset.zero;
                              const curve = Curves.ease;

                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                                
                              );
                            },
                        ),
                        ),
                      child: Container(
                        width: 250,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xcc008c8c),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: const Center(
                          child: Text("Get Started", style: TextStyle(
                            fontSize:18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),),
                        ),
                        
                      ),
                    ),
                     GestureDetector(
                      // ignore: avoid_print
                      onTap: () => print("Login"),
                      child: Container(
                        width: 250,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black12 )
                        ),
                        child: const Center(
                          child: Text("Login", 
                          style: TextStyle(
                            fontSize:18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xcc008c8c)
                          ),
                          ),
                        ),
                        
                      ),
                    )
                  ],),
                )
    
                ],
    
                
              ),
              
            ),
        )
          ),
    );
}



}
