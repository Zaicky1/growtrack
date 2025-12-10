import 'package:flutter/material.dart';

enum AvatarSize { small, medium, large, extraLarge }

enum AvatarType { image, initials, icon, placeholder }

class AvatarViewModel {
  final AvatarSize size;
  final AvatarType type;
  final String? imageUrl;
  final String? initials;
  final IconData? icon;
  final String? name;
  final bool showStatus;
  final bool isOnline;
  final Color? backgroundColor;

  AvatarViewModel({
    required this.size,
    required this.type,
    this.imageUrl,
    this.initials,
    this.icon,
    this.name,
    this.showStatus = false,
    this.isOnline = false,
    this.backgroundColor,
  });
}
