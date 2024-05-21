import 'package:flutter/material.dart';

class StatisticsScreens extends StatelessWidget {
  const StatisticsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "Statistics",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white,fontWeight: FontWeight.w800,letterSpacing: 1),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,size: 26,color: Colors.white,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const Text("Vehicle Population",style: TextStyle(color: Color(0xFF124DAC),fontSize: 20,fontWeight: FontWeight.w600),),
              const Divider(thickness: 2,),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text("Showing  details of Vehicle Population as on for the years 1999-00 to 2011-12",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              ),
              Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {
                  0:FixedColumnWidth(43),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400
                    ),
                    children: const [
                      Center(child: Text("Sr.\nNo",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                      Center(child: Text("Year",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                      Center(child: Text("Transport\nVehicles",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                      Center(child: Text("Non\nTransport\nVehicles",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                      Center(child: Text("Total",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                    ]
                  ),
                  const TableRow(
                    children: [
                      Center(child: Text("1")),
                      Center(child: Text("2000-\n2001")),
                      Center(child: Text("862509")),
                      Center(child: Text("4568569")),
                      Center(child: Text("5431078")),
                    ]
                  ),
                  const TableRow(
                    children: [
                      Center(child: Text("2")),
                      Center(child: Text("2002-\n2003")),
                      Center(child: Text("568945")),
                      Center(child: Text("3486578")),
                      Center(child: Text("4055523")),
                    ]
                  ),
                  const TableRow(
                    children: [
                      Center(child: Text("3")),
                      Center(child: Text("2002-\n2003")),
                      Center(child: Text("962509")),
                      Center(child: Text("8568569")),
                      Center(child: Text("9531078")),
                    ]
                  ),
                  const TableRow(
                    children: [
                      Center(child: Text("4")),
                      Center(child: Text("2003-\n2004")),
                      Center(child: Text("685245")),
                      Center(child: Text("8695465")),
                      Center(child: Text("9380710")),
                    ]
                  ),
                  const TableRow(
                    children: [
                      Center(child: Text("5")),
                      Center(child: Text("2004-\n2005")),
                      Center(child: Text("456859")),
                      Center(child: Text("7586216")),
                      Center(child: Text("8043075")),
                    ]
                  ),
                  const TableRow(
                    children: [
                      Center(child: Text("6")),
                      Center(child: Text("2005-\n2006")),
                      Center(child: Text("862509")),
                      Center(child: Text("4568569")),
                      Center(child: Text("5431078")),
                    ]
                  ),
                  const TableRow(
                    children: [
                      Center(child: Text("7")),
                      Center(child: Text("2007-\n2008")),
                      Center(child: Text("685245")),
                      Center(child: Text("8695465")),
                      Center(child: Text("9380710")),
                    ]
                  ),
                ],
              ),
            ],),
          ),
        ),
      ),
    );
  }
}
