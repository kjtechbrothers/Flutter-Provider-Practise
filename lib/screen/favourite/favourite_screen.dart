
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/favourite_provider.dart';
import 'package:untitled4/screen/favourite/my_favourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Favourite App'),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyFavouriteItemScreen() ) );
            },
              child: const Icon(Icons.favorite,color: Colors.red,)),
        ],

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context,index){
              return Consumer<FavouriteItemProvider>(builder: (context,value,child){
                return ListTile(
                  onTap: (){
                    if(value.selectedItem.contains(index)){
                      value.removeItem(index);
                    }else{
                      value.addItem(index);
                    }

                  },
                  title: Text('Item'+index.toString()),
                  trailing: Icon(
                    value.selectedItem.contains(index)?Icons.favorite:Icons.favorite_outline_sharp,
                    color: Colors.red,
                  ),
                );
              });
            }),
          )
        ],
      )
    );
  }
}
