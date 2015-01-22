NB. decoding is inference
NB. we want to infer what the source message was

require'jpeg viewmat'

NB. binarize an image
binarize=: (0.5 < (% >./^:_)) 

NB. binary matrix with shape of y and probability of 1 = x, default 0.10
noise=: 0.1&$: : [ > ?.@:($&0)@:$@:]

NB. a bit is flipped if noise vector = 1, so this is add mod 2, or XOR 
addnoise=: ~:  

NB. repetition code - makes x copies of image y (default 3)
rep=: 3&$: : ([ # ,:@])  

NB. majority vote decoder - returns 0 or 1.  For 3 bits, the function table is:
NB. (; vote)"1 #: i.8
vote=:+/ > +/@:-.  

NB. define the encoder as the repetition code and the majority vote as it's
NB. inverse
enc=: rep :. (vote@:])

NB. verb to simulate a transmission of image y with repetition x
transmit=: dyad : '(addnoise noise)&.(x&enc) y'  "0 _

NB. Compare results of transmitting an image with repetition codes 1 thru 6
img=: readjpeg'cat.jpg'
result=: ,/ (1+i.6) transmit binarize img

NB. View results
NB.viewmat result
