// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'bp_reading.dart';

class BPReadingAdapter extends TypeAdapter<BPReading> {
  @override
  final int typeId = 0;

  @override
  BPReading read(BinaryReader reader) {
    return BPReading(
      id: reader.readString(),
      systolic: reader.readInt(),
      diastolic: reader.readInt(),
      pulse: reader.readInt(),
      recordedAt: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
      notes: reader.readString(),
      position: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, BPReading obj) {
    writer.writeString(obj.id);
    writer.writeInt(obj.systolic);
    writer.writeInt(obj.diastolic);
    writer.writeInt(obj.pulse);
    writer.writeInt(obj.recordedAt.millisecondsSinceEpoch);
    writer.writeString(obj.notes ?? "");
    writer.writeString(obj.position ?? "");
  }
}