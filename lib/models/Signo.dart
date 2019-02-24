class Signo {
  final String nombre, fechaSigno, amor, salud,dinero, color, numero;
  

  Signo({this.nombre, this.fechaSigno, this.amor, this.salud, this.dinero, this.color, this.numero});

  factory Signo.fromJson(dynamic json) {
    return Signo(
      nombre: json['nombre'] as String,
      fechaSigno: json['fechaSigno'] as String,
      amor: json['amor'] as String,
      salud: json['salud'] as String,
      dinero: json['dinero'] as String,
      color: json['color'] as String,
      numero: json['numero'] as String,
    );
  }
}
