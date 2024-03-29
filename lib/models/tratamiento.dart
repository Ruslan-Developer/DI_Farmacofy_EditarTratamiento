class Tratamiento {
  int? _id;
  late String _condicionMedica;
  late int _dosis;
  late int _frecuencia;
  late String _viaAdministracion;
  late String _fechaInicio;
  late String _fechaFin;
  late String _descripcion;
  late int _recordatorio;
  late int _idMedicamento;
  late int _idUsuario; // Nuevo campo idUsuario
  late String _dia;
  late String _horaInicioToma;
  late int _cantidadTotalPastillas;
  late int _cantidadMinima;

  Tratamiento() {

    _condicionMedica = "";
    _dosis = 0;
    _frecuencia = 0;
    _viaAdministracion = "";
    _fechaInicio = "";
    // _fechaInicio = DateTime.now();
    _fechaFin = "";
    _descripcion = "";
    _recordatorio = 0;
    _idMedicamento = 0;
    _idUsuario = 0; // Inicializar el nuevo campo idUsuario
    // _dia = _fechaInicio.day.toString()+"/"+_fechaInicio.month.toString()+"/"+_fechaInicio.year.toString();
    //_horaInicioToma = "${this._fechaInicio.hour}:${this._fechaInicio.minute}";
    // _horaInicioToma = _fechaInicio.hour.toString()+":"+_fechaInicio.minute.toString();
    _horaInicioToma = "";
    _cantidadTotalPastillas = 0;
    _cantidadMinima = 0;
  }

  Tratamiento.withData(
      String condicionMedica,
      int dosis,
      int frecuencia,
      String viaAdministracion,
      String fechaInicio,
      String fechaFin,
      String descripcion,
      int recordatorio,
      int idMedicamento,
      int idUsuario,
      String dia,
      String horaInicioToma,
      int cantidadTotalPastillas,
      int cantidadMinima) {
    // Nuevo parámetro idUsuario
    _condicionMedica = condicionMedica;
    _dosis = dosis;
    _frecuencia = frecuencia;
    _viaAdministracion = viaAdministracion;
    _fechaInicio = fechaInicio;
    _fechaFin = fechaFin;
    _descripcion = descripcion;
    _recordatorio = recordatorio;
    _idMedicamento = idMedicamento;
    _idUsuario = idUsuario; // Asignar el nuevo campo idUsuario
    // _dia = _fechaInicio.day.toString()+"/"+_fechaInicio.month.toString()+"/"+_fechaInicio.year.toString();
    // _horaInicioToma = _fechaInicio.hour.toString()+":"+_fechaInicio.minute.toString();
    _horaInicioToma = horaInicioToma;
    _cantidadTotalPastillas = cantidadTotalPastillas;
    _cantidadMinima = cantidadMinima;
  }

  Tratamiento.withId(
      String condicionMedica,
      int id,
      int dosis,
      int frecuencia,
      String viaAdministracion,
      String fechaInicio,
      String fechaFin,
      String descripcion,
      int recordatorio,
      int idMedicamento,
      int idUsuario,
      String dia,
      String horaInicioToma,
      int cantidadTotalPastillas,
      int cantidadMinima) {
    // Nuevo parámetro idUsuario
    _id = id;
    _condicionMedica = condicionMedica;
    _dosis = dosis;
    _frecuencia = frecuencia;
    _viaAdministracion = viaAdministracion;
    _fechaInicio = fechaInicio;
    _fechaFin = fechaFin;
    _descripcion = descripcion;
    _recordatorio = recordatorio;
    _idMedicamento = idMedicamento;
    _idUsuario = idUsuario; // Asignar el nuevo campo idUsuario
    // _dia = _fechaInicio.day.toString()+"/"+_fechaInicio.month.toString()+"/"+_fechaInicio.year.toString();
    // _horaInicioToma = _fechaInicio.hour.toString()+":"+_fechaInicio.minute.toString();
    _horaInicioToma = horaInicioToma;
    _cantidadTotalPastillas = cantidadTotalPastillas;
    _cantidadMinima = cantidadMinima;
  }

    // Getters y setters

  int? get id => _id;
  String get condicionMedica => _condicionMedica;
  int get dosis => _dosis;
  int get frecuencia => _frecuencia;
  String get viaAdministracion => _viaAdministracion;
  String get fechaInicio => _fechaInicio;
  String get fechaFin => _fechaFin;
  String get descripcion => _descripcion;
  int get recordatorio => _recordatorio;
  int get idMedicamento => _idMedicamento;
  int get idUsuario => _idUsuario;
  // String get dia => _dia;
  String get horaInicioToma => _horaInicioToma;
  int get cantidadTotalPastillas => _cantidadTotalPastillas;
  int get cantidadMinima => _cantidadMinima;

  set id(int? id) {
    _id = id;
  }
  
  set condicionMedica(String condicionMedica) {
    _condicionMedica = condicionMedica;
  }
  
  set dosis(int dosis) {
    _dosis = dosis;
  }

  set frecuencia(int frecuencia) {
    _frecuencia = frecuencia;
  }

  set viaAdministracion(String viaAdministracion) {
    _viaAdministracion = viaAdministracion;
  }
  /// este setter está tomando una fecha y hora (DateTime) 
  /// y está dividiendo esa información en dos cadenas separadas: una para la fecha (_dia) y otra para la hora (_horaInicioToma).
  /// Esto es útil para mostrar la fecha y la hora por separado en la interfaz de usuario.
  

  // set fechaInicio(DateTime fechaInicio) {
  //   _dia = _fechaInicio.day.toString()+"/"+_fechaInicio.month.toString()+"/"+_fechaInicio.year.toString();
  //   _horaInicioToma = _fechaInicio.hour.toString()+":"+_fechaInicio.minute.toString();
  // } 

  set fechaInicio(String fechaInicio) {
    _fechaInicio = fechaInicio;
  }

  set fechaFin(String fechaFin) {
    _fechaFin = fechaFin;
  }

  set descripcion(String descripcion) {
    _descripcion = descripcion;
  }

  set recordatorio(int recordatorio) {
    _recordatorio = recordatorio;
  }

  set idMedicamento(int idMedicamento) {
    _idMedicamento = idMedicamento;
  }
  set idUsuario(int value) {
    _idUsuario = value;
  }

  // set dia(String dia) {
  //   _dia = dia;
  //   List<String> partes = dia.split("/");
  //   int dd = int.tryParse(partes[0])!;
  //   int mm = int.tryParse(partes[1])!;
  //   int yyyy = int.tryParse(partes[2])!;
  //   _fechaInicio = new DateTime(yyyy, mm, dd, _fechaInicio.hour, _fechaInicio.minute);
  // }

  set horaInicioToma(String horaInicioToma) {
    _horaInicioToma = horaInicioToma;
    // List<String> partes = horaInicioToma.split(":");
    // int horas = int.tryParse(partes[0])!;
    // int minutos = int.tryParse(partes[1])!;
    // _fechaInicio = new DateTime(_fechaInicio.year, _fechaInicio.month, _fechaInicio.day, horas, minutos);
  }

  set cantidadTotalPastillas(int cantidadTotalPastillas) {
    _cantidadTotalPastillas = cantidadTotalPastillas;
  }

  set cantidadMinima(int cantidadMinima) {
    _cantidadMinima = cantidadMinima;
  }

  // Ajustar el método toMap() para incluir el nuevo campo idUsuario
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null && id != 0) {
      map['id'] = _id;
    }
    map['condicionMedica'] = _condicionMedica;
    map['dosis'] = _dosis;
    map['frecuencia'] = _frecuencia;
    map['viaAdministracion'] = _viaAdministracion;
    map['fechaInicio'] = _fechaInicio;
    map['fechaFin'] = _fechaFin;
    map['descripcion'] = _descripcion;
    map['recordatorio'] = _recordatorio;
    map['idMedicamento'] = _idMedicamento;
    map['idUsuario'] = _idUsuario;

    map['horaInicioToma'] = _horaInicioToma;
    map['cantidadTotalPastillas'] = _cantidadTotalPastillas;
    map['cantidadMinima'] = _cantidadMinima;
    //map['horaInicioToma'] = _horaInicioToma.toIso8601String();
    return map;
  }

  /// Este tipo de constructor es muy útil cuando se trabaja con BBDD o APIs
  /// Los datos vienen en fomrato mapa o JSON y necesitan ser convertidos a objetos 
  
  Tratamiento.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _condicionMedica = map['condicionMedica'];
    _dosis = map['dosis'];
    _frecuencia = map['frecuencia'];
    _viaAdministracion = map['viaAdministracion'];
    // _fechaInicio = DateTime.parse(map['fechaInicio']); // Convertir la cadena a un objeto DateTime
    _fechaInicio = map['fechaInicio'];
    _fechaFin = map['fechaFin'];
    _descripcion = map['descripcion'];
    _recordatorio = map['recordatorio'];
    _idMedicamento = map['idMedicamento'];
    _idUsuario = map['idUsuario'];
    // _dia = _fechaInicio.day.toString()+"/"+_fechaInicio.month.toString()+"/"+_fechaInicio.year.toString();
    _horaInicioToma = map['horaInicioToma'];
    _cantidadTotalPastillas = map['cantidadTotalPastillas'];
    _cantidadMinima = map['cantidadMinima'];
    // No se si hay que incluir esta parte de código
    //_horaInicioToma = _fechaInicio.hour.toString()+":"+_fechaInicio.minute.toString(); 
  }
}


















// class Tratamiento {
//   int? _id;
//   late String _condicionMedica;
//   late int _dosis;
//   late int _frecuencia;
//   late String _viaAdministracion;
//   late String _fechaInicio;
//   late String _fechaFin;
//   late String _descripcion;
//   late int _recordatorio;
//   late int _idMedicamento;

//   Tratamiento(){
//     _condicionMedica = "";
//     _dosis = 0;
//     _frecuencia = 0;
//     _viaAdministracion = "";
//     _fechaInicio = "";
//     _fechaFin = "";
//     _descripcion = "";
//     _recordatorio = 0;
//     _idMedicamento = 0;
//   }

//   Tratamiento.withData(String condicionMedica, int dosis, int frecuencia, String viaAdministracion, String fechaInicio, String fechaFin, String descripcion, int recordatorio, int idMedicamento){
//     _condicionMedica = condicionMedica;
//     _dosis = dosis;
//     _frecuencia = frecuencia;
//     _viaAdministracion = viaAdministracion;
//     _fechaInicio = fechaInicio;
//     _fechaFin = fechaFin;
//     _descripcion = descripcion;
//     _recordatorio = recordatorio;
//     _idMedicamento = idMedicamento;
//   }

//   Tratamiento.withId(String condicionMedica, int id, int dosis, int frecuencia, String viaAdministracion, String fechaInicio, String fechaFin, String descripcion, int recordatorio, int idMedicamento){
//     _id = id;
//     _condicionMedica = condicionMedica;
//     _dosis = dosis;
//     _frecuencia = frecuencia;
//     _viaAdministracion = viaAdministracion;
//     _fechaInicio = fechaInicio;
//     _fechaFin = fechaFin;
//     _descripcion = descripcion;
//     _recordatorio = recordatorio;
//     _idMedicamento = idMedicamento;
//   }



//   // Convertir un objeto de tipo Tratamiento a un objeto de tipo Map

//   Map<String, dynamic> toMap(){
//     var map = new Map<String, dynamic>();
//     if(id != null && id != 0){
//       map['id'] = _id;
//     }
//     map['condicionMedica'] = _condicionMedica;
//     map['dosis'] = _dosis;
//     map['frecuencia'] = _frecuencia;
//     map['viaAdministracion'] = _viaAdministracion;
//     map['fechaInicio'] = _fechaInicio;
//     map['fechaFin'] = _fechaFin;
//     map['descripcion'] = _descripcion;
//     map['recordatorio'] = _recordatorio;
//     map['idMedicamento'] = _idMedicamento;
//     return map;
//   }

//   // Convertir un objeto Map a un objeto de tipo Tratamiento

//   Tratamiento.fromMapObject(Map<String, dynamic> map){
//     _id = map['id'];
//     _condicionMedica = map['condicionMedica'];
//     _dosis = map['dosis'];
//     _frecuencia = map['frecuencia'];
//     _viaAdministracion = map['viaAdministracion'];
//     _fechaInicio = map['fechaInicio'];
//     _fechaFin = map['fechaFin'];
//     _descripcion = map['descripcion'];
//     _recordatorio = map['recordatorio'];
//     _idMedicamento = map['idMedicamento'];
//   }



// }

