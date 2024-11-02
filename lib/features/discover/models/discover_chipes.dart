class DiscoverChips {
  final String icon;
  final String description;
  DiscoverChips({
    required this.icon,
    required this.description,
  });
}

class ChipList {
  static final List<DiscoverChips> discoverChips = [
    DiscoverChips(icon: '🚀', description: 'Trends'),
    DiscoverChips(icon: '💹', description: 'Stocks'),
    DiscoverChips(icon: '🪙', description: 'Crypto'),
    DiscoverChips(icon: '💱', description: 'Currencies'),
  ];
}
