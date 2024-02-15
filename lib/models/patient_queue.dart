class QueueFields {
  static const String patientNumber = 'patientNumber';
  static const String queueTicket = 'queue_ticket';
  static const String status = 'status';
}

class PatientQueue {
  static String tableName = 'queue';

  final int patientNumber;
  final int? queueTicket;
  final String? status;

  const PatientQueue({
    required this.patientNumber,
    this.queueTicket,
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      QueueFields.patientNumber: patientNumber,
      QueueFields.queueTicket: queueTicket,
      QueueFields.status: status,
    };
  }

  factory PatientQueue.fromJson(Map<String, dynamic> json) {
    return PatientQueue(
      patientNumber: json[QueueFields.patientNumber] as int,
      queueTicket: json[QueueFields.queueTicket] as int,
      status: json[QueueFields.status] as String,
    );
  }
}
