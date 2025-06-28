import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pioneer_alpha_task/common/size_box/custom_sizebox.dart';

import '../app_images/app_images.dart';
import '../app_text_style/styles.dart';

class RepoContainer extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String owner;
  final String rating;
  final String timestamp;
  final VoidCallback onTap;

  const RepoContainer({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.owner,
    required this.rating,
    required this.timestamp,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: imageUrl ?? AppImages.placeHolderImage,
                // placeholder: (context, url) => CircularProgressIndicator(),
                //errorWidget: (context, url, error) => Image.asset(AppImages.profileImage),
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: h3.copyWith(fontSize: 18),
                  ),
                  Text(owner,style: h5,),
                  sh5,
                  Row(
                    children: [
                      Image.asset(AppImages.star,scale: 4,),
                      sw5,
                      Text(rating,style: h5,),
                      sw12,
                      Image.asset(AppImages.clock,scale: 4,),
                      sw5,
                      Text(timestamp,style: h5,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
