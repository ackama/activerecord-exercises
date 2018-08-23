# Blog Posts

## Situation:

Your application represents a blog. You wish to be able to write
posts containing a title, and content. Once you have posts in your database,
you will be able to start presenting this content using an API or views.

## Acceptance Criteria:

In a Rails console I can:

- Create a new post with a title, and content
- Update the content of an existing post
- Remove a post that already exists
- Access a list of all posts that exist

## Extensions:

> Extensions represent additional tasks you can complete if you would like to try out a few more
> things. The acceptance criteria does not have tests included, but you are welcome to write them 
> to the test file yourself.

You would like to use a post title as a "slug" to use in the URL to view a single post.
To facilitate this, post titles should be unique. Find a way of adding a uniqueness constraint to your post's "title" attribute.

Acceptance criteria:

In a Rails console:

- A post is created with the title "test"
- When another post is created with the title "test", an error is raised

---

Allow your posts to be written in Markdown. To do this, you will need to find ad
install a gem dependency that makes methods to transform Markdown into HTML available
to you.

Acceptance criteria:

In a Rails console:

- A post is created with content of "**This is a markdown post**."
- The post body, transformed to HTML can be read using a method such as "body_html"
- The post body, untransformed can still be read
