module.exports = function(app) {
    app.get("/", function(req, res){
        console.log("Veio aqui por rotas!!!")
    })
}