const express = require("express");
const paypal = require("pay-rest-sdk");
const bodyParser = require("body-parser");

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

pay.configure({
  mode: "sandbox",
  client_id: "TU_CLIENT_ID_AQUÍ",
  client_secret: "TU_CLIENT_SECRET_AQUÍ",
});

app.post("/pay", (req, res) => {
  const create_payment_json = {
    intent: "sale",
    payer: {
      payment: "pay",
    },
    redirect_urls: {
      return_url: "http://localhost:3000/success",
      cancel_url: "http://localhost:3000/cancel",
    },
    transactions: [
      {
        item_list: {
          items: [
            {
              name: "Artículo de prueba",
              sku: "001",
              price: "25.00",
              currency: "BS",
              quantity: 1,
            },
          ],
        },
        amount: {
          currency: "BS",
          total: "25.00",
        },
        description: "Pago por un artículo de prueba.",
      },
    ],
  };

  pay.payment.create(create_payment_json, (error, payment) => {
    if (error) {
      throw error;
    } else {
      for (let i = 0; i < payment.links.length; i++) {
        if (payment.links[i].rel === "approval_url") {
          res.redirect(payment.links[i].href);
        }
      }
    }
  });
});

app.get("/success", (req, res) => {
  const payerId = req.query.PayerID;
  const paymentId = req.query.paymentId;

  const execute_payment_json = {
    payer_id: payerId,
    transactions: [
      {
        amount: {
          currency: "BS",
          total: "25.00",
        },
      },
    ],
  };

  pay.payment.execute(paymentId, execute_payment_json, (error, payment) => {
    if (error) {
      console.log(error.response);
      throw error;
    } else {
      console.log(JSON.stringify(payment));
      res.send("Pago realizado con éxito");
    }
  });
});

app.get("/cancel", (req, res) => res.send("Pago cancelado"));

app.listen(3000, () =>
  console.log("Servidor iniciado en http://localhost:3000")
);
