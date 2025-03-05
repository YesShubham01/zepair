import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disclosure/disclosure.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
import '../../../backend/faq_service.dart';
import '../../../models/faq_model.dart';


class FAQWidget extends StatefulWidget {
  const FAQWidget({super.key});

  @override
  State<FAQWidget> createState() => _FAQWidgetState();
}

class _FAQWidgetState extends State<FAQWidget> {
  late double w;
  late double h;
  late Future<List<FAQ>> faqFuture;

  @override
  void initState() {
    super.initState();
    faqFuture = FAQService().fetchFAQs();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    w = size.width;
    h = size.height;

    return FutureBuilder<List<FAQ>>(
      future: faqFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No FAQs available"));
        }

        List<FAQ> faqs = snapshot.data!;

        return DisclosureGroup(
          multiple: false,
          clearable: true,
          children: faqs.map((faq) {
            return Disclosure(
              key: ValueKey('disclosure-${faq.id}'),
              wrapper: (state, child) {
                return Card.outlined(
                  color: state.closed
                      ? const Color.fromARGB(100, 241, 237, 237)
                      : const Color.fromARGB(95, 244, 218, 195),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: state.closed
                          ? Colors.black26
                          : const Color.fromARGB(99, 240, 139, 44),
                      width: state.closed ? 1 : 2,
                    ),
                  ),
                  child: child,
                );
              },
              header: DisclosureButton(
                child: ListTile(
                  minVerticalPadding: 5,
                  minTileHeight: 45,
                  title: CustomText(
                    text: faq.question, // ✅ Show Firestore key (Question)
                    size: 18,
                    fontFamily: FontType.balooBhai2,
                  ),
                  trailing: const DisclosureIcon(),
                ),
              ),
              divider: const Divider(height: 1),
              child: Padding(
                padding: EdgeInsets.all(w * 0.03),
                child: CustomText(
                  text: faq.answer, // ✅ Show Firestore value (Answer)
                  size: 18,
                  fontFamily: FontType.balooBhai2,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
