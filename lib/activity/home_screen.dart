import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipi_app/activity/constant.dart';
import 'package:food_recipi_app/activity/recipe_screen.dart';
import 'package:http/http.dart';

import 'model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  List<RecipeModel> recipeList= <RecipeModel>[];
  getRecipe(String query) async {
    String url ="https://api.edamam.com/api/recipes/v2?type=public&q=$query&app_id=bacff06d&app_key=21d7a5e6d035e180d6276ca7544554e9%09";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
   // log(data["hits"].toString());


    data["hits"].forEach((element){
      RecipeModel recipeModel=RecipeModel();
      recipeModel=RecipeModel.fromMap(element["recipe"]);
      recipeList.add(recipeModel);
      //log(recipeList.toString());
    });
    recipeList.forEach((Recipe){
      print(Recipe.foodLabel);
      print(Recipe.calories);
    });
    //print(data);
  }

  @override
  void initState() {
    super.initState();
    getRecipe("burger");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kLightColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_rounded,
              size: 32.0,
            ),
          ),
          backgroundColor: kLightColor,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  size: 32.0,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'What would you like to cook today?',
                  style: TextStyle(
                      fontFamily: 'Hellix-Bold',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 6.0),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: TextField(
                          controller: searchController,
                          cursorColor: kDarkColor,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: IconButton(
                                onPressed: () {
                                  if ((searchController.text)
                                          .replaceAll(" ", "") ==
                                      "") {
                                    print("Blank search");
                                  } else {
                                    getRecipe(searchController.text);
                                  }
                                },
                                icon: const Icon(
                                  Icons.search,
                                  size: 34.0,
                                  color: kBlueColor,
                                ),
                              ),
                              hintText: 'Search for recipes',
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 20.0)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 18.0),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/settings.png',
                          height: 22.0,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Today's Fresh Recipes",
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Hellix-Bold'),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("object");
                      },
                      child: const Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Hellix-Bold',
                            color: kOrangeColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Container(
                  // width: MediaQuery.of(context).size.width,

                  height: 230.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => RecipeScreen())),
                        child: Container(
                          margin: EdgeInsets.only(right: 32.0),
                          height: 230.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Stack(
                            children: [
                              Positioned(
                                  child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                ),
                              )),
                              Positioned(
                                  right: -20.0,
                                  child: Image.asset(
                                    'assets/images/Burger.png',
                                    height: 150,
                                  )),
                              Positioned(
                                top: 100.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Breakfast",
                                        style: TextStyle(
                                            fontFamily: 'Hellix-bold',
                                            fontSize: 15.0,
                                            color: kBlueColor),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Container(
                                          width: 180.0,
                                          child: Text("Burger",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: 'Hellix-bold',
                                                  fontSize: 20.0,
                                                  color: kDarkColor,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Row(
                                        children: List.generate(
                                          5,
                                          (index) => Icon(
                                            Icons.star,
                                            size: 20.0,
                                            color: Colors.amber[700],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.fireplace_outlined,
                                            color: Colors.grey,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("500 calories",
                                              style: TextStyle(
                                                  fontFamily: 'Hellix-bold',
                                                  fontSize: 14.0,
                                                  color: kOrangeColor)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended",
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Hellix-Bold'),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("object");
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Hellix-Bold',
                            color: kOrangeColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RecipeScreen())),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.0),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20.0)),
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/Burger.png',
                              height: 250.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Breakfast",
                                  style: TextStyle(
                                      color: kBlueColor,
                                      fontSize: 14.0,
                                      fontFamily: 'Hellix-bold'),
                                ),
                                Container(
                                    width: 150.0,
                                    child: Text(
                                      "Burger fgdfhdhdfh",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: kDarkColor,
                                          fontSize: 20.0,
                                          fontFamily: 'Hellix-bold',
                                          fontWeight: FontWeight.bold),
                                    )),
                                Row(
                                    children: List.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star,
                                    color: kOrangeColor,
                                    size: 20.0,
                                  ),
                                )),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.fireplace_outlined,
                                      color: Colors.grey,
                                      size: 15.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      "500 calories",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14.0,
                                          fontFamily: 'Hellix-bold'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  height: 30.0,
                                  width: 35.0,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.grey,
                                      ))),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
