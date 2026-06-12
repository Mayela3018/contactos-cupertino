import '../models/alumno.dart';

List<Map<String, dynamic>> alumnosData = [
  {
    'id': 1,
    'nombre': 'Mayela',
    'apellido': 'Ticona',
    'codigo': 'T20210001',
    'carrera': 'Desarrollo de Software',
    'ciclo': '5to',
    'email': 'mayela.ticona@tecsup.edu.pe',
    'telefono': '987-654-321',
    'promedio': 17.5,
  },
  {
    'id': 2,
    'nombre': 'Milagros',
    'apellido': 'Ramos',
    'codigo': 'T20210002',
    'carrera': 'Desarrollo de Software',
    'ciclo': '5to',
    'email': 'milagros.ramos@tecsup.edu.pe',
    'telefono': '912-345-678',
    'promedio': 18.2,
  },
  {
    'id': 3,
    'nombre': 'Carlos',
    'apellido': 'Mendoza',
    'codigo': 'T20210003',
    'carrera': 'Redes y Comunicaciones',
    'ciclo': '4to',
    'email': 'carlos.mendoza@tecsup.edu.pe',
    'telefono': '945-123-456',
    'promedio': 15.8,
  },
  {
    'id': 4,
    'nombre': 'Lucía',
    'apellido': 'García',
    'codigo': 'T20210004',
    'carrera': 'Electrónica',
    'ciclo': '3ro',
    'email': 'lucia.garcia@tecsup.edu.pe',
    'telefono': '976-543-210',
    'promedio': 16.4,
  },
  {
    'id': 5,
    'nombre': 'Diego',
    'apellido': 'Torres',
    'codigo': 'T20210005',
    'carrera': 'Desarrollo de Software',
    'ciclo': '6to',
    'email': 'diego.torres@tecsup.edu.pe',
    'telefono': '934-567-890',
    'promedio': 14.9,
  },
];

List<Map<String, String>> faqData = [
  {
    'pregunta': '¿Cómo puedo registrar un nuevo alumno?',
    'respuesta': 'Desde el Menú Principal, toca "Registrar Alumno" y completa el formulario.',
  },
  {
    'pregunta': '¿Cómo veo la lista de alumnos?',
    'respuesta': 'En el Menú Principal, selecciona "Listar Alumnos".',
  },
  {
    'pregunta': '¿Puedo editar los datos de un alumno?',
    'respuesta': 'Ingresa a la lista, toca el alumno y selecciona "Editar".',
  },
  {
    'pregunta': '¿Cómo elimino un alumno?',
    'respuesta': 'Entra al detalle del alumno y toca el ícono de basura.',
  },
  {
    'pregunta': '¿Qué carreras están disponibles?',
    'respuesta': 'Desarrollo de Software, Redes, Electrónica, Mecatrónica y Administración.',
  },
  {
    'pregunta': '¿Cómo cierro sesión?',
    'respuesta': 'En el Menú Principal toca el botón "Cerrar Sesión".',
  },
];

List<Alumno> getAlumnos() {
  return alumnosData.map((data) => Alumno.fromMap(data)).toList();
}