const {Router} = require('express');
const router = Router();

const mysqlConnection = require('../database/database');

router.get('/', (req, res) => {
    res.status(200).json('Server on port 8000 and database is connected');
});

//GET

router.get('/supplierbr', (req, res) => {
    mysqlConnection.query('select * from supplier_br;', (error, rows, fields) => {
        if(!error){
            res.json(rows);
        }
        else {
            console.log(error);
        }
    });
});

router.get('/products', (req, res) => {
    const {id} = req.params;

    mysqlConnection.query('select * from products;', [id], (error, rows, fields) => {
        if(!error){
            res.json(rows);
        }
        else {
            console.log(error);
        }
    });
});

router.get('/lastproducts', (req, res) => {

    mysqlConnection.query('select id_supplier_br from supplier_br ORDER BY id_supplier_br DESC LIMIT 1;', (error, rows, fields) => {
        if(!error){
            res.json(rows);
        }
        else {
            console.log(error);
        }
    });
});

router.get('/orders/:id', (req, res) => {
    const {id} = req.params;

    mysqlConnection.query('select * from order_details where id_clients = ?;', [id], (error, rows, fields) => {
        if(!error){
            res.json(rows);
        }
        else {
            console.log(error);
        }
    });
});

router.get('/clients/', (req, res) => {
    const email_clients = req.query.email_clients;
    const senha_clients = req.query.senha_clients;

    mysqlConnection.query('select id_clients from clients where email_clients = ? and senha_clients = ?;', [email_clients, senha_clients] , (error, rows, fields) => {
        if(!error){
            res.json(rows);
        }
        else {
            console.log(error);
        }
    });
});

router.get('/clients/:id', (req, res) => {
    const {id} = req.params;

    mysqlConnection.query('select * from clients where id_clients = ?;', [id], (error, rows, fields) => {
        if(!error){
            res.json(rows);
        }
        else {
            console.log(error);
        }
    });
});

router.get('/supplier_br/:id', (req, res) => {
    const {id} = req.params;
    mysqlConnection.query('select * from supplier_br where id_supplier_br = ?;', [id], (error, rows, fields) => {
        if(!error){
            res.json(rows);
        }
        else {
            console.log(error);
        }
    });
});

router.get('/supplier_eu/:id', (req, res) => {
    const {id} = req.params;
    mysqlConnection.query('select * from supplier_eu where id_supplier_eu = ?;', [id], (error, rows, fields) => {
        if(!error){
            res.json(rows);
        }
        else {
            console.log(error);
        }
    });
});


// POST
router.post('/productbr', (req, res) => {
    const {nome_supplier_br, descricao_supplier_br, categoria_supplier_br, imagem_supplier_br, preco_supplier_br, material_supplier_br, departamento_supplier_br} = req.body;
    console.log(req.log);
    mysqlConnection.query('INSERT INTO supplier_br(nome_supplier_br, descricao_supplier_br, categoria_supplier_br, imagem_supplier_br, preco_supplier_br, material_supplier_br, departamento_supplier_br) values(?,?,?,?,?,?,?);', [nome_supplier_br, descricao_supplier_br, categoria_supplier_br, imagem_supplier_br, preco_supplier_br, material_supplier_br, departamento_supplier_br], (error, rows, fields) => {
        if(!error){
            res.json({Status: 'Product Saved'});
        }
        else {
            console.log(error);
        }
    });
});

router.post('/producteu', (req, res) => {
    const {name_product, description_product, details_product, discont_produto, hasdiscont_product, price_produto} = req.body;
    console.log(req.log);l
    mysqlConnection.query('INSERT INTO supplier_eu(name_supplier_eu, description_supplier_eu, details_supplier_eu, discontvalue_supplier_eu, has_discount_supplier_eu, price_supplier_eu) values(?,?,?,?,?,?);', [name_product, description_product, details_product, discont_produto, hasdiscont_product, price_produto], (error, rows, fields) => {
        if(!error){
            res.json({Status: 'Product Saved'});
        }
        else {
            console.log(error);
        }
    });
});

router.post('/clients', (req, res) => {
    const {nome_clients, email_clients, senha_clients} = req.body;
    console.log(req.log);
    mysqlConnection.query('INSERT INTO clients(nome_clients, email_clients, senha_clients) values(?,?,?);', [nome_clients, email_clients, senha_clients], (error, rows, fields) => {
        if(!error){
            res.json({Status: 'Client Saved'});
        }
        else {
            console.log(error);
        }
    });
});

router.post('/order', (req, res) => {
    const {total_order_details, quant_order_details, id_clients, id_supplier_br, id_supplier_eu} = req.body;
    console.log(req.log);
    mysqlConnection.query('INSERT INTO order_details(total_order_details, quant_order_details, id_clients, id_supplier_br, id_supplier_eu) values(?,?,?,?,?);', [total_order_details, quant_order_details, id_clients, id_supplier_br, id_supplier_eu], (error, rows, fields) => {
        if(!error){
            res.json({Status: 'Order Saved'});
        }
        else {
            console.log(error);
        }
    });
});

// router.put('/:products/:id', (req, res) => {
//     const {id, nome, preco} = req.body;
//     console.log(req.log);
//     mysqlConnection.query('update products set nome = ?, preco = ?;', [nome, preco], (error, rows, fields) => {
//         if(!error){
//             res.json({Status: 'User updated'});
//         }
//         else {
//             console.log(error);
//         } 
    
//     });
// });

// router.delete('/:products/:id', (req, res) => {
//     const {id} = req.params;
//     mysqlConnection.query('delete from products where id = ?;', [id], (error, rows, fields) => {
//         if(!error){
//             res.json({Status: 'User deleted'});
//         }
//         else {
//             console.log(error);
//         } 
//     });

// });

module.exports = router;