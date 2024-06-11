const express = require('express');

module.exports = (conn) => {
  const router = express.Router();

  // Inserir nova despesa
  router.post('/', (req, res) => {
    const { descricaoDespesa, valorDespesa, codUsuarioFk, codCategoriaFk, dataDespesa } = req.body;
    const sql = 'INSERT INTO Despesa (descricaoDespesa, valorDespesa, codUsuarioFk, codCategoriaFk, dataDespesa) VALUES (?, ?, ?, ?, ?)';
    conn.query(sql, [descricaoDespesa, valorDespesa, codUsuarioFk, codCategoriaFk, dataDespesa], (err, result) => {
      if (err) {
        console.error('Erro ao inserir despesa:', err);
        res.status(500).send('Erro ao inserir despesa');
      } else {
        res.status(201).send('Despesa inserida com sucesso');
      }
    });
  });

  // Obter todas as despesas
  router.get('/', (req, res) => {
    const sql = 'SELECT * FROM Despesa';
    conn.query(sql, (err, results) => {
      if (err) {
        console.error('Erro ao consultar despesas:', err);
        res.status(500).send('Erro ao consultar despesas');
      } else {
        res.json(results);
      }
    });
  });


  router.put('/:id', (req, res) => {
    const { id } = req.params;
    const { descricaoDespesa } = req.body;
    const sql = 'UPDATE Despesa SET descricaoDespesa = ? WHERE codDespesa = ?';
    conn.query(sql, [descricaoDespesa, id], (err, result) => {
      if (err) {
        console.error('Erro ao atualizar despesa:', err);
        res.status(500).send('Erro ao atualizar despesa');
      } else {
        res.send('Despesa atualizada com sucesso');
      }
    });
  });

  router.delete('/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM Despesa WHERE codDespesa = ?';
    conn.query(sql, [id], (err, result) => {
      if (err) {
        console.error('Erro ao deletar despesa:', err);
        res.status(500).send('Erro ao deletar despesa');
      } else {
        res.send('Despesa deletada com sucesso');
      }
    });
  });

  // Adicionar essa parte ao arquivo despesa.js

// Obter relatório de despesas
router.get('/relatorio', (req, res) => {
  const sql = `SELECT nomePessoa, nomeCategoria, descricaoDespesa, valorDespesa, dataDespesa
               FROM Usuario 
               INNER JOIN Despesa ON Usuario.codUsuario = Despesa.codUsuarioFk
               INNER JOIN Categoria ON Categoria.codCategoria = Despesa.codCategoriaFk`;
  conn.query(sql, (err, results) => {
    if (err) {
      console.error('Erro ao consultar relatório de despesas:', err);
      res.status(500).send('Erro ao consultar relatório de despesas');
    } else {
      res.json(results);
    }
  });
});

  return router;
};
