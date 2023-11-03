
const productsController=require('../controllers/productsController');
const passport = require('passport');


module.exports=(app,upload) =>{

    // GET -> obtener datos
    //POST -> Almacenar datos
    //PUT -> ACTUALIZAR datos
    //DELETE -> Eliminar datos
    app.post('/api/products/create',passport.authenticate('jwt',{session:false}), upload.array('image',3), productsController.create);


}