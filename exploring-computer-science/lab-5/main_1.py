def extract_words(text):
    new_text = text.split()
    status = [x for x in new_text if len(x) >= 4]
    return status
    
print(extract_words("Don't judge a book by its cover."))
print(extract_words("All that glitters is not gold."))
print(extract_words("The multinational corporation's decentralization strategy required comprehensive reorganization of their compartmentalized departmentalization systems across intercontinental subsidiaries." ))
