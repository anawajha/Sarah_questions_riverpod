import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/config/image_manager.dart';
import 'package:sarahah_questions/presentation/views/widgets/loading_shimmer/shimmer.dart';
import 'package:sarahah_questions/presentation/views/widgets/loading_shimmer/shimmer_loading.dart';

class AppImageNetwork extends StatelessWidget {
  const AppImageNetwork(
      {this.width,
      this.height,
      this.url,
      this.fit = BoxFit.cover,
      this.clip = Clip.none,
      this.shape = BoxShape.rectangle,
      this.radius = 12,
      super.key
      });

  final double? width;
  final double? height;
  final String? url;
  final BoxFit fit;
  final BoxShape shape;
  final Clip clip;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) {
          return Container(
            width: width,
            height: height,
            clipBehavior: clip,
            decoration: BoxDecoration(
              borderRadius: clip == Clip.none && shape == BoxShape.rectangle ? BorderRadius.circular(radius) : null,
              shape: shape,
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    url ?? Constants().urlUserPlaceholder),
                fit: fit,
              ),
            ),
          );
        },
        imageUrl: url ?? Constants().urlUserPlaceholder,
        errorWidget: (context, url, error) {
          return Container(
            width: width,
            height: height,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: clip == Clip.none && shape == BoxShape.rectangle ? BorderRadius.circular(radius) : null,
              shape: shape),
              child : CachedNetworkImage(
              imageUrl: Constants().urlUserPlaceholder,
              errorWidget: (context, url, error) {
                return Image.asset(ImageManager().userPlaceholder,
                  height: height,
                  width: width,
                );
              },
              fit: BoxFit.cover));
        },
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder: (context, String? url) {
          return Shimmer(
            child: ShimmerLoading(
              child: Container(
                clipBehavior: clip,
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: clip == Clip.none && shape == BoxShape.rectangle ? BorderRadius.circular(radius) : null,
                  shape: shape,
                  color: Colors.black
                ),
              ),
            ),
          );
        },
        maxWidthDiskCache: width?.toInt(),
        maxHeightDiskCache: height?.toInt()
      ),
    );
  }
}
