Pages with Parts
====

Situation:
---

You are starting to create a content management system. The first data structure you're going to
need is somewhere to store page information, but you have a requirement from your product owner for
a page to be comprised of a number of parts. Examples of parts include the sidebar, header, and
footer of each individual page. Some parts may have special parts, such as the home page having 3
featured content parts (these might be named "featured_content_one", "_two", "_three" etc.

Pages need to have a title. Page parts should have a way of identifying each part (like a name), and
content associated with them.

Acceptance Criteria:
---

* A page can be created called "Home", with three parts "Featured Content One", "Featured Content
  Two", "Featured Content Three". 
* A new part can be built and attached to an existing page
* A part can be removed from an existing page
* All of the content can be collected from a page using "pluck"

Extensions:
---

> Extensions represent additional tasks you can complete if you would like to try out a few more
> things. The acceptance criteria does not have tests included, but you are welcome to write them 
> to the test file yourself.

You can extract the content from your parts pretty easily using pluck, but that gives you back an array 
with all your content. Make it easier to get the content for a particular part by creating a method
on your page model that accepts a page part name, and returns the content.

Acceptance criteria:

In a Rails console:

* Assign a page object to "page" with a page part named "Test Part"
* Calling `page.content_for("Test Part")` returns the content as expected

---

Update page parts so they are positioned. There are gems to do this, but try and do it yourself.
Positioned page parts means that when you request a list of the parts for a particular page, they
are returned in order of their position. Position should be an integer column on your page parts
table. It's up to you whether you handle unpositioned pages by ordering with "nulls last" (you might
need to Google this!), or by assigning the current maximum position across all this page's parts + 1
when the page part is created.

Acceptance criteria:
 
In a Rails console:

* Assign a page object 
* Add a page part to the above part called "Test Part 2", with a position of "1"
* Add a page part to the above part called "Test Part 1" with a position of "0"
* Verify that retrieving a list of the parts for a page returns them in order "Test Part 1", "Test
  Part 2"




