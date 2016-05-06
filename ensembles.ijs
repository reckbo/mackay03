NB. define variables 'disease' \in {0, 1} and 'test' \in {0, 1} with these
NB. meanings
NB. disease = 1 Jo has the disease
NB. disease = 0 Jo does not have the disease
NB. test = 1 test is positive
NB. test = 0 test is negative

NB. Conditional probability P(test|disease)
]ptest_disease=: 2 2 $ 0.95 0.05 0.05 0.95

NB. Marginal probability P(disease)
]pdisease=: 0.99 0.01 

NB. joint P(test,disease)
]joint=: pdisease * ptest_disease

NB. P(disease|test)
]pdisease_test=: (%"1 +/) joint
