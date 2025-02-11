import 'package:flutter/material.dart';
import 'package:disclosure/disclosure.dart';
import 'package:gap/gap.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';
// import 'package:zepair/modules/Contact%20Page/Support%20Widgets/faqs_data.dart';

class FAQWidget extends StatefulWidget {
  const FAQWidget({super.key});

  @override
  State<FAQWidget> createState() => _FAQWidgetState();
}

class _FAQWidgetState extends State<FAQWidget> {
  final List<Map<String, String>> faqs = [
    {
      "question": "How to change Address?",
      "answer": "You can update it from settings."
    },
    {
      "question": "How to reset Password?",
      "answer": "Click on 'Forgot Password'."
    },
    {
      "question": "How to contact Support?",
      "answer": "Go to the 'Contact Us' section."
    },
    {
      "question": "How to delete my Account?",
      "answer": "You can request account deletion in settings."
    },
    {
      "question": "How to update Payment Method?",
      "answer": "Go to 'Payment Methods' under account settings."
    },
  ];

  late double w;
  late double h;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    w = size.width;
    h = size.height;
    return DisclosureGroup(
      multiple: false,
      clearable: true,
      children: List.generate(faqs.length, (i) {
        return Disclosure(
          key: ValueKey('disclosure-$i'),
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
                text: faqs[i]["question"]!,
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
              text: faqs[i]["answer"]!,
              size: 18,
              fontFamily: FontType.balooBhai2,
            ),
          ),
        );
      }),
    );
  }
}
