enum BCRoutes {
  cardInfo,
  cardTemplate,
}

extension BCRoutesExtension on BCRoutes {
  String get route {
    switch(this) {
      case BCRoutes.cardInfo:
        return "/cardInfo";
      case BCRoutes.cardTemplate:
        return "/cardTemplate";
      default:
        return "/";
    }
  }
}