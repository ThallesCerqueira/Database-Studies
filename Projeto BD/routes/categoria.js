const express = require('express');

module.exports = (conn) => {
  const router = express.Router();

  // Inserir nova categoria
  router.post('/', (req, res) => {
    const { nomeCategoria, descricaoCategoria } = req.body;
    const sql = 'INSERT INTO Categoria (nomeCategoria, descricaoCategoria) VALUES (?, ?)';
    conn.query(sql, [nomeCategoria, descricaoCategoria], (err, result) => {
      if (err) {
        console.error('Erro ao inserir categoria:', err);
        res.status(500).send('Erro ao inserir categoria');
      } else {
        res.status(201).send('Categoria inserida com sucesso');
      }
    });
  });

  // Obter todas as categorias
  router.get('/', (req, res) => {
    const sql = 'SELECT * FROM Categoria';
    conn.query(sql, (err, results) => {
      if (err) {
        console.error('Erro ao consultar categorias:', err);
        res.status(500).send('Erro ao consultar categorias');
      } else {
        res.json(results);
      }
    });
  });

  // Atualizar categoria
  router.put('/:id', (req, res) => {
    const { id } = req.params;
    const { nomeCategoria, descricaoCategoria } = req.body;
    const sql = 'UPDATE Categoria SET nomeCategoria = ?, descricaoCategoria = ? WHERE codCategoria = ?';
    conn.query(sql, [nomeCategoria, descricaoCategoria, id], (err, result) => {
      if (err) {
        console.error('Erro ao atualizar categoria:', err);
        res.status(500).send('Erro ao atualizar categoria');
      } else {
        res.send('Categoria atualizada com sucesso');
      }
    });
  });

  // Deletar categoria
  router.delete('/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM Categoria WHERE codCategoria = ?';
    conn.query(sql, [id], (err, result) => {
      if (err) {
        console.error('Erro ao deletar categoria:', err);
        res.status(500).send('Erro ao deletar categoria');
      } else {
        res.send('Categoria deletada com sucesso');
      }
    });
  });

  return router;
};