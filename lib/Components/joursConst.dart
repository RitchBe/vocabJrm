import 'package:flutter/material.dart';
import 'tabledata.dart' as tab;

 const kTableJours = <tab.DataColumn>[
       tab.DataColumn(
    label: const Text('Les Jours'),
  ),
   tab.DataColumn(
    label: const Text('Os Dias'),
  ),
  
  ];

  listJours(size) {

return
   [ 
      tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Container(width: size,child: Text('Lundi'))),
          tab.DataCell( Container(width: size,child: Text('A segunda-feira', ), ),),
        ],),
tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Mardi'),),
          tab.DataCell( Text('A terça-feira', ), ),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Mercredi'),),
          tab.DataCell( Text('A quarta-feira', ), ),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Jeudi'),),
          tab.DataCell( Text('A quinta-feira', ), ),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Vendredi'),),
          tab.DataCell( Text('A sexta-feira', ), ),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Samedi'),),
          tab.DataCell( Text('O sábado', ), ),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Dimanche'),),
          tab.DataCell( Text('O domingo', ), ),
        ],),


   ];
  }

const kTableMois = <tab.DataColumn>[
       tab.DataColumn(
    label: const Text('Les Mois'),
  ),
   tab.DataColumn(
    label: const Text('Os meses'),
  ),
  
  ];

  listMois(size) {

return
   [ 
      tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Container(width: size,child: Text('Janvier'))),
          tab.DataCell( Container(width: size,child: Text('Janeiro', ), ),),
        ],),
         tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Février')),
          tab.DataCell(  Text('Fevereiro', ), ),
        ],),
         tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Mars')),
          tab.DataCell(  Text('Março', ), ),
        ],),
         tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Avril')),
          tab.DataCell(  Text('Abril', ), ),
        ],),
         tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Mais')),
          tab.DataCell(  Text('Maio', ), ),
        ],),
         tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Juin')),
          tab.DataCell(  Text('Junho', ), ),
        ],),
         tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Août')),
          tab.DataCell(  Text('Agosto', ), ),
        ],),
         tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Septembre')),
          tab.DataCell(  Text('Setembro', ), ),
        ],),
         tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Octobre')),
          tab.DataCell(  Text('Outubro', ), ),
        ],),
         tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Novembre')),
          tab.DataCell(  Text('Novembro', ), ),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Text('Decembre')),
          tab.DataCell(  Text('Dezembro', ), ),
        ],),
        
   ];
  }