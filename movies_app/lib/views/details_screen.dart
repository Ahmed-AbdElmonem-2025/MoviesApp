import 'package:flutter/material.dart';
import 'package:movies_app/movie_model.dart';
 
class DetailsView extends StatelessWidget {
   final MovieModel movieModel;
    DetailsView({ Key? key , required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies details'),),
      body: ListView(
        children: [
          Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.brown.withOpacity(0.1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.network(
               movieModel.image),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Text(
                  movieModel.title,
                 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  movieModel.overview,
                  
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min, // عشان يخلى الرو ياخد على قد العناصر اللى جواه بس
                  children:   [
                    Icon(Icons.star, color: Colors.orange),
                    SizedBox(
                      width: 3,
                    ),
                    Text(movieModel.voteAverage.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
        ],
      ),
    );
  }
} 