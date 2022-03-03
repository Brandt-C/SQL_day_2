# Count Palindromes
# GIven a list of strings, count the number of palindromes that occur inside of the list (a palindrome is a word that is spelled the same backwards and forward).

# Example input: ['dog', 'racecar', 'wildebeest']
# Output: 1
# Explanation: 'racecar' is the only palindrome in the list

def is_pal(a_list):
    c = 0
    for w in range(len(a_list)):
        if a_list[w][::-1] == a_list[w]:
            c += 1
    return c

print(is_pal(['dog', 'racecar', 'wildebeest', 'civic']))

def is_palindrome(s):
    if s[::-1].lower() == s.lower():
        return True
    else:
        return False