require('dotenv').config();
const clientID = process.env.CLIENT_ID;
const clientSecret = process.env.CLIENT_SECRET;
console.log(clientID)
console.log(clientSecret)

var request = require("request");

var options = {
   method: 'POST',
   url: 'https://oauth.fatsecret.com/connect/token',
   method : 'POST',
   auth : {
      user : clientID,
      password : clientSecret
   },
   headers: { 'content-type': 'application/x-www-form-urlencoded'},
   form: {
      'grant_type': 'client_credentials',
      'scope' : 'premier'
   },
   json: true
};

request(options, function (error, response, body) {
   if (error) throw new Error(error);

   console.log(body);
//    process.env.ACCESS_TOKEN = body.access_token;
});