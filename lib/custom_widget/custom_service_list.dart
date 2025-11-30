import 'package:flutter/material.dart';

class ServicesListOptimized extends StatelessWidget {
  final List<ServiceItem> services;
  final Function(ServiceItem)? onServiceTap;

  const ServicesListOptimized({
    super.key,
    required this.services,
    this.onServiceTap,
  });

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
              return _ServiceCard(
                service: service,
                onTap: onServiceTap != null
                    ? () => onServiceTap!(service)
                    : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServiceItem service;
  final VoidCallback? onTap;

  const _ServiceCard({required this.service, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blue.withOpacity(0.1),
        highlightColor: Colors.blue.withOpacity(0.05),
        child: Container(
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
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
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
