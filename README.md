<div  align=center>
	<h1>Web Scraping Shell Script
	<br>
		<img src="https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white">
		<img src="https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white">
		<br>
	</h1>
</div>

## Description

This shell script first acesses a catologue webpage passed as an argument. It parses the HTML for h2 tags that contain ISBNs of books. 

Then, for each ISBN, it acesses that book's unique web page and converts one specific segment into a json file that is then parsed for information about the book: namely its isbn, name, and price. It then inserts the data obtained for each book into a database. 

The script must always be called like this:

![call](https://github.com/macaroonforu/Web-Scraping-Shell-Script/assets/121368271/30b6dda3-6486-491b-9ec8-dd220921f0ee)



You can search different categories, for example,  open source instead of web development, by changing the URL.
- https://link.springer.com/search?facet-content-type=%22Book%22&query=open+source

Here is an example of the output of the script: 

![output](https://github.com/macaroonforu/Web-Scraping-Shell-Script/assets/121368271/3a15184e-a7f9-45e6-86ae-9526ec1db893)

Here is what the database looks like after the script has run: 

![databases](https://github.com/macaroonforu/Web-Scraping-Shell-Script/assets/121368271/63e1d76c-c4c2-4455-8c20-be467bc5f206)
