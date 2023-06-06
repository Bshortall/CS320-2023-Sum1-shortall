####################################################
import sys
sys.path.append('./../..')
from assign01_lib import *
####################################################
print("[import ./../../assign01_lib.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign01-lib.sml)
#
####################################################

def mylist_qpartition(xs, x0):
    if (mylist_nilq(xs)):
        return (mylist_nil(), mylist_nil())
    else:
        xs1 = xs.cons1
        xs2 = xs.cons2
        if (xs1 <= x0):
            (ys1, ys2) = mylist_qpartition(xs2, x0)
            return (mylist_cons(xs1, ys1), ys2)
        else:
            (ys1, ys2) = mylist_qpartition(xs2, x0)
            return (ys1, mylist_cons(xs1, ys2))
        

def mylist_quicksort(xs):
    if (mylist_nilq(xs)):
        mylist_print(xs)
        return xs
    else:
        (xs1, xs2) = mylist_qpartition(xs.cons2, xs.cons1)
        ys1 = mylist_quicksort(xs1)
        ys2 = mylist_quicksort(xs2)
        return mylist_cons(ys1, mylist_cons(xs.cons1, ys2))
        
