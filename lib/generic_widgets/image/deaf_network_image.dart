import 'package:cached_network_image/cached_network_image.dart';
import 'package:newapp/generic_widgets/image/deaf_asset_image.dart';
import 'package:newapp/services/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../services/api_links.dart';

class DeafHaulingNetworkImage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  final BoxFit errorAndPlaceHolderFit;
  final double paddingValue;

  const DeafHaulingNetworkImage(
      {super.key,
      required this.imagePath,
      this.fit = BoxFit.contain,
      this.errorAndPlaceHolderFit = BoxFit.contain,
      this.paddingValue = 0});

  @override
  Widget build(BuildContext context) {
    // String imageServerUrl = ApiLinks.imagesUrl;
    String imageUrl = 
    // imageServerUrl +
     imagePath;
    final noImage = DeafAssetImage(
      imagePath: AppImages.imagePlaceHolderIcon,
      fit: errorAndPlaceHolderFit,
    );

    if (imagePath.isEmpty || imagePath == '') {
      return noImage;
    }

    if (imagePath.toLowerCase().contains('.svg')) {
      return SvgPicture.network(
        imageUrl,
        fit: fit,
        placeholderBuilder: (context) => DeafAssetImage(
          imagePath: AppImages.imagePlaceHolderIcon,
          fit: errorAndPlaceHolderFit,
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => DeafAssetImage(
        imagePath: AppImages.imagePlaceHolderIcon,
        fit: errorAndPlaceHolderFit,
      ),
      errorWidget: (context, url, error) => noImage,
      fit: errorAndPlaceHolderFit,
    );
  }
}