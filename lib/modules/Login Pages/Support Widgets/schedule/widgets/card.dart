import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  late double h;
  late double w;
  final String serviceName;
  final String amountPaid;
  final String description;
  final String status;
  final String? highlightedStatus; // Optional for highlighted text

   ServiceCard({
    Key? key,
    required this.serviceName,
    required this.amountPaid,
    required this.description,
    required this.status,
    this.highlightedStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var dimensions = MediaQuery.sizeOf(context);
    w = dimensions.width;
    h = dimensions.height;
    return Container(
      height: h*0.27,
      width: w*1.8,
      child: 
    Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.grey[200],
      
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: w*0.12,
                  height: h*0.06,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                  serviceName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
              "Amount Paid ₹ $amountPaid",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),



                  ],
                )
                
              ],
            ),
            
            
            const SizedBox(height: 4),
            Text(
              "· $description",
              style: const TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 3, color: Colors.grey),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  const TextSpan(text: "Status: "),
                  TextSpan(
                    text: status,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                  if (highlightedStatus != null) ...[
                    const TextSpan(text: " "),
                    TextSpan(
                      text: highlightedStatus,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.brown),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
