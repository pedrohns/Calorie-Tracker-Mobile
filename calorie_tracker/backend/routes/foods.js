const createConnection = require('../utils/sqlConnect')
const readFile = require('../utils/readFile')
let sql = require('../utils/sql')
var fetch = require('node-fetch')
var connectionBank = createConnection()
var calorieDao = new sql(connectionBank)
require('dotenv').config()
console.log(process.env.DB_HOST)

module.exports = function (app) {
    app.get("/", function (req, res) {
        console.log("Veio aqui por rotas!!!")
    })

    // app.get("/createListFood", async function (req, response) {
    //     let counter = 10;
    //     for (let index = 0; index < counter; index++) {
    //         let data = await fetch(`https://api.nal.usda.gov/fdc/v1/foods/list?api_key=${process.env.CALORIE_KEY}&pageNumber=${counter}&pageSize=50`, {
    //             headers: {
    //                 Accept: "application/json"
    //             }, method: 'GET'
    //         })
    //         let url = await data.json()
    //         const extractedData = await extractDesiredValues(url)
    //         // console.log(extractedData)
    //         // process.exit()
    //         if (!!extractedData) {
    //             response.send({ resp: extractedData })
    //         }
    //     }
    // })

    app.get("/createListFood", async function (req, response) {
        const counter = 150;
        const promises = [];
        for (let index = 101; index < counter; index++) {
          promises.push(
            fetch(`https://api.nal.usda.gov/fdc/v1/foods/list?api_key=${process.env.CALORIE_KEY}&pageNumber=${index}&pageSize=50`, {
              headers: {
                Accept: "application/json"
              }, method: 'GET'
            })
            .then(res => res.json())
          );
        }
      
        try {
          const results = await Promise.all(promises);
          const extractedData = results.flatMap(data => extractDesiredValues(data));
      
          // Após coletar todos os dados, enviar a resposta
          response.send({ ok:"Deu certo" });
        } catch (error) {
          console.error("Erro ao processar requisições:", error);
          response.status(500).send({ error: "Erro ao processar requisições" });
        }
      });

    app.get("/createFullListFood", async function (req, response) {
        const extractedData = await readFile();
        //console.log(extractedData)
        if (!!extractedData) {
            response.send({ extractedData })
            extractedData.map((values) => {
                insertData(values)
            })
        }


    })

    async function extractDesiredValues(data) {
        // 204 Fat
        // 205 Carbs
        // 208 Energy
        // 203 Protein
        // 291 Fiber
        // 269 Sugar
        const extractedData = data.map(item => ({
            fdcId: item.fdcId,
            description: item.description,
            protein: item.foodNutrients.find(nutrient => nutrient.number === "203")?.amount || 0,
            totalLipid: item.foodNutrients.find(nutrient => nutrient.number === "204")?.amount || 0,
            carbohydrate: item.foodNutrients.find(nutrient => nutrient.number === "205")?.amount || 0,
            energy: item.foodNutrients.find(nutrient => nutrient.number === "208")?.amount || 0,
            fiber: item.foodNutrients.find(nutrient => nutrient.number === "291")?.amount || 0,
            sugar: item.foodNutrients.find(nutrient => nutrient.number === "269")?.amount || 0
        }))

        await extractedData.forEach(foodData => {
            insertData(foodData);
        });
        return extractedData;
    }

    async function insertData(data) {
        let description = data.description.replace(/'/g,'')
        let foodId = await firstInsertFood(data.fdcId, description);
        string = `rowid = '${await generateRowid()}',created_by = 'i',last_upd_by = 'i',created = now(),
        last_upd = now(), deleted_by = '', food_id = '${foodId}', quantity_cal = ${data.energy},
        carb = ${data.carbohydrate}, fat = ${data.totalLipid}, protein = ${data.protein},
        fiber = ${data.fiber}, sugar = ${data.sugar} `;
        calorieDao.insert("insert into ct_food_details set " + string);
        // console.log(data)
        // process.exit()  usado como se fosse um die()

    }

    async function generateRowid() {
        var rowid = require('../utils/getRowid')
        return rowid()

    }

    async function firstInsertFood(id, name) {
        foodId = await generateRowid();
        string = `rowid = '${foodId}',created_by = 'i',last_upd_by = 'i',created = now(),last_upd = now(), 
        code = '${id}', name = '${name}', deleted_by = ''`;
        calorieDao.insert("insert into ct_food set " + string);
        return foodId;

    }
}