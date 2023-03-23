const {Router} = require('express');
const router = Router();

const mysqlConnection = require('../database/database');

router.get('/', (req, res) => {
    res.status(200).json('Server on port 8000 and database is connected');
});

router.get('/:products', (req, res) => {
    mysqlConnection.query('select * from products;', (error, rows, fields) => {
        if(!error){
            res.json(rows);
        }
        else {
            console.log(error);
        }
    });
});

router.get('/:products/:id', (req, res) => {
    const {id} = req.params;
    mysqlConnection.query('select * from user where id = ?;', [id], (error, rows, fields) => {
        if(!error){
            res.json(rows);
        }
        else {
            console.log(error);
        }
    });
});


router.post('/:products', (req, res) => {
    const {id, nome, preco} = req.body;
    console.log(req.log);
    mysqlConnection.query('INSERT INTO products(id, nome, preco) values(?,?,?);', [id, nome, preco], (error, rows, fields) => {
        if(!error){
            res.json({Status: 'User Saved'});
        }
        else {
            console.log(error);
        }
    });
});

router.put('/:products/:id', (req, res) => {
    const {id, nome, preco} = req.body;
    console.log(req.log);
    mysqlConnection.query('update products set nome = ?, preco = ?;', [nome, preco], (error, rows, fields) => {
        if(!error){
            res.json({Status: 'User updated'});
        }
        else {
            console.log(error);
        } 
    
    });
});

router.delete('/:products/:id', (req, res) => {
    const {id} = req.params;
    mysqlConnection.query('delete from products where id = ?;', [id], (error, rows, fields) => {
        if(!error){
            res.json({Status: 'User deleted'});
        }
        else {
            console.log(error);
        } 
    });

});

module.exports = router;