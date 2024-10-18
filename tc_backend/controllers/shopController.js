const shop = require("../models/shops.js");

class shopsController {
  async create(req, res) {
    try {
      const data = await shop.create(req.body);
      return res.status(201).json(data);
    } catch (err) {
      res.status(500).send({ message: err.message });
    }
  }

  async findAll(req, res) {
    try {
      const data = await shop.find();
      return res.status(201).json(data);
    } catch (err) {
      res.status(500).send({ message: err.message });
    }
  }

  async findOne(req, res) {
    const id = req.params.id;

    try {
      const data = await shop.findById(id);
      return res.status(201).json(data);
    } catch (err) {
      res.status(500).send({ message: err.message });
    }
  }

  async update(req, res) {
    const id = req.params.id;

    try {
      const data = await shop.findByIdAndUpdate(id, req.body, {
        useFindAndModify: false,
      });
      return res.status(201).json(data);
    } catch (err) {
      res.status(500).send({ message: err.message });
    }
  }

  async delete(req, res) {
    const id = req.params.id;

    try {
      const data = await shop.findByIdAndRemove(id);
      return res.status(201).json(data);
    } catch (err) {
      res.status(500).send({ message: err.message });
    }
  }
}

module.exports = new shopsController();
