import {fizzbuzz} from './fizzbuzz'

export const configureRoutes = (app) => {
  app.get('/', (req, res) => {
    res.send('Moinsen!')
  })

  app.get('/numbers/:number/fizzbuzz', (req, res) => {
    res.send(fizzbuzz(req.params.number))
  })
}

