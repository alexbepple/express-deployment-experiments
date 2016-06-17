import express from 'express'
const app = express()

import {configureRoutes} from './lib/routes'
configureRoutes(app)

app.listen(3000, () => {
  console.log('Example app listening on port 3000!')
})

