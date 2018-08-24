Friendships
===

Scenario:
---

Congratulations, you are making the next Facebook! To kick things off, your product owner has asked
you to begin working on features to allow users to be friends with other users. Sounds simple right?

Acceptance criteria:
---

In a Rails console:

* Two users can be associated in a friendship
* Given a user record with a friendship, the corresponding user can be accessed
* Friendships can be removed without also removing any users
* Given a user record, that user's friends can be directly accessed from the model

> If you enjoy this scenario, a further area that may interest you is Graph databases. Graph
> databases are databases that are not row and column based as a traditional database is. Instead,
> Graph databases represent data as nodes, with connections (called edges) drawn between the nodes.
> Social data such as friendships is often represented by a Graph database such as Neo4J, however
> this particular example does not require the additional setup, maintenance and complexity that a
> graph database brings with it. 

Extensions
---

> Extensions represent additional tasks you can complete if you would like to try out a few more
> things. The acceptance criteria does not have tests included, but you are welcome to write them 
> to the test file yourself.

When displaying a list of friendships, extend the associations such that a user's friends are
displayed in alphabetic order (A-Z). 

Acceptance criteria:

In a Rails console:

* Given a user called "User A" is friends with "User V", "User T" and "User U" (created in that
  order)
* When accessing a list of that user's friends
* The results display in order "User T", "User U", "User V"

---

Consider the complexities that can go into a join between users such as this, and how it might be
extended. You can codify this into your application if you wish, or simply diagram out how features
such as friend invites, post visibility, and uni-directional friendships (e.g. User A is friends
with User B, but User B is _not_ friends with User A). might work.

Acceptance criteria:

If representing the items in code, the acceptance criteria should be tested, functional code. If you
have chosen this route, you are encouraged to pair with another developer to demonstrate your work.

If features have been diagrammed out, you should be able to:

* Explain to another person (developer or otherwise) your diagramming, the points you found
  challenging or think would require more research.
* Decide on which solution you would prefer, that solution's advantages and disadvantages (e.g. would
  it scale? Does it have potential performance or privacy issues?), and alternatives you think could
  also work.
* For additional practice, you could consider writing these options and your proposed solution up as
  a technical document that you would share with the development team for this project. 



