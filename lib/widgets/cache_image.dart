import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nardilibraryapp/resources/app_colors.dart';

class CacheImage extends StatelessWidget {
  final String imageUrl;
  const CacheImage({ required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(color:Color(0xafEF9D49),strokeWidth: 2,),
        imageUrl: imageUrl,
        errorWidget: (context, url, error) => Icon(Icons.error),
        fadeInDuration: Duration(seconds: 2),
        fit: BoxFit.fill,
      ),
    );
  }
}
