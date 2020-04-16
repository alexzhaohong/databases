var db = require('../db');

module.exports = {
  messages: {
    get: function (callback) {
      var queryString = 'select * from messages inner join users on messages.user_id = users.id';
      db.connection.query(queryString, function (err, results, fields) {
        if (err) {
          console.log('error from gettting messages: ', err);
        } else {
          callback(null, results);
        }
      });
    },
    // a function which produces all the messages
    // add callback param
    // query and select all from messages, join rooms name and users name
    // callback: anon func that takes in err results and fields
    //// results will contain the results of the query
    //// fields will contain info about the returning results
    //// if (err) => console.log(err) else callback(null, results)

    post: function (data, callback) {
      var queryString = `INSERT INTO messages (text, user_id, roomname) VALUES ( ${data.text},  (SELECT id FROM users WHERE username = ${data.username}), ${data.roomname} )`;

      db.connection.query(queryString, function(err, results, fields) {
        if (err) {
          console.log('error from posting message: ', err);
        } else {
          callback(null, results);
        }
      });
    }
    // a function which can be used to insert a message into the database
    // add a callback param, and data
    // post will have a unique user id and create the message in a unique room with req.body.json.text
    // error first callback


  },

  users: {

    get: function (callback) {
      var queryString = 'select username from users';

      db.connection.query(queryString, function (err, results, fields) {
        if (err) {
          console.log('error from getting user: ', err);
        } else {
          callback(null, results);
        }
      });

    },

    post: function (req, callback) {
      var reqUsername = req.body.username;
      var queryString = `insert into users (username) values ('${reqUsername}')`;
      // insert into users (username) values ('Valjean')
      console.log(queryString);
      var queryArgs = [];

      db.connection.query(queryString, queryArgs, function (err, results, fields) {
        if (err) {
          console.log('error from posting user: ', err);
        } else {
          callback(null, results);
        }
      });
    }
    // a function that creates a row in table users upon POST request
    // add callback parameter
    // insert into table users the username, with the value given in request.body.json.username
    //// in the example, this is 'Valjean'
    // callback
  }


// request({
//   method: 'POST',
//   uri: 'http://127.0.0.1:3000/classes/users',
//   json: { username: 'Valjean' }
// }


};

// messages.get: queryString = 'SELECT m.text, m.createdAt, r.roomname, u.username FROM messages m INNER JOIN rooms r ON (m.room_id = r.id) INNER JOIN users u ON (m.user_id = u.id)'

// messages.post: queryString =`INSERT INTO messages (text, user_id, room_id) VALUES ( (${data.text}), (${data.createdAt}), (SELECT id FROM users WHERE username = ${data.username}), (SELECT id FROM rooms WHERE roomname = ${data.roomname}) )`

