import 'package:flutter/material.dart';
import 'package:food_recipi_app/activity/constant.dart';
class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: ()=>Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 32.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
            color: kOrangeColor
          ),
          child: Text('Back',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Hellix-bold',fontSize: 26.0,color: kLightColor),),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child:Container(
            margin: EdgeInsets.only(
                left: 16.0,
                right: 16.0
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: kOrangeColor,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Icon(Icons.star,color: kLightColor,size: 30.0,),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    child: Text("Burger",style: TextStyle(fontSize: 36.0,fontFamily: 'Hellix-blod',fontWeight: FontWeight.bold,),)),
                SizedBox(height: 15.0,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/3.5,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Calories',style: TextStyle(fontFamily: 'Hellix',fontSize: 20.0,color: Colors.grey),),
                            SizedBox(height: 4.0,),
                            Text('500 kcal',style: TextStyle(fontFamily: 'Hellix-bold',fontSize: 20.0,fontWeight: FontWeight.bold),),
                            SizedBox(height: 30.0,),
                            Text('Time',style: TextStyle(fontFamily: 'Hellix',fontSize: 20.0,color: Colors.grey),),
                            SizedBox(height: 4.0,),
                            Text('10 mins',style: TextStyle(fontFamily: 'Hellix-bold',fontSize: 20.0,fontWeight: FontWeight.bold),),
        
                          ],
        
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Image.asset('assets/images/Burger.png',height: 250.0,fit: BoxFit.contain,)
                    ],
                  ),
                ),
                Text('Ingredients',style: TextStyle(fontFamily: 'Hellix-bold',fontWeight: FontWeight.bold,fontSize: 25.0),),
                SizedBox(height: 5.0,),
                Text("Protein-rich. Meat-free. Ready in less than 10 minutes. This genius trick for using up leftover hard-boiled eggs proves so delicious, we often find ourselves making a batch solely for the purpose of preparing these mini-pizzas. First, hard-cook two eggs. (One of our favorite methods involves a steamer basket for gentle cooking.) Peel and slice the eggs, then place them atop a few English muffin-halves, along with a glug of olive oil, sliced tomato, and shredded mozzarella before toasting. Little ones love these open-faced sandwiches for a snack or a meal—but, in truth, kids of all ages scarf these cheese melts down." ,
                  style: TextStyle(fontFamily: 'Hellix-bold',fontSize: 20.0),),
                SizedBox(height: 20.0,),
                Text('Directions',style: TextStyle(fontFamily: 'Hellix-bold',fontWeight: FontWeight.bold,fontSize: 25.0),),
                SizedBox(height: 5.0,),
                Text("Protein-rich. Meat-free. Ready in less than 10 minutes. This genius trick for using up leftover hard-boiled eggs proves so delicious, we often find ourselves making a batch solely for the purpose of preparing these mini-pizzas. First, hard-cook two eggs. (One of our favorite methods involves a steamer basket for gentle cooking.) Peel and slice the eggs, then place them atop a few English muffin-halves, along with a glug of olive oil, sliced tomato, and shredded mozzarella before toasting. Little ones love these open-faced sandwiches for a snack or a meal—but, in truth, kids of all ages scarf these cheese melts down." ,
                  style: TextStyle(fontFamily: 'Hellix-bold',fontSize: 20.0),),


              ],
            ),
          ) ,
        
        ),
      ),
    );
  }
}
