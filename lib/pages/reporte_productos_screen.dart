import 'package:eva2_flutter/models/ProductosReport.dart';
import 'package:eva2_flutter/models/proveedorReport.dart';
import 'package:eva2_flutter/providers/productos_provider.dart';
import 'package:eva2_flutter/providers/proveedores_provider.dart';
import 'package:eva2_flutter/views/sidebar_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReporteProductosScreen extends StatefulWidget {
  const ReporteProductosScreen({super.key});

  @override
  State<ReporteProductosScreen> createState() =>
      _ReporteProductosScreenState();
}

class _ReporteProductosScreenState extends State<ReporteProductosScreen> {
  @override
  Widget build(BuildContext context) {
    final productosProvider = Provider.of<ProductosProvider>(context);
    final List<ProductosReport> listaProductosReporte =
        productosProvider.listaProductosReport;

    List<charts.Series<ProductosReport, String>> serie = [
      charts.Series(
          id: 'Productos',
          data: listaProductosReporte,
          domainFn: (ProductosReport serie, _) => serie.id,
          measureFn: (ProductosReport serie, _) => serie.count,
          colorFn: (ProductosReport serie, _) =>
              charts.ColorUtil.fromDartColor(Colors.lightBlue))
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Reporte productos")),
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
                  Text("REPORTE DE PRODUCTOS - CATEGORIA"),
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
