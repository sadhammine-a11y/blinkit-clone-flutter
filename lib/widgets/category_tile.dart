import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/category.dart';
import '../theme/app_theme.dart';

class CategoryTile extends StatelessWidget {
  final ProductCategory category;
  final VoidCallback? onTap;

  const CategoryTile({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: category.imageUrl,
              width: 68,
              height: 68,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 68,
                height: 68,
                color: AppColors.borderGrey,
              ),
              errorWidget: (context, url, error) => Container(
                width: 68,
                height: 68,
                color: AppColors.borderGrey,
                child: const Icon(Icons.image_not_supported_outlined, size: 20),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            category.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
