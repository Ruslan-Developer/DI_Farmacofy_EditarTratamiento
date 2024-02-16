import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/BBDD/bbdd_medicamento_old.dart';
import 'package:farmacofy/inicioSesion/pantallaLogin.dart';
import 'package:farmacofy/models/tratamiento.dart';
import 'package:farmacofy/pages/page_editar_tratamiento.dart';
import 'package:farmacofy/pages/page_listado_usuarios.dart';
import 'package:farmacofy/pages/page_tratamiento.dart';
import 'package:farmacofy/presentacion/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListadoTratamientos extends StatefulWidget {
  const ListadoTratamientos({super.key});

  @override
  State<ListadoTratamientos> createState() => _ListadoTratamientosState();
}

class _ListadoTratamientosState extends State<ListadoTratamientos> {
  BaseDeDatos bdHelper = BaseDeDatos();

  @override
  Widget build(BuildContext context) {
    bool esAdmin = context.read<AdminProvider>().esAdmin;
    late int usuario;

    if (esAdmin) {
      usuario = context.read<IdUsuarioSeleccionado>().idUsuario;
    } else {
      usuario = context.read<IdSupervisor>().idUsuario;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tratamientos'),
        backgroundColor: const Color(0xFF02A724),
        flexibleSpace: Container(
          //Sirve para definir el color de la barra de estado
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF02A724),
                Color.fromARGB(255, 18, 240, 63),
                Color.fromARGB(255, 11, 134, 34),
              ],
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Acción para el botón de configuración
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: Stack(
        children: [
          FutureBuilder<List<Map<String, dynamic>>>(
            future: BaseDeDatos.consultarTratamientosConMedicamentosPorUsuario(
                usuario),
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Mientras espera la respuesta de la BD muestra un indicador de carga
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                if (snapshot.hasData) {
                  print('Número de registros: ${snapshot.data!.length}');
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        //Separacion entre las tarjetas
                        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                        child: ListTile(
                          //Imagen de assets del logo
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/farmacofy.jpg'),
                            radius:
                                22, // Ajusta el radio para cambiar el tamaño del círculo.
                          ),

                          // leading: CircleAvatar(
                          //   radius: 25,
                          //   backgroundImage: NetworkImage(
                          //       'https://www.stylist.co.uk/images/app/uploads/2022/06/01105352/jennifer-aniston-crop-1654077521-1390x1390.jpg?w=256&h=256&fit=max&auto=format%2Ccompress'),
                          // ),
                          title: Text(
                            snapshot.data![index]['condicionMedica'] ??
                                'Sin nombre del medicamento',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  text: 'Dosis: ',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .copyWith(fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${snapshot.data![index]['dosis']} tomas',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),

                              RichText(
                                text: TextSpan(
                                  text: 'Fecha de inicio: ',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .copyWith(fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${snapshot.data![index]['fechaInicio']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),

                              RichText(
                                text: TextSpan(
                                  text: 'Fecha de fin: ',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .copyWith(fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${snapshot.data![index]['fechaFin']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),

                              RichText(
                                text: TextSpan(
                                  text: 'Frecuencia: ',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .copyWith(fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${snapshot.data![index]['frecuencia']} veces al día',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),

                              RichText(
                                text: TextSpan(
                                  text: 'Via de administración: ',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .copyWith(fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${snapshot.data![index]['viaAdministracion']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                              
                              RichText(
                                text: TextSpan(
                                  text: 'Hora de inicio de toma: ',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .copyWith(fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${snapshot.data![index]['horaInicioToma']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),

                              RichText(
                                text: TextSpan(
                                  text: 'Cantidad total: ',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .copyWith(fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${snapshot.data![index]['cantidadTotalPastillas']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                              
                              RichText(
                                text: TextSpan(
                                  text: 'Cantidad mínima: ',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .copyWith(fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${snapshot.data![index]['cantidadMinima']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                              
                              RichText(
                                text: TextSpan(
                                  text: 'Descripción: ',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .copyWith(fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${snapshot.data![index]['descripcion']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),

                              RichText(
                                text: TextSpan(
                                  text: 'Medicamento: ',
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .copyWith(fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '${snapshot.data![index]['nombreMedicamento']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),

                              // Acordarse de poner: m.nombre as nombreMedicamento
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            // Pregunta si está seguro de eliminar el tratamiento
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Eliminar Tratamiento'),
                                    content: const Text(
                                        '¿Estás seguro de eliminar el tratamiento?'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Cancelar'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Aceptar'),
                                        onPressed: () {
                                          // Aquí va tu código para eliminar el medicamento de la base de datos
                                          BaseDeDatos.eliminarBD('Tratamiento',
                                              snapshot.data![index]['id']);
                                          // BaseDeDatos.eliminarBD('Medicamento', snapshot.data![index]['idMedicamento']);
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          onTap: () {
                            Tratamiento tratamientoSeleccionado = Tratamiento();
                            tratamientoSeleccionado.id =
                                snapshot.data![index]['id'];
                            Tratamiento tratamientoIdMedicamento =
                                Tratamiento();

                            tratamientoIdMedicamento.idMedicamento =
                                snapshot.data![index]['idMedicamento'];
                            Tratamiento tratamientoIdUsuario = Tratamiento();
                            tratamientoIdUsuario.idUsuario =
                                snapshot.data![index]['idUsuario'];
                            Tratamiento tratamientoCondicionMedica =
                                Tratamiento();

                            tratamientoCondicionMedica.condicionMedica =
                                snapshot.data![index]['condicionMedica'];
                            Tratamiento tratamientoDosis = Tratamiento();
                            tratamientoDosis.dosis =
                                snapshot.data![index]['dosis'];
                            Tratamiento tratamientoFrecuencia = Tratamiento();
                            tratamientoFrecuencia.frecuencia =
                                snapshot.data![index]['frecuencia'];
                            Tratamiento tratamientoViaAdministracion =
                                Tratamiento();

                            tratamientoViaAdministracion.viaAdministracion =
                                snapshot.data![index]['viaAdministracion'];
                            Tratamiento tratamientoFechaInicio = Tratamiento();
                            tratamientoFechaInicio.fechaInicio =
                                snapshot.data![index]['fechaInicio'];
                            // DateTime fechaInicio = DateTime.parse(snapshot.data![index]['fechaInicio']);
                            // tratamientoFechaInicio.fechaInicio = DateTime.parse(snapshot.data![index]['fechaInicio']);
                            Tratamiento tratamientoFechaFin = Tratamiento();
                            tratamientoFechaFin.fechaFin =
                                snapshot.data![index]['fechaFin'];
                            Tratamiento tratamientoHoraInicioToma =
                                Tratamiento();

                            tratamientoHoraInicioToma.horaInicioToma =
                                snapshot.data![index]['horaInicioToma'];
                            Tratamiento tratamientoCantidadTotalPastillas =
                                Tratamiento();

                            tratamientoCantidadTotalPastillas
                                    .cantidadTotalPastillas =
                                snapshot.data![index]['cantidadTotalPastillas'];
                            Tratamiento tratamientoCantidadMinima =
                                Tratamiento();

                            tratamientoCantidadMinima.cantidadMinima =
                                snapshot.data![index]['cantidadMinima'];
                            Tratamiento tratamientoDescripcion = Tratamiento();
                            tratamientoDescripcion.descripcion =
                                snapshot.data![index]['descripcion'];
                            // Tratamiento tratamientoRecordatorio = Tratamiento();
                            // tratamientoRecordatorio.recordatorio = snapshot.data![index]['recordatorio'];

                            // Acción al pulsar sobre la tarjeta nos lleva a la pantalla de edición
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditarTratamiento(
                                  tratamientoCondicionMedica:
                                      tratamientoCondicionMedica,
                                  tratamientoDosis: tratamientoDosis,
                                  tratamientoFrecuencia: tratamientoFrecuencia,
                                  tratamientoViaAdministracion:
                                      tratamientoViaAdministracion,
                                  tratamientoFechaInicio:
                                      tratamientoFechaInicio,
                                  tratamientoFechaFin: tratamientoFechaFin,
                                  tratamientoHoraInicioToma:
                                      tratamientoHoraInicioToma,
                                  tratamientoCantidadTotalPastillas:
                                      tratamientoCantidadTotalPastillas,
                                  tratamientoCantidadMinima:
                                      tratamientoCantidadMinima,
                                  tratamientoDescripcion:
                                      tratamientoDescripcion,
                                  //  tratamientoRecordatorio: tratamientoRecordatorio,
                                  tratamientoEditar: tratamientoSeleccionado,
                                  tratamientoIdMedicamento:
                                      tratamientoIdMedicamento,
                                  tratamientoIdUsuario: tratamientoIdUsuario,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No hay tratamientos'));
                }
              }
            },
          ),
        ],
      ),
      drawer: MenuDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            //Cambiar a pantalla de Formulario medicamento
            // MaterialPageRoute(builder: (context) => const Tratamientos1()),
            MaterialPageRoute(builder: (context) => const PaginaTratamiento()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF02A724),
      ),
    );
  }
}
