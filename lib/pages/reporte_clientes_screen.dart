import 'package:eva2_flutter/models/clientesReport.dart';
import 'package:eva2_flutter/models/proveedorReport.dart';
import 'package:eva2_flutter/providers/client_provider.dart';
import 'package:eva2_flutter/providers/proveedores_provider.dart';
import 'package:eva2_flutter/views/sidebar_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReporteClientesScreen extends StatefulWidget {
  const ReporteClientesScreen({super.key});

  @override
  State<ReporteClientesScreen> createState() =>
      _ReporteClientesScreenState();
}

class _ReporteClientesScreenState extends State<ReporteClientesScreen> {
  @override
  Widget build(BuildContext context) {
    final clientesProvider = Provider.of<ClientesProvider>(context);
    final List<ClientesReport> listaClientesReporte =
        clientesProvider.listaClientesReport;

    List<charts.Series<ClientesReport, String>> serie = [
      charts.Series(
          id: 'Clientes',
          data: listaClientesReporte,
          domainFn: (ClientesReport serie, _) => serie.id,
          measureFn: (ClientesReport serie, _) => serie.count,
          colorFn: (ClientesReport serie, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Reporte Clientes")),
      drawer: SidebarMenu(),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("REPORTE DE Clientes - CATEGORIA"),
                  Expanded(
                      child: charts.BarChart(
                    serie,
                    animate: true,
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
