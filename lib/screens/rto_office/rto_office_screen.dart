import 'package:flutter/material.dart';

class RTOOfficeScreens extends StatelessWidget {
  const RTOOfficeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> rtoOffice = [
      {
        'cityCode': 'GJ01',
        'state': 'Gujarat',
        'city': 'Ahmedabad',
        'location': 'Subhash Bridge, Sabarmati, Ahmedabad, Gujarat - 380027',
        'link': 'https://cot.gujarat.gov.in/rto-ahmedabad.htm',
        'call': '+91-79-27559696',
      },
      {
        'cityCode': 'GJ02',
        'state': 'Gujarat',
        'city': 'Mehsana',
        'location':
            'Near Khari Nadi, Palavasna Highway, Mahesana, Gujarat - 384002',
        'link': 'https://cot.gujarat.gov.in/rto-ahmedabad.htm',
        'call': '+91-2762-226947',
      },
      {
        'cityCode': 'GJ03',
        'state': 'Gujarat',
        'city': 'Rajkot',
        'location': 'Near Market Yard, Rajkot, Gujarat - 360001',
        'link': 'https://cot.gujarat.gov.in/rto-ahmedabad.htm',
        'call': '+91-281-2703366',
      },
      {
        'cityCode': 'GJ04',
        'state': 'Gujarat',
        'city': 'Bhavnagar',
        'location': 'Dhanechi Vadla, Bhavnagar, Gujarat - 364003',
        'link': 'https://cot.gujarat.gov.in/rto-ahmedabad.htm',
        'call': '+91-278-2424004',
      },
      {
        'cityCode': 'GJ05',
        'state': 'Gujarat',
        'city': 'Surat',
        'location': 'Ring Road, Nanpura, Surat, Gujarat - 385001',
        'link': 'https://cot.gujarat.gov.in/rto-ahmedabad.htm',
        'call': '+91-261-2464902',
      },
      {
        'cityCode': 'GJ06',
        'state': 'Gujarat',
        'city': 'Vadodara',
        'location': 'Near Varasiya Road, Vadodra, Gujarat - 390006',
        'link': 'https://cot.gujarat.gov.in/rto-ahmedabad.htm',
        'call': '+91-265-2561130',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "RTO/ARTO Offices",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 1),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 26,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: rtoOffice.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                            color: const Color(0xFF124DAC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            rtoOffice[index]['cityCode'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          )),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "${rtoOffice[index]['state']} | ${rtoOffice[index]['city']}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3,),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(width: 3,),
                        Expanded(child: Text(rtoOffice[index]['location'])),
                      ],
                    ),
                    const SizedBox(height: 3,),
                    Row(
                      children: [
                        const Icon(Icons.link),
                        const SizedBox(width: 3,),
                        Expanded(child: Text(rtoOffice[index]['link'])),
                      ],
                    ),
                    const SizedBox(height: 3,),
                    Row(
                      children: [
                        const Icon(Icons.call),
                        const SizedBox(width: 3,),
                        Expanded(child: Text(rtoOffice[index]['call'])),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
