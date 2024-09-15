import 'package:appmobile/controller/holiday_controller.dart';
import 'package:appmobile/model/holiday_model.dart';
import 'package:appmobile/view/menu.dart';
import 'package:flutter/material.dart';

class HolidayPage extends StatefulWidget {
  const HolidayPage({super.key});

  @override
  State<HolidayPage> createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> {
  //Instanciando o controller
  HolidayController controller = HolidayController();

  //Lista Future que vai receber os dados da API
  late Future<List<HolidayEntity>> _futureHolidays;

  //Função para preencher a lista com os dados da API
  Future<List<HolidayEntity>> getHolidays() async {
    return await controller.getHolidayList();
  }

  @override
  void initState() {
    super.initState();
    _futureHolidays = getHolidays();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text("Feriados"),
      ),
      body: FutureBuilder(
        future: _futureHolidays,
        builder: (context, AsyncSnapshot<List<HolidayEntity>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title:
                          Text(snapshot.data![index].name ?? "Não informado"),
                      subtitle: Text(controller.dateFormatStringPtBR(snapshot.data![index].date ?? "Não informado") ),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
