# Web-Scraping-Shell-Script
This shell script first acesses catologue webpage passed as an argument. It parses the HTML for h2 tags that contain ISBNs of books. Then, for each ISBN, it acesses that book's personal web page and parses that HTML for information about the book: namely its isbn, name, and price. It then inserts the data obtained for each book into a database. 
