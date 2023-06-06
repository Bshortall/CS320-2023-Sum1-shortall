####################################################
import sys
sys.path.append('./../..')
from assign01_lib import *
####################################################
print("[import ./../../assign01_lib.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign01-lib.sml)
#
####################################################

def mylist_split(xs):
    if (mylist_nilq(xs)):
        return (mylist_nil(), mylist_nil())
    else:
        xs1 = xs.cons1
        xs2 = xs.cons2
        if (mylist_nilq(xs2)):
            return (mylist_cons(xs1), mylist_nil())
        else:
            (ys1, ys2) = mylist_split(xs2)
            return mylist_cons(mylist_cons(xs1, ys1), mylist_cons(xs2, ys2))
        
def mylist_merge(xs, ys):
    if (mylist_nilq(xs)):
        return ys
    else:
        xs1 = xs.cons1
        xs2 = xs.cons2
        if (mylist_nilq(ys)):
            return xs
        else:
            ys1 = ys.cons1
            ys2 = ys.cons2
            if (xs1 <= ys1):
                return mylist_cons(xs1, mylist_merge(xs, mylist_cons(ys1, ys2)))
            else:
                return mylist_cons(ys1, mylist_merge(mylist_cons(xs1, xs2), ys))
            
def mylist_mergesort(xs):
    