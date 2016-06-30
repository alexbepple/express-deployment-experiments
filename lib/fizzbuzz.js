
const divisors = {
  3: 'fizz',
  5: 'buzz'
}

export const fizzbuzz = (number) => {
  let ergebnis = ''

  const applyDivisor = (divisor) => {
    if (number % divisor === 0) ergebnis += divisors[divisor]
  }

  applyDivisor(3)
  applyDivisor(5)

  if (ergebnis === '') return number
  return ergebnis
}

