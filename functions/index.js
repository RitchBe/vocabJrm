const functions = require('firebase-functions');

const data = require("./data.json");
const collectionKey = "words"; 
const { Storage } = require('@google-cloud/storage');
const uuidv1 = require('uuid/v1');
const admin = require('firebase-admin');

// const spawn = require('child-process-promise').spawn;
const path = require('path');
const os = require('os');
const fs = require('fs');

const serviceAccount = require("./serviceAccountKey.json");


//name of the collection
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://vocab-3fdd5.firebaseio.com"
});

const db = admin.firestore();

const storage = new Storage();

// const settings = {timestampsInSnapshots: true};
// firestore.settings(settings);

exports.createUserDoc = functions.auth.user().onCreate((user) => {
  const userUid = user.uid;
  // const data = data;
  const userScheme = {
     email: user.email,
     displayName: user.displayName,
     uid: userUid,
   //   favorite: [],
   //   uploaded: [],
     dateCreation: new Date(),
    //  words: data

   };
  //  const scorescheme = {
  //    1: 0,
  //    2: 0,
  //    3: 0,
  //    4: 0,
  //  }
  const datascheme = {
    useruid: userUid,
    words: data
  };
  // const datascheme = data;
   
  //  const dataIndex = data.index
  //  const wordList = {
     

  //    useruid: userUid,
  //   words: data
  //  }
   db.collection('users').doc(user.uid).set(userScheme);
  //  db.collection('users').doc(user.uid).collection('wordLists').doc('words').set(wordList);

  db.collection('users').doc(user.uid).collection('wordsscore').doc('wordssc').set(datascheme);

//     Object.keys(data).forEach(docKey => {

        // db.collection('users').doc(user.uid).collection(collectionKey).doc(docKey).set(data[docKey]);
// });
});

  // for (const index of Object.keys(data)) {

  //   db.collection('users').doc(user.uid).collection('wordLists').doc(data[index]).set(wordList);


  //   // 	get value
  //       Object.values(data[index]).forEach(key =>{
  //         console.log(key)
  //       })
  //   //   get keys
  //       Object.keys(data[index]).forEach(key =>{
  //         console.log(key)
  //       })
  //   //   or get both
  //       Object.entries(data[index]).forEach(entry =>{
  //         console.log(entry)
  //       })
    
    
      //  }


  //  db.collection('users').doc(user.uid).collection('wordLists').doc('words').set(wordList);

// });




// const settings = {timestampsInSnapshots: true};
// firestore.settings(settings);
// if (data && (typeof data === "object")) {
// Object.keys(data).forEach(docKey => {
//  firestore.collection(collectionKey).doc(docKey).set(data[docKey]).then((res) => {
//     console.log("Document " + docKey + " successfully written!");
// }).catch((error) => {
//    console.error("Error writing document: ", error);
// });
// });
// }

