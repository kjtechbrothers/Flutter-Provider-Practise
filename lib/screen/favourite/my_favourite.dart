import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';
class MyFavouriteItemScreen extends StatefulWidget {
  const MyFavouriteItemScreen({super.key});

  @override
  State<MyFavouriteItemScreen> createState() => _MyFavouriteItemScreenState();
}

class _MyFavouriteItemScreenState extends State<MyFavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider=Provider.of<FavouriteItemProvider>(context);

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
                  itemCount: favouriteProvider.selectedItem.length,
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

