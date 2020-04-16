var models = require('../models');

module.exports = {
  messages: {
    get: function (req, res) {
      models.messages.get((err, results) => {
        if (err) {
          console.log('controller error from getting message: ', err);
        } else {
          res.send(results); // will send status code 200 and also tell the client its finished
        }
      });
    }, // a function which handles a get request for all messages
    post: function (req, res) {
      models.messages.post(req, (err, results) => {
        if (err) {
          console.log('controller error from posting message: ', err);
        } else {
          res.send(results);
        }
      });
    } // a function which handles posting a message to the database
  },

  users: {
    // Ditto as above
    get: function (req, res) {
      models.users.get(req, (err, results) => {
        if (err) {
          console.log('controller error from getting user: ', err);
        } else {
          res.send(results);
        }
      });
    },
    post: function (req, res) {

      console.log('inside POST request for classes/users');

      models.users.post(req, (err, results) => {
        if (err) {
          console.log('controller error from posting user: ', err);
        } else {
          res.send(results);
        }
      });
    }
  }
};

