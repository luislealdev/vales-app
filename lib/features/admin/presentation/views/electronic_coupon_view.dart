import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vales_app/features/shared/shared.dart';

class ElectronicCouponView extends StatefulWidget {
  const ElectronicCouponView({super.key});

  @override
  ElectronicCouponViewState createState() => ElectronicCouponViewState();
}

class ElectronicCouponViewState extends State<ElectronicCouponView> {
  List<Coupon> coupons = [];
  List<Coupon> filteredCoupons = [];
  String searchQuery = '';
  bool isLoading = true;

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _fetchCoupons();
  }

  Future<void> _fetchCoupons() async {
    // Simulación de la llamada a la base de datos
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() {
      coupons = [
        Coupon(
          id: '123456',
          cliente: 'Martha Araceli',
          tipo: 'Calzado \$5000',
          fecha: '2024-05-20',
          telefono: '4611725634',
        ),
        Coupon(
          id: '654321',
          cliente: 'Juan Perez',
          tipo: 'Ropa \$3000',
          fecha: '2024-04-15',
          telefono: '4611725635',
        ),
        // Agrega más cupones aquí
      ];
      filteredCoupons = List.from(coupons);
      _sortCouponsByDate();
      isLoading = false;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      searchQuery = query;
      filteredCoupons = coupons.where((coupon) {
        return coupon.cliente.toLowerCase().contains(query.toLowerCase()) ||
            coupon.id.toLowerCase().contains(query.toLowerCase());
      }).toList();
      _sortCouponsByDate();
    });
  }

  void _sortCouponsByDate() {
    filteredCoupons.sort((a, b) {
      return DateTime.parse(b.fecha).compareTo(DateTime.parse(a.fecha));
    });
  }

  void _showAddCouponDialog() {
    final TextEditingController idController = TextEditingController();
    final TextEditingController clienteController = TextEditingController();
    final TextEditingController tipoController = TextEditingController();
    final TextEditingController fechaController = TextEditingController();
    final TextEditingController telefonoController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (!mounted) return const SizedBox.shrink();
        return AlertDialog(
          title: const Text('Agregar Cupón'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(labelText: 'Id'),
                ),
                TextField(
                  controller: clienteController,
                  decoration: const InputDecoration(labelText: 'Cliente'),
                ),
                TextField(
                  controller: tipoController,
                  decoration: const InputDecoration(labelText: 'Tipo'),
                ),
                TextField(
                  controller: fechaController,
                  decoration:
                      const InputDecoration(labelText: 'Fecha (YYYY-MM-DD)'),
                ),
                TextField(
                  controller: telefonoController,
                  decoration: const InputDecoration(labelText: 'Teléfono'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  coupons.add(Coupon(
                    id: idController.text,
                    cliente: clienteController.text,
                    tipo: tipoController.text,
                    fecha: fechaController.text,
                    telefono: telefonoController.text,
                  ));
                  filteredCoupons = List.from(coupons);
                  _sortCouponsByDate();
                });
                Navigator.of(context).pop();
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      focusNode: _focusNode,
                      decoration: const InputDecoration(
                        labelText: 'Búsqueda',
                        hintText: 'Búsqueda',
                      ),
                      onChanged: _onSearchChanged,
                    ),
                  ),
                  IconButton(
                    onPressed: _showAddCouponDialog,
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
              const SizedBox(height: 25),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : filteredCoupons.isEmpty
                      ? const Center(
                          child: Column(
                            children: [
                              Icon(Icons.search_off, size: 50),
                              Text('No hay resultados'),
                            ],
                          ),
                        )
                      : Column(
                          children: filteredCoupons
                              .map((coupon) => _CouponInfo(coupon: coupon))
                              .toList(),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CouponInfo extends StatelessWidget {
  final Coupon coupon;

  const _CouponInfo({required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WhiteCard(
          child: Row(
            children: [
              const Icon(Icons.receipt, size: 35),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FormattedText(description: 'Id', text: coupon.id),
                    _FormattedText(
                        description: 'Cliente', text: coupon.cliente),
                    _FormattedText(description: 'Tipo', text: coupon.tipo),
                    _FormattedText(
                        description: 'Fecha',
                        text: DateFormat('dd/MM/yyyy')
                            .format(DateTime.parse(coupon.fecha))),
                    _FormattedText(
                        description: 'Teléfono', text: coupon.telefono),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}

class _FormattedText extends StatelessWidget {
  final String description;
  final String text;

  const _FormattedText({required this.description, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(
              text: '$description: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: text),
          ],
        ),
      ),
    );
  }
}

class Coupon {
  final String id;
  final String cliente;
  final String tipo;
  final String fecha;
  final String telefono;

  Coupon({
    required this.id,
    required this.cliente,
    required this.tipo,
    required this.fecha,
    required this.telefono,
  });
}
