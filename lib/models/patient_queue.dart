class PatientQueueFields {
  static const String patientNumber = 'patientNumber'; 
  static const String queueTicket = 'queue_ticket';   
  static const String status = 'status';                        
}


class PatientQueue {
  static String tableName = 'patientQueue';

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
      PatientQueueFields.patientNumber: patientNumber,
      PatientQueueFields.queueTicket: queueTicket,
      PatientQueueFields.status: status,
    };
  }

  factory PatientQueue.fromJson(Map<String, dynamic> json) {
    return PatientQueue(
      patientNumber: json[PatientQueueFields.patientNumber] as int,
      queueTicket: json[PatientQueueFields.queueTicket] as int,
      status: json[PatientQueueFields.status] as String,
    );
  }
}
