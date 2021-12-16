import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/dropdownmenu.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class Resturant{

  final String name;
  final String rating;
  final String image;
  final bool check;

  Resturant(this.name, this.rating, this.image, this.check);
}


class _HomeScreenState extends State<HomeScreen> {

   List<Resturant> items = [
     Resturant("Shawarma Place","5.0","assets/images/shawarma.jpg",true),
      Resturant("Olivier Burger","4.8","assets/images/burger.jpg",false),
   ];
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Navbar(),
                     Container(
                       margin: EdgeInsets.only(top : MediaQuery.of(context).size.height*0.03),
                       child: SearchBar()
                      ),
                    Container(
                      margin: EdgeInsets.only(top : MediaQuery.of(context).size.height*0.03),
                      child: CategoriesText()
                      ),
                    Container(
                       margin: EdgeInsets.only(top : MediaQuery.of(context).size.height*0.02),
                      child: CategoriesButtons()
                      ),
                    Container(
                       margin: EdgeInsets.only(top : MediaQuery.of(context).size.height*0.03),
                      child: NearyouAndSeeallButton("Near You")
                      ),
                    Container(
                      margin: EdgeInsets.only(top : MediaQuery.of(context).size.height*0.03),
                      height:  MediaQuery.of(context).size.height*0.28,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) => ResturantsNearMe(
                          image:items[index].image,
                          name: items[index].name,
                          rating:items[index].rating,
                          check: items[index].check,
                          width: MediaQuery.of(context).size.width*0.6,
                          height: MediaQuery.of(context).size.height*0.1 ,
                          ),
                        separatorBuilder:  (BuildContext context, int index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width*0.08,
                          );
                        },
 
                        ),
                        
                    ),
                     Container(
                        margin: EdgeInsets.only(top : MediaQuery.of(context).size.height*0.02),
                       child: NearyouAndSeeallButton("Popular Resturants")
                       ),
                    // Container(
                    //   width :MediaQuery.of(context).size.width*0.9,
                    //   height: MediaQuery.of(context).size.height*0.4*(items.length) ,
                    //   child: ListView.separated(
                    //       shrinkWrap: true,
                    //       scrollDirection: Axis.vertical,
                    //       itemCount: items.length,
                    //       itemBuilder: (context, index) => ResturantsNearMe(
                    //         image:items[index].image,
                    //         name: items[index].name,
                    //         rating:items[index].rating,
                    //         check: items[index].check,
                    //         width: MediaQuery.of(context).size.width*0.9,
                    //         height: MediaQuery.of(context).size.height*0.4 ,
                    //         ),
                    //       separatorBuilder:  (BuildContext context, int index) {
                    //         return SizedBox(
                             
                    //         );
                    //       },
                     
                    //       ),
                    // ),
                        Container(
                          margin: EdgeInsets.only(top : MediaQuery.of(context).size.height*0.02),
                          child: Column(
                            children: items.reversed.map((e) => 
                            ResturantsNearMe(
                              name: e.name,
                              rating: e.rating,
                              image: e.image,
                              check: e.check,
                              width: MediaQuery.of(context).size.width*0.95,
                              height:  MediaQuery.of(context).size.height*0.35
                              )
                              ).toList() 

                          
                          ,),
                        )
                    

                  ],
                ),
              ),
          ),
        ),
      ),
    );
    
  }

  Padding NearyouAndSeeallButton(String word) {

    
    return Padding(
                    padding: const EdgeInsets.only(left:10,right: 10),
                    child: Container(
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(word, style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16
                        ),
                        ),

                        GestureDetector(
                          onTap: () => print("See all"),
                          child: Text("See all", style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14,color: Colors.grey
                          ),
                          ),
                        ),
                      ],
                    ),
                ),
                  );
  }

  Padding CategoriesButtons() {
    return Padding(
                    padding: const EdgeInsets.only(left : 10,right : 10),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                           CategoryButtons(color: 0xfff3e9e0, type: 'Pizza',image: "pizza",),
                            CategoryButtons(color: 0xffdee9d0, type: 'Burger',image: "burger",),
                             CategoryButtons(color: 0xfff1d9d9, type: ' Fries',image: "fries",)
                        ],
                      ),
                    ),
                  );
  }

  Container CategoriesText() {
    return Container(
                    alignment: Alignment.topLeft ,
                    margin: EdgeInsets.only(left: 10),
                    child: const Text("Categories", style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16
                    ),
                    ),
                  );
  }
}

class ResturantsNearMe extends StatelessWidget {

 final String name;
  final String rating;
  final String image;
  final bool check;
  final double width;
  final double height;
  const ResturantsNearMe({
    Key? key, required this.name, required this.rating, required this.image, required this.check, required this.width, required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width : width,
        height:  height,
    
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(children: [
                  Image.asset(image,width : width,fit: BoxFit.fitWidth,),
                  Positioned(
                    right: 10,
                    top : 10,
                    child: Container(
                      width : 50,
                      height : 50,
                      decoration: BoxDecoration(
                        color : Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.bookmark, size: 35 , color : check ? Colors.green : Colors.black),
                    ),
                  )
                ],  )
                )
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      Row(children: [
                          Text(rating,style: TextStyle(fontWeight: FontWeight.w400),),
                          Icon(Icons.star_rate_rounded, color: Colors.amber[400], )
                      ],)
                    ],),
                  ),
                  Row(children: [
                    Icon(Icons.location_on_outlined, color: Colors.grey[400] ),
                    Text("5.8km away", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400]
                    ),)
                  ],)
                ],
                ),
            )
            )
          ],
        ),
      ),
    );
  }
}

class CategoryButtons extends StatelessWidget {
  final int color;
  final String type;
  final String image;

  const CategoryButtons({
    Key? key, required this.color, required this.type, required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(type),
      child: Container(
        width : MediaQuery.of(context).size.width*0.28,
        height: MediaQuery.of(context).size.height*0.07 ,
        decoration: BoxDecoration(
          color:Color(color),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          
          children: [
           Container(
             margin: EdgeInsets.only(left : 18),
             child: Image.asset("assets/images/"+image+".png")
             ),
            Container(
              margin: EdgeInsets.only(left : 8),
              child: Text(type , style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),),
            )
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width : MediaQuery.of(context).size.width*0.9,
      height: MediaQuery.of(context).size.height*0.1,
      decoration: BoxDecoration(
        color : Colors.grey[200],
        borderRadius:  BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Container(
            width : (MediaQuery.of(context).size.width*0.9)*0.7,
          child: Row(
            
          children: [
          Icon(Icons.search, size: 35, color: Colors.black38,),
          Container(
          margin: EdgeInsets.only(left : 7),
          width : (MediaQuery.of(context).size.width*0.9)*0.55,
          height: MediaQuery.of(context).size.height*0.09,
          child: TextFormField(
            decoration: const InputDecoration(
            labelText: 'Search Resturants...',
             border: InputBorder.none,
             
          ),
            maxLines: 1,
            style: TextStyle(
              fontWeight : FontWeight.bold,
              color: Colors.black38
            ),
          ),
        ),
          ],
        )),
       
        GestureDetector(
          onTap: () => print('Sort By'),
          child: Container(
            width: (MediaQuery.of(context).size.width*0.9)*0.13,
            height: (MediaQuery.of(context).size.width*0.9)*0.13,
            decoration: BoxDecoration(
              color :  Color(0xcc008c8c),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(Icons.sort_sharp, color: Colors.white, size: 30,),
          ),
        )
      ],
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        margin : EdgeInsets.only(top : 10),
        width : double.infinity,
        height: MediaQuery.of(context).size.height*0.09,
        decoration: const BoxDecoration(
          color : Colors.transparent
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LocationAndDropDownMenu(),

            Image.asset('assets/images/avatar.png',width: 50,fit: BoxFit.fitWidth,)
          ],

          
        ),
      ),
    );
  }
}

class LocationAndDropDownMenu extends StatelessWidget {
  const LocationAndDropDownMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width :  MediaQuery.of(context).size.width*0.32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LocationAndItsIcon(context),
          DropDownMenuInsideContainer(context)
        ],
      ),
    );
  }

  Center DropDownMenuInsideContainer(BuildContext context) {
    return Center(
          child: Container(
               margin: EdgeInsets.only(left : 10),
            height: MediaQuery.of(context).size.height*0.05,
            decoration: BoxDecoration(
              color: Colors.transparent
            ),
            child: DropDownMenu()
            ),
        );
  }

  Container LocationAndItsIcon(BuildContext context) {
    return Container(
          width : MediaQuery.of(context).size.width*0.215,
          margin: EdgeInsets.only(right : 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.location_on, color: Color(0xffe22b2e), size: 26,),
              Text("Location", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
              )
            ],
          ),
        );
  }
}