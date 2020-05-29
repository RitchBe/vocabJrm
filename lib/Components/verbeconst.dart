import 'package:flutter/material.dart';
import 'tabledata.dart' as tab;

const kTableVerbs = <tab.DataColumn>[
  tab.DataColumn(
    label: const Text('Francais'),
  ),
  tab.DataColumn(
    label: const Text('Portugais'),
  ),
];



List<List<String>> detail1 = [
  ['je', 'tu', 'il', 'nous', 'vous', 'ils'],
  ['suis', 'es', 'est', 'sommes', 'etes', 'sont'],
  ['sou', 'es', 'e', 'samos', 'sao', 'sao']
];

tableDetailVerbs(name) {
  return [
    tab.DataColumn(
      label: const Text(''),
    ),
    tab.DataColumn(
      label: Text(
        '$name',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
   
  ];
}



Widget tableconjugImperaPor(size, size2, size3, data, column) {
  return Container(
    margin: EdgeInsets.all(16),
    width: size,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.orange),
    ),
    alignment: Alignment.center,
    child: tab.DataTable(
      headingRowHeight: 0,
      columns: tableDetailVerbs(column),
      rows: [
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Container(width: size2, child: Text('Tu'))),
            tab.DataCell(
              Container(width: size3, child: Text(data[0])),
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Container(width: size2, child: Text('Ele/Ela'))),
            tab.DataCell(
              Container(width: size3, child: Text(data[1])),
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Container(width: size2, child: Text('Nós'))),
            tab.DataCell(
              Container(width: size3, child: Text(data[2])),
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Container(width: size2, child: Text('Eles/Elas'))),
            tab.DataCell(
              Container(width: size3, child: Text(data[2])),
            ),
          ],
        ),
      ],
    ),
  );
}





Widget tableconjugImpera(size, size2, size3, data, column) {
  return Container(
    margin: EdgeInsets.all(16),
    width: size,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.orange),
    ),
    alignment: Alignment.center,
    child: tab.DataTable(
      headingRowHeight: 0,
      columns: tableDetailVerbs(column),
      rows: [
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Container(width: size2, child: Text('Tu'))),
            tab.DataCell(
              Container(width: size3, child: Text(data[0])),
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Container(width: size2, child: Text('Nous'))),
            tab.DataCell(
              Container(width: size3, child: Text(data[1])),
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Container(width: size2, child: Text('Vous'))),
            tab.DataCell(
              Container(width: size3, child: Text(data[2])),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget tableconjug(size, size2, size3, data, column) {
  return Container(
      margin: EdgeInsets.all(16),
      width: size,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.orange),
      ),
      alignment: Alignment.center,
      child: tab.DataTable(columns: tableDetailVerbs(column), rows: [
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Container(width: size2, child: Text('Je'))),
            tab.DataCell(
              Container(width: size3, child: Text(data[0])),
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Text('Tu')),
            tab.DataCell(Text(data[1])),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Text('Il/Elle')),
            tab.DataCell(Text(data[2])),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Text('Nous')),
            tab.DataCell(Text(data[3])),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Text('Vous')),
            tab.DataCell(Text(data[4])),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Text('Ils')),
            tab.DataCell(Text(data[5])),
          ],
        ),
      ]));
}


Widget tableconjugPor(size, size2, size3, data, column) {
  return Container(
      margin: EdgeInsets.all(16),
      width: size,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.orange),
      ),
      alignment: Alignment.center,
      child: tab.DataTable(columns: tableDetailVerbs(column), rows: [
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Container(
               child: Text('Eu'))),
            tab.DataCell(
              Container(
                width: size3, 
                child: Text(data[0], textAlign: TextAlign.left,)),
            ),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Text('Tu')),
            tab.DataCell(Text(data[1])),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Text('Ele/Ela')),
            tab.DataCell(Text(data[2])),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Text('Nós')),
            tab.DataCell(Text(data[3])),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Text('Vós')),
            tab.DataCell(Text(data[4])),
          ],
        ),
        tab.DataRow(
          cells: <tab.DataCell>[
            tab.DataCell(Text('Eles/Elas')),
            tab.DataCell(Text(data[5])),
          ],
        ),
      ]));
}
