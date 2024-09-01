import 'package:flutter/material.dart';
import 'package:itemify/domain/constants/app_colors.dart';
import 'package:itemify/domain/constants/app_strings.dart';
import 'package:itemify/presentation/pages/widgets/item_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteShade,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        title: const Text(
          itemifyString,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(16)),
                child: const Row(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      newString,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.3),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ItemTile(),
            ItemTile(),
            ItemTile(),
            ItemTile(),
            ItemTile(),
            ItemTile(),
          ],
        ),
      ),
    );
  }
}
