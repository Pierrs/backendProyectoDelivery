const express = require('express');
const app = express();
const http = require('http');
const { pid } = require('process');
const server = http.createServer(app);
const logger = require('morgan');
const cors = require('cors');
const req = require('express/lib/request');
const { error } = require('console');
const passport = require('passport');
const multer = require('multer');

/*
* IMPORTAREMOS RUTAS
*/

const usersRoutes = require('./routes/userRoutes');
const categoryRoutes = require('./routes/categoryRoutes');
const productRoutes = require('./routes/productRoutes');
const port = process.env.PORT || 3000;

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

app.use(cors());
app.use(passport.initialize());
app.use(passport.session());

require('./config/passport')(passport);
app.disable('x-powered-by');

app.set('port', port);

const upload = multer({
    storage: multer.memoryStorage()
});

/*
* COLOCAR RUTAS
*/
 usersRoutes(app,upload);
 categoryRoutes(app);
 productRoutes(app,upload);


server.listen(3000,'192.168.3.147' || 'localhost',function(){
    console.log('Aplicaciones de NodeJS ' + port + ' Iniciando...')
});

app.get('/',(req,res)=>{
    res.send('Ruta raiz del backend');
} );
app.get('/test',(req,res)=>{
    res.send('Este es la ruta TEST');
} );

app.use((err,req,res, next) =>{
    console.log(err);
    res.status(err.status || 500).send(err.stack);
});
