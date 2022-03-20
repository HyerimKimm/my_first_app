import 'package:my_first_app/recipe.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/recipe_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hyerim Flutter App'),
      ),
      body: ListView.builder(itemBuilder: (context,index){
          return GestureDetector(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return RecipeDetail(recipe: recipes[index],);
            }));
          },
              child: buildRecipeCard(recipes[index]));
        },itemCount: recipes.length,
      )
    );
  }

  Widget buildRecipeCard(Recipe recipe){
    return Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(recipe.imageUrl),
              const SizedBox(
                height: 10,
              ),
              Text(
                recipe.name,
                style: const TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Palating'),
              )
            ],
          ),
        ),
    );
  }
}
