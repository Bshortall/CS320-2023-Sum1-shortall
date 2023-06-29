####################################################
#!/usr/bin/env python3
####################################################
"""
HX-2023-06-19: 10 points
You are required to implement the following function
generator_merge2 WITHOUT using streams. A solution that
uses streams is disqualified.
"""
def generator_merge2(gen1, gen2, lte3):
    try:
        val1 = next(gen1)
    except StopIteration:
        return gen2
    try:
        val2 = next(gen2)
    except StopIteration:
        return gen1

    while True:
        if lte3(val1, val2):
            yield val1
            try:
                val1 = next(gen1)
            except StopIteration:
                yield val2
                yield from gen2
                return
        else:
            yield val2
            try:
                val2 = next(gen2)
            except StopIteration:
                yield val1
                yield from gen1
                return


####################################################
