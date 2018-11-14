
### Notebook 1
#### 1.1 
Look up docs for the `convert` function.

#### 1.2 
Assign `365` to a variable named `days`. Convert `days` to a float.

#### 1.3 
See what happens when you execute

```julia
convert(Int64, '1')
```
and

```julia
parse(Int64, '1')
```

What's the difference?

### Notebook 2
#### 2.1 
Create a string that says "hi" 1000 times.

#### 2.2
Declare two variables

```julia
a = 3
b = 4
```
and use them to create two strings:
```julia
"3 + 4"
"7"
```

### Notebook 3

#### 3.1 
Create an array, `a_ray`, with the following code:

```julia
a_ray = [1, 2, 3]
```

Add the number `4` to the end of this array and then remove it.

#### 3.2 
Try to add "Emergency" as key to `myphonebook` with the value `string(911)` with the following code
```julia
myphonebook["Emergency"] = 911
```

Why doesn't this work?

#### 3.3 
Create a new dictionary called `flexible_phonebook` that has Jenny's number stored as a string and Ghostbusters' number stored as an integer. 

#### 3.4
Add the key "Emergency" with the value `911` (an integer) to `flexible_phonebook`.

#### 3.5
Why can we add an integer as a value to `flexible_phonebook` but not `myphonebook`? How could we have initialized `myphonebook` so that it would accept integers or strings as values?

### Notebook 4

#### 4.1 
Write a loop that prints the squares of integers between 1 and 100.

#### 4.2

Add to the code above a bit to create a dictionary, `squares` that holds integers and their squares as key, value pairs such that

```julia
squares[10] == 100
```

#### 4.3 
Use an array comprehension to create an an array that stores the squares of all integers between 1 and 100.

### Notebook 5

#### 5.1 
Write a conditional statement that prints a number if the number is even and the string "odd" if the number is odd.

#### 5.2 
Rewrite the code from 5.1 using a ternary operator.

### Notebook 6

#### 6.1 
Write a function that adds 1 to its input.

#### 6.2 
Use `map` or `broadcast` to increment every element of matrix `A` by `1`.

#### 6.3 
Use the broadcast dot syntax to increment every element of matrix `A` by `1`.

### Notebook 7

#### 7.1 
Load the Primes package (source code at https://github.com/JuliaMath/Primes.jl).

#### 7.2 
Verify that you can now use the function `primes` to grab all prime numbers under 1,000,000.

### Notebook 8

#### 8.1 
Given
```julia
x = -10:10
```
plot y vs. x for $y = x^2$.

#### 8.2 
Execute the following code

and then create a $4x1$ plot that uses `p1`, `p2`, `p3`, and `p4` as subplots.

### Notebook 9

#### 9.1

Extend the function `foo`, adding a method that takes only one input argument, which is of type `Bool`, and prints "foo with one boolean!"

#### 9.2

Check that the method being dispatched when you execute 
```julia
foo(true)
```
is the one you wrote.

### Notebook 10

#### 10.1
Take the inner product (or "dot" product) of a vector `v` with itself.

#### 10.2
Take the outer product of a vector v with itself.

### Notebook 11

#### 11.1

What are the eigenvalues of matrix A?

```
A =
[
 140   97   74  168  131
  97  106   89  131   36
  74   89  152  144   71
 168  131  144   54  142
 131   36   71  142   36
]
```

#### 11.2 
Create a `Diagonal` matrix from the eigenvalues of `A`.

#### 11.3 
Create a `LowerTriangular` matrix from `A`.
