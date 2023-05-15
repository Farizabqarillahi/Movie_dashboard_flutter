import 'package:flutter/material.dart';

class Merchant {
  final int id;
  final String name;
  final String logoUrl;

  const Merchant({
    required this.id,
    required this.name,
    required this.logoUrl,
  });

  static fromJson(Map<String, dynamic> merchant) {}
}

class Merchants {
  static final List<Merchant> list = [
    const Merchant(
      id: 1,
      name: 'XXI',
      logoUrl: 'https://www.21cineplex.com/commons/images/xxi-logo.png',
    ),
    const Merchant(
      id: 2,
      name: 'CGV',
      logoUrl:
          'https://www.thinkincstrategy.com/wp-content/uploads/2019/03/CGV-Cinemas-Logo.jpg',
    ),
    const Merchant(
      id: 3,
      name: 'Cinepolis',
      logoUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Cin%C3%A9polis_logo.svg/1280px-Cin%C3%A9polis_logo.svg.png',
    ),
  ];
}
