 import 'package:flutter/material.dart';
 import 'tabledata.dart' as tab;
 
  const kTablePronColumns = <tab.DataColumn>[
  tab.DataColumn(
    label: const Text('Pronoms'),
  ),
  tab.DataColumn(
    label: const Text('Pronomes'),
  ),
];
 

listpronoms(size) {

return
   [ 
      tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell( Container(width: size,child: Text('Je'))),
          tab.DataCell( Container(width: size,child: Text('Eu', ), ),),
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Tu')),
          tab.DataCell(Text('Tu')),
        ],
              ),
              tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Il, Elle')),
          tab.DataCell(Text('Ele, Ela')),
        ],
              ),
              tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Nous')),
          tab.DataCell(Text('Nós')),
        ],
              ),
              tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Vous')),
          tab.DataCell(Text('Vós')),
        ],
              ),
              tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Ils, Elles')),
          tab.DataCell(Text('Eles, Elas')),
        ],
              ),];
}

  const kTablePossColumns = <tab.DataColumn>[
  tab.DataColumn(
    label: const Text('''Pronoms
Possessifs
Singulier'''),
  ),
  tab.DataColumn(
    label: const Text('''Pronomes
Possessivos
Singular'''),
  ),
];



listRowPos(size) {
return
[ 
      tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Container(width: size, child: Text('Mon, Ma'))),
          tab.DataCell(Container(width: size, child: Text('Meu, Minha'))),
        ],),
        
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Ton, Ta')),
          tab.DataCell(Text('Teu, Tua')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Son, Sa')),
          tab.DataCell(Text('Seu, Sua')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Notre')),
          tab.DataCell(Text('Nosso, Nossa')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Votre')),
          tab.DataCell(Text('Vosso, Vossa')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Leur')),
          tab.DataCell(Text('Seu, Sua')),
        ],),
        
        
        ];

}




         const kTablePossColumnsPlu = <tab.DataColumn>[
  tab.DataColumn(
    label: const Text('''Pronoms
Possessifs
Pluriel'''),
  ),
  tab.DataColumn(
    label: const Text('''Pronomes
Possessivos
Plural'''),
  ),
];


listRowPossplus(size) {
return [ 
      tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Container(width: size, child: Text('Mes'))),
          tab.DataCell(Container(width: size, child: Text('Meus, Minhas'))),
        ],),
        
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Tes')),
          tab.DataCell(Text('Teus, Tuas')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Ses')),
          tab.DataCell(Text('Seus, Suas')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Nos')),
          tab.DataCell(Text('Nossos, Nossas')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Vos')),
          tab.DataCell(Text('Vossos, Vossas')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Leurs')),
          tab.DataCell(Text('Seus, Suas')),
        ],),
        
        
        ];

}
 

 const kTableArtInDef = <tab.DataColumn>[
  tab.DataColumn(
    label: const Text('''Articles
Indéfinis'''),
  ),
  tab.DataColumn(
    label: const Text('''Artigos
Indefinidos'''),
  ),
];

listRowartInd(size) {
return [ tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Container(width: size, child:Text('Un, Une')),),
          tab.DataCell(Container(width: size, child:Text('Um, Uma')),),
        
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Des')),
          tab.DataCell(Text('Uns, Umas')),
        
        ],) ];
        }

 

         const kTableArtDef = <tab.DataColumn>[
  tab.DataColumn(
    label: const Text('''Articles
Définis'''),
  ),
  tab.DataColumn(
    label: const Text('''Artigos
Definidos'''),
  ),
];


listRowartdef(size) {
return [
  tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Container(width: size, child:Text('Le, La')),),
          tab.DataCell(Container(width: size, child:Text('O, A')),)
        
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('Les')),
          tab.DataCell(Text('Os, As')),
        
        ],)

];
}



        const kTablecontraction1 = <tab.DataColumn>[
  tab.DataColumn(
    label: const Text('''De'''),
  ),
  tab.DataColumn(
    label: const Text('''Em'''),
  ),
];

listrowcontrac1(size) {
return [
 tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Container( width: size, child: Text('De + Um = Dum')),),
          tab.DataCell(Container( width: size, child: Text('Em + Um = Num')),),
        
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('De + Uns = Duns')),
          tab.DataCell(Text('Em + Uns = Nuns')),
        
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('De + Uma = Duma')),
          tab.DataCell(Text('Em + Uma = Numa')),
        
        ],),
         tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('De + Umas = Dumas')),
          tab.DataCell(Text('Em + Umas = Numas')),
        
        ],),

];

}
 const kTablecontraction3 = <tab.DataColumn>[
       tab.DataColumn(
    label: const Text('''A'''),
  ),
   tab.DataColumn(
    label: const Text('''Por'''),
  ),];

         const kTablecontraction2 = <tab.DataColumn>[
  tab.DataColumn(
    label: const Text('''De'''),
  ),
  tab.DataColumn(
    label: const Text('''Em'''),
  ),
  
];

listrowcontract3(size) {
  return [
tab.DataRow(
        cells: <tab.DataCell>[
tab.DataCell(Container(width: size, child:Text('A + O = Ao')),),
          tab.DataCell(Container(width: size, child:Text('Por + O = Pelo')),)
        
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
tab.DataCell(Text('A + A = À')),
          tab.DataCell(Text('Por + A = Pela')),
        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('A + Os = Aos')),
          tab.DataCell(Text('Por + Os = Pelos')),

        ],),

        tab.DataRow(
        cells: <tab.DataCell>[
tab.DataCell(Text('A + As = Às')),
          tab.DataCell(Text('Por + As = Pelas')),
        ],),
  ];
}

listrowcontract2(size) {
  return [
  tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Container(width: size, child: Text('De + O = Do')),),
          tab.DataCell(Container(width: size, child:Text('Em + O = No')),),
          
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('De + A = Da')),
          tab.DataCell(Text('Em + A = Na')),
          
        
        ],),
        tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('De + Os = Dos')),
          tab.DataCell(Text('Em + Os = Nos')),
          
        
        ],),
         tab.DataRow(
        cells: <tab.DataCell>[
          tab.DataCell(Text('De + As = Das')),
          tab.DataCell(Text('Em + As= Nas')),
          
        
        ],),

  ];
}

     