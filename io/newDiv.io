#/usr/bin/env io
Number oldDiv := Number getSlot("/")
Number / := method(den, if(den == 0, 0, self oldDiv(den)))
