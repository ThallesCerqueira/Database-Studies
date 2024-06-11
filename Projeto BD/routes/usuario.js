const express = require('express');

module.exports = (conn) => {
  const router = express.Router();

  // Inserir novo usuário
  router.post('/', (req, res) => {
    const { nomePessoa } = req.body;
    const sql = 'INSERT INTO Usuario (nomePessoa) VALUES (?)';
    conn.query(sql, [nomePessoa], (err, result) => {
      if (err) {
        console.error('Erro ao inserir usuário:', err);
        res.status(500).send('Erro ao inserir usuário');
      } else {
        res.status(201).send('Usuário inserido com sucesso');
      }
    });
  });

  // Obter todos os usuários
  router.get('/', (req, res) => {
    const sql = 'SELECT * FROM Usuario';
    conn.query(sql, (err, results) => {
      if (err) {
        console.error('Erro ao consultar usuários:', err);
        res.status(500).send('Erro ao consultar usuários');
      } else {
        res.json(results);
      }
    });
  });

  // Atualizar usuário
  router.put('/:id', (req, res) => {
    const { id } = req.params;
    const { nomePessoa } = req.body;
    const sql = 'UPDATE Usuario SET nomePessoa = ? WHERE codUsuario = ?';
    conn.query(sql, [nomePessoa, id], (err, result) => {
      if (err) {
        console.error('Erro ao atualizar usuário:', err);
        res.status(500).send('Erro ao atualizar usuário');
      } else {
        res.send('Usuário atualizado com sucesso');
      }
    });
  });

  // Deletar usuário
  router.delete('/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM Usuario WHERE codUsuario = ?';
    conn.query(sql, [id], (err, result) => {
      if (err) {
        console.error('Erro ao deletar usuário:', err);
        res.status(500).send('Erro ao deletar usuário');
      } else {
        res.send('Usuário deletado com sucesso');
      }
    });
  });

  return router;
};