import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itemify/domain/constants/app_assets.dart';
import 'package:itemify/domain/constants/app_colors.dart';
import 'package:itemify/domain/models/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.itemTileBorderColor,
            width: 1.5,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                item.title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SvgPicture.asset(deleteIcon)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            item.description,
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
