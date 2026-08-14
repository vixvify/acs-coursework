def strength(passwords):
    arr = []
    for word in passwords:
        if(len(word)>=12 and any(s.isalpha() for s in word) and any(s.isdigit() for s in word) and (any(not s.isalnum() for s in word))):
            arr.append("strong")
        elif(len(word) < 8 or word.isalpha()):
            arr.append("weak")
        else:
            arr.append("ok")
    return arr
    
print(strength(["abc","School2025","L3arn!ngAI2025"]))
print(strength(["12345", "abcdefg"]))
print(strength(["helloworld", "PythonRocks"]))
print(strength(["abc12345", "Password1", "Hello2025"]))
print(strength([""]))
print(strength(["onlyletters", "Mix123", "GoodOne2023!", "Ultra$trongP@ssw0rd2025"]))
