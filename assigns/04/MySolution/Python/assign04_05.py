########################
# HX-2023-06-20: 30 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess. THIS GUESS SHOULD NOT CONTRADICT
ANY ONE OF THE HINTS GIVEN.
"""
########################################################################


def generate_words(result, not_in_word, misplaced, index=0):
        if index == len(result):
            yield "".join(result)
            return
        
        if result[index] == '*':
            for c in 'abcdefghijklmnopqrstuvwxyz':
                if c not in not_in_word and misplaced.get(c, -1) != index:
                    result[index] = c
                    yield from generate_words(result, not_in_word, misplaced, index+1)
                    result[index] = '*'  # Reset the character after generating the words
        else:
            yield from generate_words(result, not_in_word, misplaced, index+1)

def wordle_guess(hints):
    # Array containing the result 
    result = [ '*' for i in range(len(hints[0])) ]

    # Set containing letters we know are not in the word
    not_in_word = set()

    # Dictionary containing misplaced letters and their positions
    misplaced = {}

    # Process all hints
    for hint in hints:
        for i, word in enumerate(hint):
            if word[0] == 1:
                result[i] = word[1]
            elif word[0] == 0:
                not_in_word.add(word[1])
            else:
                misplaced[word[1]] = i
                
    return next(generate_words(result, not_in_word, misplaced))


########################################################################
