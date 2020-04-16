var db = require('../db');

module.exports = {
  messages: {
    get: function (callback) {
      db.connection.query('select m.text, m.createdAt, r.roomname, u.username from messages m inner join rooms r on (m.room_id = r.id) inner join users u on (m.user_id = u.id)', function (err, results, fields) {
        if (err) {
          console.log(err);
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

    post: function () {} // a function which can be used to insert a message into the database
  },

  users: {
    // Ditto as above.
    get: function () {},
    post: function () {}
  }
};

