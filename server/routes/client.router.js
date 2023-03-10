const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

router.get('/all', (req, res) => {
  const sqlQuery = `
  SELECT
    "client"."id",
    "client"."company_name",
    "client"."contact_name",
    "client"."contact_email",
    MAX("client_assessments"."engagement_date") as "engagement_date",
    STRING_AGG(DISTINCT "user"."name", ', ') as "operators"
	FROM "client"
	JOIN "user_client" ON "client"."id" = "user_client"."client_id"
	JOIN "user" ON "user_client"."user_id" = "user"."id"
	JOIN "client_assessments" ON "client"."id" = "client_assessments"."client_id"
	GROUP BY
		"client"."id",
		"client"."company_name",
		"client"."contact_name",
		"client"."contact_email"
	ORDER BY "client"."company_name" ASC;
  `;
  pool.query(sqlQuery)
  .then((response) => {
    res.send(response.rows);
  })
  .catch((error) => {
    console.error('Error in GET /client/all: ', error);
    res.sendStatus(500);
  })
});

router.post('/', (req, res) => {
  // POST route code here
});

module.exports = router;