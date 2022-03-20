import 'package:flutter/material.dart';
import 'package:my_first_app/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {

  int sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(widget.recipe.name??"no title"),),
      body: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.asset(widget.recipe.imageUrl),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.recipe.name,
            style: const TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Palating'
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context,index){
                Ingredient ingredient = widget.recipe.ingredients[index];
              return Text("${ingredient.quantity} ${ingredient.measure} ${ingredient.name}");
            },itemCount: widget.recipe.ingredients.length,),
          ),
          Slider(
              min: 1,
              max: 10,
              divisions: 10,
              value: sliderVal.toDouble(),
              onChanged: (double newValue){
                setState(() {
                  sliderVal = newValue.round();
                });
                },activeColor: Colors.green,
          )
        ],
      ),
    );
  }
}

