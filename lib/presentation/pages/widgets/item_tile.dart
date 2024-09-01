import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itemify/domain/constants/app_assets.dart';
import 'package:itemify/domain/constants/app_colors.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key});

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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Rainforest Ecosystems',
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
          const Text(
            'Discover the rich biodiversity found in rainforests, from towering trees to unique wildlife species.',
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
