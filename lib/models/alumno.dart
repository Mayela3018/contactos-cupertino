class Alumno {
  final int id;
  final String nombre;
  final String apellido;
  final String codigo;
  final String carrera;
  final String ciclo;
  final String email;
  final String telefono;
  final double promedio;

  Alumno({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.codigo,
    required this.carrera,
    required this.ciclo,
    required this.email,
    required this.telefono,
    required this.promedio,
  });

  String get nombreCompleto => '$nombre $apellido';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'codigo': codigo,
      'carrera': carrera,
      'ciclo': ciclo,
      'email': email,
      'telefono': telefono,
      'promedio': promedio,
    };
  }

  factory Alumno.fromMap(Map<String, dynamic> map) {
    return Alumno(
      id: map['id'],
      nombre: map['nombre'],
      apellido: map['apellido'],
      codigo: map['codigo'],
      carrera: map['carrera'],
      ciclo: map['ciclo'],
      email: map['email'],
      telefono: map['telefono'],
      promedio: map['promedio'],
    );
  }
}