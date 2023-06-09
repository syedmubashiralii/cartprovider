import '/models/item.dart';
import '/screens/cart_screen.dart';
import '/util/data_store.dart';
import '/widgets/cart_counter_widget.dart';
import '/widgets/item_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loot Sale'),
        toolbarHeight: 50,
        actions:  [GestureDetector(
            onTap: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const CartScreen();
              }));

            },
            child: const CartCounterWidget())],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),

        child: SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: DataStore.list.length,
              itemBuilder: (context, index){
                Item item = DataStore.list[index];
                return ItemTile(item: item);
          }),
        ),
      ),
    );
  }
}
