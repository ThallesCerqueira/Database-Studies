const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const { engine } = require('express-handlebars');
const usuarioRoutes = require('./routes/usuario');
const categoriaRoutes = require('./routes/categoria');
const despesaRoutes = require('./routes/despesa');

const app = express();

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(express.static('public'));

// Configura o Handlebars como o motor de visualizações
app.engine('handlebars', engine());
app.set('view engine', 'handlebars');
app.set('views', './views');

const conn = mysql.createConnection({
  host: "localhost",
  port: 3306, // Verifique se esta é a porta correta
  user: "root",
  password: "", // Verifique a senha correta
  database: "ControleDeGastos",
});

conn.connect((err) => {
  if (err) {
    console.error("Erro ao conectar ao MySQL:", err);
  } else {
    console.log("Conectou ao MySQL");
    app.listen(3000, () => {
      console.log("App funcionando");
    });
  }
});

conn.on("error", (err) => {
  console.error("Erro de conexão com o MySQL:", err);
});

// Rotas para APIs REST
app.use('/api/usuarios', usuarioRoutes(conn));
app.use('/api/categorias', categoriaRoutes(conn));
app.use('/api/despesas', despesaRoutes(conn));

// Rota exemplo usando Handlebars
app.get('/', (req, res) => {
  res.render('home', { title: 'Página Inicial' });
});

// Rota para listar usuários e renderizar com Handlebars
app.get('/usuarios', (req, res) => {
  const sql = 'SELECT * FROM Usuario';
  conn.query(sql, (err, results) => {
    if (err) {
      console.error('Erro ao consultar usuários:', err);
      res.status(500).send('Erro ao consultar usuários');
    } else {
      res.render('usuarios', { usuarios: results, title: 'Usuários' });
    }
  });
});

// Rota para inserir novo usuário
app.post('/usuarios', (req, res) => {
  const { nomePessoa } = req.body;
  const sql = 'INSERT INTO Usuario (nomePessoa) VALUES (?)';
  conn.query(sql, [nomePessoa], (err, result) => {
    if (err) {
      console.error('Erro ao inserir usuário:', err);
      res.status(500).send('Erro ao inserir usuário');
    } else {
      res.redirect('/usuarios');
    }
  });
});

// Rota para deletar usuário
app.post('/usuarios/delete/:id', (req, res) => {
  const { id } = req.params;
  const sql = 'DELETE FROM Usuario WHERE codUsuario = ?';
  conn.query(sql, [id], (err, result) => {
    if (err) {
      console.error('Erro ao deletar usuário:', err);
      res.status(500).send('Erro ao deletar usuário');
    } else {
      res.redirect('/usuarios');
    }
  });
});

// Rota para listar categorias e renderizar com Handlebars
app.get('/categorias', (req, res) => {
  const sql = 'SELECT * FROM Categoria';
  conn.query(sql, (err, results) => {
    if (err) {
      console.error('Erro ao consultar categorias:', err);
      res.status(500).send('Erro ao consultar categorias');
    } else {
      res.render('categorias', { categorias: results, title: 'Categorias' });
    }
  });
});

// Rota para inserir nova categoria
app.post('/categorias', (req, res) => {
  const { nomeCategoria, descricaoCategoria } = req.body;
  const sql = 'INSERT INTO Categoria (nomeCategoria, descricaoCategoria) VALUES (?, ?)';
  conn.query(sql, [nomeCategoria, descricaoCategoria], (err, result) => {
    if (err) {
      console.error('Erro ao inserir categoria:', err);
      res.status(500).send('Erro ao inserir categoria');
    } else {
      res.redirect('/categorias');
    }
  });
});

// Rota para deletar categoria
app.post('/categorias/delete/:id', (req, res) => {
  const { id } = req.params;
  const sql = 'DELETE FROM Categoria WHERE codCategoria = ?';
  conn.query(sql, [id], (err, result) => {
    if (err) {
      console.error('Erro ao deletar categoria:', err);
      res.status(500).send('Erro ao deletar categoria');
    } else {
      res.redirect('/categorias');
    }
  });
});

// Rota para listar despesas e renderizar com Handlebars
app.get('/despesas', (req, res) => {
  const despesasSql = 'SELECT * FROM Despesa';
  const usuariosSql = 'SELECT * FROM Usuario';
  const categoriasSql = 'SELECT * FROM Categoria';

  conn.query(despesasSql, (err, despesas) => {
    if (err) {
      console.error('Erro ao consultar despesas:', err);
      res.status(500).send('Erro ao consultar despesas');
    } else {
      conn.query(usuariosSql, (err, usuarios) => {
        if (err) {
          console.error('Erro ao consultar usuários:', err);
          res.status(500).send('Erro ao consultar usuários');
        } else {
          conn.query(categoriasSql, (err, categorias) => {
            if (err) {
              console.error('Erro ao consultar categorias:', err);
              res.status(500).send('Erro ao consultar categorias');
            } else {
              res.render('despesas', {
                despesas: despesas,
                usuarios: usuarios,
                categorias: categorias,
                title: 'Despesas'
              });
            }
          });
        }
      });
    }
  });
});

// Rota para inserir nova despesa
app.post('/despesas', (req, res) => {
  const { descricaoDespesa, valorDespesa, codUsuarioFk, codCategoriaFk, dataDespesa } = req.body;
  const sql = 'INSERT INTO Despesa (descricaoDespesa, valorDespesa, codUsuarioFk, codCategoriaFk, dataDespesa) VALUES (?, ?, ?, ?, ?)';
  conn.query(sql, [descricaoDespesa, valorDespesa, codUsuarioFk, codCategoriaFk, dataDespesa], (err, result) => {
    if (err) {
      console.error('Erro ao inserir despesa:', err);
      res.status(500).send('Erro ao inserir despesa');
    } else {
      res.redirect('/despesas');
    }
  });
});

// Rota para deletar despesa
app.post('/despesas/delete/:id', (req, res) => {
  const { id } = req.params;
  const sql = 'DELETE FROM Despesa WHERE codDespesa = ?';
  conn.query(sql, [id], (err, result) => {
    if (err) {
      console.error('Erro ao deletar despesa:', err);
      res.status(500).send('Erro ao deletar despesa');
    } else {
      res.redirect('/despesas');
    }
  });
});

// Rota para listar relatório de despesas e renderizar com Handlebars
app.get('/relatorio', (req, res) => {
  const despesasSql = `
    SELECT nomePessoa, nomeCategoria, descricaoDespesa, valorDespesa, dataDespesa
    FROM Usuario 
    INNER JOIN Despesa ON Usuario.codUsuario = Despesa.codUsuarioFk
    INNER JOIN Categoria ON Categoria.codCategoria = Despesa.codCategoriaFk
    WHERE (Usuario.codUsuario = ? OR ? IS NULL)
    AND (Categoria.codCategoria = ? OR ? IS NULL);
  `;
  const usuariosSql = 'SELECT * FROM Usuario';
  const categoriasSql = 'SELECT * FROM Categoria';

  const usuarioFiltro = req.query.usuarioFiltro || null;
  const categoriaFiltro = req.query.categoriaFiltro || null;

  console.log('Filtros:', { usuarioFiltro, categoriaFiltro });

  conn.query(despesasSql, [usuarioFiltro, usuarioFiltro, categoriaFiltro, categoriaFiltro], (err, despesas) => {
    if (err) {
      console.error('Erro ao consultar relatório de despesas:', err);
      res.status(500).send('Erro ao consultar relatório de despesas');
    } else {
      console.log('Despesas:', despesas);
      conn.query(usuariosSql, (err, usuarios) => {
        if (err) {
          console.error('Erro ao consultar usuários:', err);
          res.status(500).send('Erro ao consultar usuários');
        } else {
          conn.query(categoriasSql, (err, categorias) => {
            if (err) {
              console.error('Erro ao consultar categorias:', err);
              res.status(500).send('Erro ao consultar categorias');
            } else {
              console.log('Usuários:', usuarios);
              console.log('Categorias:', categorias);
              res.render('relatorio', {
                despesas: despesas,
                usuarios: usuarios,
                categorias: categorias,
                title: 'Relatório de Despesas'
              });
            }
          });
        }
      });
    }
  });
});

// Helper para formatar a data
const handlebars = require('handlebars');
handlebars.registerHelper('formatDate', function(date) {
  const options = { day: '2-digit', month: '2-digit', year: 'numeric' };
  return new Date(date).toLocaleDateString('pt-BR', options);
});

app.listen(8080, () => {   
  console.log("SERVIDOR ativo. Acesse http://localhost:8080");   
});

