# Web-Scraping-Shell-Script
This shell script first acesses a catologue webpage passed as an argument. It parses the HTML for h2 tags that contain ISBNs of books. 

Then, for each ISBN, it acesses that book's unique web page and converts one specific segment into a json file that is then parsed for information about the book: namely its isbn, name, and price. It then inserts the data obtained for each book into a database. 

The script must always be called like this:
./shell.sh 'https://link.springer.com/search?facet-content-type=%22Book%22&query=web+development' apress book isbn name price

but you can search different categories, like for example,  
- https://link.springer.com/search?facet-content-type=%22Book%22&query=open+source
