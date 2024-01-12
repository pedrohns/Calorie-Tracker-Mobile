const createConnection = require('../utils/sqlConnect')
let sql = require('../utils/sql')
const consts = require('../consts')
var fetch = require('node-fetch')
var connectionBank = createConnection()
var calorieDao = new sql(connectionBank)
require('dotenv').config()

module.exports = function (app) {
    app.post("/checkLogin", async function (req, response) {
        console.log(req.body)
        let res = await checkParams(req.body)
        response.status(200).send(res)
        // process.exit()
    })

    async function checkParams(params){
        if (!!params) {
            let result = await calorieDao.select(`select rowid from ct_user where email = '${params.email}' and password = '${params.password}'`)
            if (result.length > 0) {
              return 'Authenticated';
            } else {
                return 'User not found'
            }
            
          } else {
            return 'Empty param';
          }
    }
}