import 'package:flutter/material.dart';
// import 'package:vocab/Components/constant.dart';
import 'tabledata.dart' as tab;



 const kTableNombres = <tab.DataColumn>[
       tab.DataColumn(
    label: const Text('#'),
  ),
   tab.DataColumn(
    label: const Text('Nombres'),
  ),
   tab.DataColumn(
    label: const Text('Números'),
  ),
  ];

   
listNombres(size) {

return
   [ 
      tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Container(width: size,child: Row(
            children: <Widget>[
              Text('1',),
            ],
          ))),
          tab.DataCell( Container(width: size,child: Text('Un', ), ),),
          tab.DataCell( Container(width: size,child: Text('Um', ))),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('2', )),
          tab.DataCell(Text('Deux',)),
          tab.DataCell(Text('Dois', )),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('3')),
          tab.DataCell(Text('Trois')),
          tab.DataCell(Text('Três')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('4')),
          tab.DataCell(Text('Quatre')),
          tab.DataCell(Text('Quatro')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('5')),
          tab.DataCell(Text('Cinq')),
          tab.DataCell(Text('Cinco')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('6')),
          tab.DataCell(Text('Six')),
          tab.DataCell(Text('Seis')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('7')),
          tab.DataCell(Text('Sept')),
          tab.DataCell(Text('Sete')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('8')),
          tab.DataCell(Text('Huit')),
          tab.DataCell(Text('Oito')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('9')),
          tab.DataCell(Text('Neuf')),
          tab.DataCell(Text('Nove')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('10')),
          tab.DataCell(Text('Dix')),
          tab.DataCell(Text('Dez')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('11')),
          tab.DataCell(Text('Onze')),
          tab.DataCell(Text('Onze')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('12')),
          tab.DataCell(Text('Douze')),
          tab.DataCell(Text('Doze')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('13')),
          tab.DataCell(Text('Treize')),
          tab.DataCell(Text('Treze')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('14')),
          tab.DataCell(Text('Quatorze')),
          tab.DataCell(Text('Catorze')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('15')),
          tab.DataCell(Text('Quinze')),
          tab.DataCell(Text('Quinze')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('16')),
          tab.DataCell(Text('Seize')),
          tab.DataCell(Text('Dezasseis')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('17')),
          tab.DataCell(Text('Dix-sept')),
          tab.DataCell(Text('Dezassete')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('18')),
          tab.DataCell(Text('Dix-huit')),
          tab.DataCell(Text('Dezoito')),
        ],),
       
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('19')),
          tab.DataCell(Text('Dix-Neuf')),
          tab.DataCell(Text('Dezanove')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('20')),
          tab.DataCell(Text('Vingt')),
          tab.DataCell(Text('Vinte')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('21')),
          tab.DataCell(Text('Vingt-et-un')),
          tab.DataCell(Text('Vinte-e-um')),
          
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('21')),
          tab.DataCell(Text('Vingt-deux')),
          tab.DataCell(Text('Vinte-e-dois')),
          
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('30')),
          tab.DataCell(Text('Trente')),
          tab.DataCell(Text('Trinta')),
          
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('40')),
          tab.DataCell(Text('Quarante')),
          tab.DataCell(Text('Quarenta')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('50')),
          tab.DataCell(Text('Cinquante')),
          tab.DataCell(Text('Cinquenta')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('60')),
          tab.DataCell(Text('Soixante')),
          tab.DataCell(Text('Sessenta')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('70')),
          tab.DataCell(Text('Soixante-dix')),
          tab.DataCell(Text('Setenta')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('80')),
          tab.DataCell(Text('Quatre-vingt')),
          tab.DataCell(Text('Oitenta')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('90')),
          tab.DataCell(Text('Quatre-vingt-dix')),
          tab.DataCell(Text('Noventa')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('100')),
          tab.DataCell(Text('Cent')),
          tab.DataCell(Text('Cem')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('1000')),
          tab.DataCell(Text('Milles')),
          tab.DataCell(Text('Mil')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('1000 000')),
          tab.DataCell(Text('Un million')),
          tab.DataCell(Text('Um milhão')),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('1000 000 000')),
          tab.DataCell(Text('Un milliard')),
          tab.DataCell(Text('Um bilhão')),
        ],),
        


   ];
}