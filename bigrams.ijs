NB. Roger Hui's functions for inverted tables
NB. http://www.jsoftware.com/jwiki/Essays/Inverted%20Table
require'invertedt.ijs'  

NB. Read in text file, make it lower case
faq=:tolower@freads'linuxfaq.txt'

NB. Define the outcomes we want to count - 27x27 possible bigrams made from
NB. english letters and a space
alphabet=:a. {~ 97+i.26
bigrams=:(,/)@(,"0/~) alphabet,' '

NB. Count all the bigrams and sort
tbigramsall=:tsort (~. ; (#/.~)) 2 ]\  faq

NB. Get the counts for only the outcomes we're interested in
tcounts=:(('**';0) tadd tbigramsall) tfrom~ ({. tbigramsall) tindexof <bigrams

NB. compute 27x27 probability matrix
probarray=: (] % +/) > {: tcounts  NB. 729 array
prob=: (_27 ]\ probarray)  NB.  27x27 matrix

NB. Conditional probabilities
pyx=: (% +/"1) prob
pxy=: (% +/"1)&.|: prob

NB. Plot the results
NB. make squares proportional in size to each value in matrix y
NB. credit to Raul Miller http://jsoftware.com/pipermail/programming/2015-January/040848.html
square=: (>./~|i:12)%12
mat2sq=: 1&$: : (4 : ',/ 0 |: ,/ 0 2|: y >:/ (square % x)')

require 'viewmat'
NB.viewmat 80 mat2sq prob
NB.viewmat 2.5 mat2sq pyx
NB.viewmat 2.5 mat2sq pxy
