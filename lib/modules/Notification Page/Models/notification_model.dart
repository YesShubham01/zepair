class NotificationModel {
  final String id;
  final String message;
  final DateTime receivedAt;
  final String actionText;
  final String actionRoute;

  NotificationModel({
    required this.id,
    required this.message,
    required this.receivedAt,
    required this.actionText,
    required this.actionRoute,
  });

  // Format received time to display as "Received at HH:MM"
  String getFormattedTime() {
    final hour = receivedAt.hour.toString().padLeft(2, '0');
    final minute = receivedAt.minute.toString().padLeft(2, '0');
    return 'Received at $hour:$minute';
  }
}
