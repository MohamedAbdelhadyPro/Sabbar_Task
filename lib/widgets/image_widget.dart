import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/utils/assets.dart';

Widget ImageWidget(String? url,
    {double? height,
    double? width,
    bool isFile = false,
    fit = BoxFit.cover,
    double radius = 0,
    Color? color}) {
  if (url == null || url.isEmpty) {
    return Image.asset(
      height: height,
      width: width,
      AppAssets.logo,
    );
  }
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: isFile
        ? Image.file(File(url),
            height: height, width: width, fit: fit, color: color)
        : url.contains(".svg") && url.contains("http")
            ? SvgPicture.network(
                url,
                height: height,
                width: width,
                color: color,
              )
            : url.contains(".svg")
                ? SvgPicture.asset(
                    url,
                    height: height,
                    width: width,
                    color: color,
                  )
                : url.contains("http")
                    ? CachedNetworkImage(
                        key: Key("key${Random.secure().nextInt(999999)}"),
                        height: height,
                        width: width,
                        imageUrl: url,
                        color: color,
                        fit: fit,
                        filterQuality: FilterQuality.low,
                        placeholder: (context, url) => Container(
                          height: height,
                          width: width,
                          padding: EdgeInsets.all(40),
                          child: SvgPicture.asset(
                            AppAssets.logo,
                            height: height,
                            width: width,
                            color: color,
                          ),
                        ),
                        errorWidget: (context, url, error) => SvgPicture.asset(
                          AppAssets.logo,
                          height: height,
                          width: width,
                          color: color,
                        ),
                      )
                    : Image.asset(
                        url,
                        height: height,
                        width: width,
                        fit: fit,
                        color: color,
                        errorBuilder: (ctx, _, __) {
                          return Container(
                            height: height,
                            width: width,
                            padding: EdgeInsets.all(40),
                            child: SvgPicture.asset(
                              AppAssets.logo,
                              height: height,
                              width: width,
                              color: color,
                            ),
                          );
                        },
                      ),
  );
}
