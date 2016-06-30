import {assertThat, is} from 'hamjest'
import {fizzbuzz} from '../fizzbuzz'

describe('fizzbuzz', () => {
  it('gibt `fizz` bei durch 3 teilbaren Zahlen zurück', () => {
    assertThat(fizzbuzz(3), is('fizz'))
    assertThat(fizzbuzz(6), is('fizz'))
  })

  it('gibt `buzz` bei durch 5 teilbaren Zahlen zurück', () => {
    assertThat(fizzbuzz(5), is('buzz'))
  })

  it('kombiniert `fizz` und `buzz`, wenn Zahl durch 3 und 5 teilbar ist', () => {
    assertThat(fizzbuzz(15), is('fizzbuzz'))
  })

  it('gibt sonstige Zahlen unverändert zurück', () => {
    assertThat(fizzbuzz(1), is(1))
  })
})

