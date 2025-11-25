import 'package:flutter/material.dart';

class ServicesListOptimized extends StatelessWidget {
  static const List<ServiceItem> services = [
    ServiceItem('Handyman', Icons.build, Color(0xFFDDE9FF)),
    ServiceItem('Cleaning', Icons.cleaning_services, Color(0xFFD6F6FF)),
    ServiceItem('Moving', Icons.local_shipping, Color(0xFFFFE1E6)),
    ServiceItem('Home Care', Icons.home, Color(0xFFE3F6D9)),
  ];

  const ServicesListOptimized({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              final service = services[index];
              return _ServiceCard(service: service);
            },
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServiceItem service;

  const _ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: service.bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(service.icon, size: 28, color: Colors.black54),
          ),
          const SizedBox(height: 10),
          Text(
            service.name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class ServiceItem {
  final String name;
  final IconData icon;
  final Color bgColor;

  const ServiceItem(this.name, this.icon, this.bgColor);
}
