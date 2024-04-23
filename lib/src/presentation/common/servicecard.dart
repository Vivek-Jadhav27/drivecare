import 'package:drivecare/src/data/models/service.dart';
import 'package:drivecare/src/presentation/customer/customer_cart.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final Service service; // Store the service object passed in

  const ServiceCard({super.key, required this.service});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(10),
      child: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: widget.service.imageURL.isNotEmpty
                    ? Image.network(
                        widget.service.imageURL,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Image.asset(
                          'assets/images/service_image_placeholder.png', // Placeholder image if load fails
                          fit: BoxFit.cover,
                        ),
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      )
                    : Image.asset(
                        'assets/images/service_image_placeholder.png', // Placeholder if no URL
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.service.serviceName, // Dynamic service name
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$${widget.service.price.toStringAsFixed(2)}", // Dynamic price
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.service.description, // Dynamic description
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                // Action to book the service
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  CartPage(service: widget.service)));
              },
              child: const Text(
                "Book Now",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.orange,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
