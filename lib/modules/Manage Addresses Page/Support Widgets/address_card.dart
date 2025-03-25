import 'package:flutter/material.dart';
import 'package:zepair/backend/user_detail_backend_service.dart';
import 'package:zepair/models/user_detail_model.dart';
import 'package:zepair/modules/Add%20New%20Address%20Page/add_new_address.dart';
import 'package:zepair/utils/custom%20widgets/custom_outline_card_widget.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class AddressCard extends StatefulWidget {
  final AddressModel address;
  final bool isSelected;

  const AddressCard({
    super.key,
    required this.address,
    this.isSelected = false,
  });

  @override
  _AddressCardState createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      color: widget.isSelected ? Colors.grey[300] : Colors.white,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.address.type,
                  size: 20,
                  weight: FontWeight.w500,
                  fontFamily: FontType.sfPro,
                ),
                GestureDetector(
                  onTapDown: (details) =>
                      _showPopupMenu(context, details, widget.address),
                  child: const Icon(Icons.more_vert, color: Colors.black),
                ),
              ],
            ),
            CustomText(
              text: widget.address.address,
              size: 16,
              weight: FontWeight.w400,
              fontFamily: FontType.balooBhai2,
            ),
            const SizedBox(height: 4),
            CustomText(
              text: "${widget.address.name}, ${widget.address.phone}",
              size: 16,
              weight: FontWeight.w600,
              color: Colors.grey,
              fontFamily: FontType.balooBhai2,
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Delete  function for deleting address
  void _deleteAddress() async {
    bool success = await UserService().deleteUserAddress(
      widget.address.address, // Pass the current address to delete
    );

    if (success) {
      print("Address deleted successfully.");
    } else {
      print("Failed to delete address.");
    }
  }

  // ✅ Edit function to edit address and save
  void _editAddress(AddressModel address) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewAddressPage(address: address),
      ),
    );
  }

  // ✅ edit and delete button
  void _showPopupMenu(
      BuildContext context, TapDownDetails details, AddressModel address) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx - 101, // Adjust X position to fit inside
        details.globalPosition.dy - 10, // Adjust Y position
        details.globalPosition.dx + 50,
        details.globalPosition.dy + 70, // Lowered height
      ),
      constraints: const BoxConstraints(
        minWidth: 110, // Slightly reduced width for neatness
        maxWidth: 120,
        minHeight: 50, // Compact height
        maxHeight: 70,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      items: [
        const PopupMenuItem(
          value: 'edit',
          height: 30, // Manually controlling height
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.edit, color: Colors.orange, size: 16),
              SizedBox(width: 8),
              CustomText(
                text: "Edit",
                fontFamily: FontType.balsamiqSans,
                size: 13,
              ),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'delete',
          height: 30, // Same height as "Edit"
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.delete, color: Colors.orange, size: 16),
              SizedBox(width: 8),
              CustomText(
                text: "Delete",
                fontFamily: FontType.balsamiqSans,
                size: 13,
              ),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value == 'edit') {
        _editAddress(address);
      } else if (value == 'delete') {
        _deleteAddress();
      }
    });
  }
}
