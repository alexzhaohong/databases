var mysql = require('mysql');

// Create a database connection and export it from this file.
// You will need to connect with the user "root", no password,
// and to the database "chat".


var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'chat'
});

connection.connect((err) => {
  if (err) {
    console.log('error connecting to database: ', err);
    return;
  } else {
    console.log('connected to database! With id: ' + connection.threadId);
  }
});

connection.query('SELECT 1', function (error, results, fields) {
  if (error) throw error;
  // connected!
});

exports.connection = connection;