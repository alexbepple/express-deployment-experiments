
export const configureRoutes = (app) => {
  app.get('/', (req, res) => {
    res.send('Moinsen!');
  })
}
