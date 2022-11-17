import 'package:eva2_flutter/models/proveedorReport.dart';
import 'package:eva2_flutter/providers/proveedores_provider.dart';
import 'package:eva2_flutter/views/sidebar_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReporteProveedoresScreen extends StatefulWidget {
  const ReporteProveedoresScreen({super.key});

  @override
  State<ReporteProveedoresScreen> createState() =>
      _ReporteProveedoresScreenState();
}

class _ReporteProveedoresScreenState extends State<ReporteProveedoresScreen> {
  @override
  Widget build(BuildContext context) {
    final proveedoresProvider = Provider.of<ProveedoresProvider>(context);
    final List<ProveedoresReport> listaProveedoresReporte =
        proveedoresProvider.listaProveedoresReport;

    List<charts.Series<ProveedoresReport, String>> serie = [
      charts.Series(
          id: 'Proveedor',
          data: listaProveedoresReporte,
          domainFn: (ProveedoresReport serie, _) => serie.id,
          measureFn: (ProveedoresReport serie, _) => serie.count,
          colorFn: (ProveedoresReport serie, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Reporte Proveedores")),
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
                  Text("REPORTE DE PROVEEDORES - CATEGORIA"),
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
