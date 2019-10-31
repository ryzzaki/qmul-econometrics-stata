// FILTER data on birthweight => dropping values to include only u + 3 s.d.
graph twoway scatter birthweight educ
count if birthweight > 5158 | birthweight < 1606
drop if birthweight > 5158 | birthweight < 1606

// QUESTION A
gen higheduc = educ > 12

// b.i)
summarize birthweight if higheduc == 1

// b.ii)
summarize birthweight if higheduc == 0

// QUESTION C
/*
// if condition is applied globally on the whole function - will not run if higheduc == 0
regress birthweight educ if higheduc == 1
regress birthweight educ if higheduc == 0
graph twoway (lfit birthweight educ if higheduc == 1) (scatter birthweight educ if higheduc == 1)
graph twoway (lfit birthweight educ if higheduc == 0) (scatter birthweight educ if higheduc == 0)
*/
regress birthweight higheduc

// QUESTION D
regress birthweight educ

// QUESTION E
graph twoway (lfit birthweight higheduc) (scatter birthweight higheduc)
graph twoway (lfit birthweight educ) (scatter birthweight educ)