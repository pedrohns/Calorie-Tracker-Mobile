var consts = require('../consts')
var fetch = require('node-fetch')
var foods = require('../utils/foodUtils')
require('dotenv').config()

// var token = consts.getToken();
consts.getToken().then(row => {
    token = row.token;
}).catch(error => {
    console.error(error);
})

module.exports = function (app) {

    app.get("/createListFoodFatSecret", async function (req, response) {
        let body = req.query.expression;
        let counter = 300;
        let isFinished = false;
        for (let index = 0; index < counter; index++) {
            let data = await fetch(consts.path + `&page_number=${index}&search_expression=${body}`, {
                headers: {
                    Accept: "application/json",
                    Authorization: `Bearer ${token}`
                }, method: 'POST'
            })
            let url = await data.json()
            if (url.foods_search.results != undefined) {
                isFinished = await foods.extractDesiredValuesFatSecret(url.foods_search.results.food, index, counter)
                if (isFinished == true) {
                    response.status(200).send('Término da lista de comidas')
                } else {
                    continue;
                }
            } else {
                response.status(200).send(`Erro no token ou não possui resultados mais resultados. ${index}`)
                process.exit()
            }
        }
    })


    app.get("/sendListFoodFatSecret", async function (req, res) {
        let response = await foods.searchData(req.query.search);
        await console.log('Veio pra ca');
        await res.status(200).send({ food: response });
    });

    app.get("/getTeste", async function (req,res){
        await console.log('Veio pra ca');
        await res.status(200).send('foi')
    })

}