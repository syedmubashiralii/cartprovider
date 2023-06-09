import '/models/item.dart';
import '/view_models/items_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 100,
      height: 180,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              Image.network(
                item.image,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
              Visibility(
                  visible: context.read<ItemsViewModel>().itemList.contains(item),
                  child: Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 30,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                      child: Center(child: Text(item.cartQuantity.toString()),),
                    ),
                  ))
            ],
          ),
          Text(item.name),
          ElevatedButton(
            onPressed: () {
              context.read<ItemsViewModel>().add(item);
              //itemsViewModel.add(item);
            },
            child: const Text('Add'),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
          ),
        ],
      ),
    );
  }
}
