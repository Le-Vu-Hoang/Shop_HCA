DateTime? parseIsoStringToDateTime(String? isoString) {
  if (isoString == null || isoString.isEmpty) return null;
  try {
    return DateTime.parse(isoString).toLocal(); // Chuyển về giờ local nếu cần
  } catch (e) {
    return null;
  }
}