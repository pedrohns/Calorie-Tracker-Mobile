const createConnection = require('../utils/sqlConnect')
let sql = require('../utils/sql')
const consts = require('../consts')
var fetch = require('node-fetch')
var connectionBank = createConnection()
var calorieDao = new sql(connectionBank)
require('dotenv').config()

module.exports = function (app) {

    app.get("/createListFoodFatSecret", async function (req, response) {
        let counter = 300;
        let isFinished = false;
        for (let index = 0; index < counter; index++) {
            let data = await fetch(consts.path+`&page_number=${index}&search_expression=g`, {
                headers: {
                    Accept: "application/json",
                    Authorization: `Bearer ${consts.token}`
                }, method: 'POST'
            })
            let url = await data.json()
            if (url.foods_search.results != undefined) {
                isFinished = await extractDesiredValuesFatSecret(url.foods_search.results.food, index, counter)
                if (isFinished == true) {
                    response.status(200).send('Término da lista de comidas')
                } else {
                    continue;
                }
            } else {
                response.status(200).send(`Erro no token ou não possui resultados mais resultados. ${index}`)
                process.exit();
            }
        }
    })


    app.get("/sendListFoodFatSecret", async function (req, res) {
        let response = await searchData(req.query);
        res.status(200).send({ food: response });
    });

    async function extractDesiredValuesFatSecret(data, idx, counter) {
        if (!Array.isArray(data)) {
            console.warn('Não é um array:', typeof data)
            return false;
        }

        const extractedData = data.map(item => ({
            fdcId: item.food_id,
            description: item.food_name,
            protein: item.servings.serving[0].protein || 0,
            totalLipid: item.servings.serving[0].fat || 0,
            carbohydrate: item.servings.serving[0].carbohydrate || 0,
            energy: item.servings.serving[0].calories || 0,
            fiber: item.servings.serving[0].fiber || 0,
            sugar: item.servings.serving[0].sugar || 0,
            amount: Math.floor(item.servings.serving[0].metric_serving_amount) || 1,
            modifier: item.servings.serving[0].metric_serving_unit,
            gram_weight: item.servings.serving[0].metric_serving_amount || 0
        }))

        await extractedData.forEach(foodData => {
            insertData(foodData);
        });

        if (counter - idx == 1) {
            return true;
        } else {
            return false;
        }

    }
    async function insertData(data) {
        let description = data.description.replace(/'/g, '')
        let modifier = data.modifier.replace(/'/g, '')
        let foodId = await firstInsertFood(data.fdcId, description);
        // Second insert Food Details
        string = `rowid = '${await generateRowid()}',created_by = 'i',last_upd_by = 'i',created = now(),
        last_upd = now(), deleted_by = '', food_id = '${foodId}', quantity_cal = ${data.energy},
        carb = ${data.carbohydrate}, fat = ${data.totalLipid}, protein = ${data.protein},
        fiber = ${data.fiber}, sugar = ${data.sugar} `;
        // console.log(`insert into ct_food_details set ${string}`)
        calorieDao.insert(`insert into ct_food_details set ${string} on duplicate key update food_id = '${foodId}';`);
        // Last insert Portion
        insertPortion(foodId, data.amount, modifier, data.gram_weight)
    }

    async function insertPortion(food_id, amount, modifier, gram_weight) {
        let portionId = await generateRowid();
        let stringPortion = `rowid = '${portionId}',created_by = 'i',last_upd_by = 'i',created = now(),last_upd = now(), 
    food_id = '${food_id}', portion = ${amount}, deleted_by = '', legend = '${modifier}', sizePortion = '${gram_weight}'`;
        calorieDao.insert(`insert into ct_food_portion set ${stringPortion} on duplicate key update food_id = '${food_id}';`)
        // console.log(`insert into ct_food_portion set ${stringPortion}`)
    }

    async function generateRowid() {
        var rowid = require('../utils/getRowid')
        return rowid()

    }

    async function firstInsertFood(id, name) {
        foodId = await generateRowid();
        string = `rowid = '${foodId}',created_by = 'i',last_upd_by = 'i',created = now(),last_upd = now(), 
        code = '${id}', name = '${name}', deleted_by = ''`;
        // console.log(`insert into ct_food set ${string}`)
        calorieDao.insert(`insert into ct_food set ${string} on duplicate key update code = '${id}';`);
        return foodId;

    }

    async function searchData(data) {
        if (data.search) {
            let result = await calorieDao.select(`select * from ct_food where lower(name) like lower('%${data.search}%')`)
            if (result.length > 0) {
                return result;
            }
            return 'Não achou nada';
        }
        return 'Retornou errado';
    }
}