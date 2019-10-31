// filter data on birthweight
drop if birthweight > 5000 | birthweight < 2000

// question a
gen higheduc = educ > 12

// b.i)
summarize if higheduc == 1

// b.ii)
summarize if higheduc == 0

// question c
// if condition is applied globally on the whole function - will not run if higheduc == 0
regress birthweight educ if higheduc == 1
regress birthweight educ if higheduc == 0

graph twoway (lfit birthweight educ if higheduc == 1) (scatter birthweight educ if higheduc == 1)
graph twoway (lfit birthweight educ if higheduc == 0) (scatter birthweight educ if higheduc == 0)

// question d
regress birthweight educ

//question e
graph twoway (lfit birthweight educ) (scatter birthweight educ)