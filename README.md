# RSQLiteAdmin

An interactive interface based SQLite R package making it very user-friendly. Current Targets of the projects are

- Create DataBases
- Explore Tables
- Search Queries
- Delete Queries
- Modify Queries
- Sorting Option in Exploring Tables (additional)
- Delete from Table Explorer (additional)

## Why SQLite ?!

SQLite is a serverless solution that’s self-contained, highly reliable, and full of features. As a self-contained SQL database engine, it can handle all sorts of data in a relatively simple manner. This is because it integrates directly with the application instead of having to install it somewhere and then have it connect with your app.

Pros:

1. Serverless which means it is simple to set up and zero configuration is required
2. File-based system makes it very portable
3. Great for development and testing

Cons:

1. Doesn’t provide network access (i.e. accessing it from another machine) as it is serverless
2. Not built for large-scale applications
3. No user management

## How are DBI and SQLite Connected ?!

The DB connections in R have many different parts and stages. At the lowest level is the dplyr package which provides simplifies data transformation and provides a consitent set of functions, called verbs. dplyr can interact with databases directly by translating the dplyr functions (verbs) to SQL queries.

<p>
    <img src="./Resources/dplyr_Explained.png" width=40% ><br>
    <em>Image taken from https://db.rstudio.com</em>
</p>

At the top most layer is RSQLite (and other packages like RMySQL), This is the layer user interacts directly with. connecting this layer to the dplyr level is DBI. The DBI package acts 'middle-ware' and allows connectivity with database from user/other packages.

<p>
    <img src="./Resources/R_DBI_Explained.png" width=40% ><br>
    <em>Image taken from https://db.rstudio.com</em>
</p>