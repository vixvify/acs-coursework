books_list = []

def add_book(books, isbn, title, author, copies):
    isHas = [i for i in books if i["isbn"] == isbn]
    if(isHas != []):
        print("isbn ซ้ำ")
        return
    books.append({
        'isbn':isbn,
        "title":title,
        "author":author,
        "copies":copies
    })
    
def search_books(books, keyword):
    isFind = [i for i in books if i["title"] == keyword or i["author"] == keyword]
    if(isFind == []):
        print("ไม่พบรายการ")
        return 
    for i in isFind:
        print(i)
    
def search_books_all(books):
    for i in books:
        print(i)

add_book(books_list, '001', 'Python Crash Course', 'Eric Matthes', 3)
add_book(books_list, '002', 'Clean Code', 'Robert Martin', 2)
add_book(books_list, '003', 'The Pragmatic Programmer', 'Hunt & Thomas', 2)
add_book(books_list, '004', 'Design Patterns', 'Gang of Four', 1)
add_book(books_list, '005', 'Introduction to Algorithms', 'Cormen et al.', 2)
add_book(books_list, '006', 'Code Complete', 'Steve McConnell', 3)
add_book(books_list, '007', 'Refactoring', 'Martin Fowler', 2)

search_books(books_list,"Clean Code")

# search_books_all(books_list)


