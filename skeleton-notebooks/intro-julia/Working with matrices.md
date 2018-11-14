
# Playing with matrices
(and if you get the subliminal message about abstractions, we'll be thrilled!)

Julia is a dynamic language.  You don't need type declarations, and can change variable types dynamically and interactively.

For working with simple numbers, arrays, and strings, its syntax is *superficially* similar to Matlab, Python, and other popular languages.

In order to execute the `In` cells, select the cell and press `Shift-Enter`, or press the `Play` button above. To run the entire notebook, navigate to the `Cell` menu and then `Run All`.

# We tell beginners, you don't need types!

# Now forget all that (for now): Julia is not so different from your favorite dynamic language

# Let's create some addition tables

First let's use a nested for loop to fill in a matrix that's initially zero:

We can abbreviate this using a double `for` loop:

The Julia way would be to use a so-called **array comprehension**:

**Explore**: What does the following do? 

**Explore**: What does the following do? 

Suppose we want to see $n \times n$ multiplication tables for $n=1,2,3,4,5$:

# `Interact.jl` is a Julia *package* for interacting with data

It's way more fun to **interact** with our data.
We install the `Interact.jl` package as follows; this needs to be executed only once for any given Julia installation:

Now we load the package with the following `using` command, in each Julia session:

The package contains a `@manipulate` macro, that is wrapped around a `for` loop:

We use a double `for` loop to get a double slider!

# Functions

Julia is built around functions: all "commands" or "operations" in Julia are functions:

Functions just work, as long as they make sense:

Let's define a function to insert a block in a matrix:

We can move the block around:

# Strings

Julia can manipulate strings easily:

More about strings: <a href="http://docs.julialang.org/en/stable/manual/strings/"> Julia Doc on Strings </a>

Functions in Julia try to be **generic**, i.e. to work with as many kinds of object as possible:

Julia allows us to display objects in different ways. For example, the following code displays a matrix of strings
in the notebook using an HTML representation:

Let's use the **same code**, but now with strings:

# Colors

The `Colors` package provides objects representing colours:

What happens if we use colors instead?
