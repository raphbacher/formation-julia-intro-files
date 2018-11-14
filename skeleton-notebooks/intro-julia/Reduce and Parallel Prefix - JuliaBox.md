


This notebook accompanies the [workshop paper](http://jiahao.github.io/parallel-prefix/) by Jiahao Chen and Alan Edelman entitled "Parallel Prefix Polymorphism Permits Parallelization, Presentation & Proof" and will appear in the proceedings of the [First Workshop for High Performance Technical Computing in Dynamic Languages](http://jiahao.github.io/hptcdl-sc14/), held in conjunction with [SC14: The International Conference on High Performance Computing, Networking, Storage and Analysis](http://sc14.supercomputing.org/).



# `reduce()`

Reduction applies a binary operator to a vector repeatedly to return a scalar. Thus + becomes sum, and * becomes prod.

It is considered a basic parallel computing primitive.



You can also use reduce to compute Fibonacci numbers using their recurrences.

$$\begin{pmatrix} f_2 \\f_1 \end{pmatrix} = \begin{pmatrix} f_1 + f_0 \\ f_1 \end{pmatrix}
= \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix} \begin{pmatrix} f_1 \\ f_0 \end{pmatrix} $$

$$\begin{pmatrix} f_{n+1} \\ f_n \end{pmatrix} = \dots
= \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}^n \begin{pmatrix} f_1 \\ f_0 \end{pmatrix} $$

From this, you can show that

$$\begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}^n  = \begin{pmatrix} f_{n+1} & f_n \\ f_n & f_{n-1} \end{pmatrix} $$

(this applies reduce to the same argument over and over again -- there are of course other ways)

You can solve recurrences of any complexity using `reduce`. For example, `reduce` can compute a Hadamard matrix from its definition in terms of its submatrices:

$$H_2 = \begin{pmatrix} H_1 & H_1 \\ H_1 & -H_1 \end{pmatrix} = \begin{pmatrix} 1 & 1 \\ 1 & -1 \end{pmatrix} \otimes H_1$$

and so on.

(Note: this is just using reduce to compute a matrix power.
One can think of alternative ways for sure.)

In the following example we apply `reduce()` to  function composition:

# `prefix`

Having discussed `reduce`, we are now ready for the idea behind prefix sum.
Prefix or scan is long considered an important parallel
primitive as well.

Suppose you wanted to compute the partial sums of a vector, i.e. given
`y[1:n]`, we want to overwrite the vector `y` with the vector of partial sums

```julia
new_y[1] = y[1]
new_y[2] = y[1] + y[2]
new_y[3] = y[1] + y[2] + y[3]
...
```

At first blush, it seems impossible to parallelize this, since

```julia
new_y[1] = y[1]
new_y[2] = new_y[1] + y[2]
new_y[3] = new_y[2] + y[3]
...
```

which appears to be an intrinsically serial process.

However, it turns out that because addition (`+`) is associative, we can regroup the _order_ of how these sums are carried out. (This of course extends to other associative operations such as multiplication.) Another ordering of 8 associative operations is provided by `prefix8!`:

# Polymorphism for visualization

We can visualize the operations with a little bit of trickery. In Julia, arrays are simply types that expose the array protocol. In particular, they need to implement  methods for the generic functions `length`, `getindex` and `setindex!`. The last two are used in indexing operations, since statements

    y = A[1]
    A[3] = y
    
get desugared to

    y = getindex(A, 1)
    setindex!(A, y, 3)
    
respectively.

We can trace through the iterable by introduce a dummy array type, `DummyArray`, which stores no useful information but records every access to `getindex` and `setindex!`.

Specifically:

- `length(A::DummyArray)` returns an integer that is stored internally in the `A.length` field
- `getindex(A::DummyArray, i)` records read access to the index `i` in the `A.read` field and always retuns `nothing`.
- `setindex!(A::DummyArray, x, i)` records write access to the index `i`. The `A.history` field is appended with a new tuple consisting of the current `A.read` field and the index `i`. 

The way `DummyArray` works, it assumes an association between a single `setindex!` call and and all the preceding `getindex` calls since the previous `setindex!` call, which is sufficient for the purposes of tracing through prefix calls.

We also need a dummy associative operator to pass to the prefix call.

Now let's visualize this! Each entry in `A.history` is rendered by a gate object:

Now we render the whole algorithm. We have to scan through the trace twice; the first time merely calculates the maximum depth that needs to be drawn and the second time actually generates the objects.

Now we can see that `prefix!` rearranges the operations to form two spanning trees:

as contrasted with the serial code:

# Polymorphism for parallel operations

Now let's run `prefix` in parallel on every core on the CPU. Use `addprocs` to attach additional worker processes.

For 8 processes, the serial version requires 7 operations. The parallel version uses 11 operations, but they are grouped into 5 simultaneous chunks of operations. Hence we expect that the parallel version runs in 5/7 the time needed for the naïve serial code.

The exact same serial code now runs in parallel thanks to multiple dispatch!

# Formal verification

Julia allows us to implement very easily the interval of summations monoid technique for verifying the correctness of prefix sums ([doi:10.1145/2535838.2535882](http://dx.doi.org/10.1145/2535838.2535882)).

Wrong kernels produce type errors!

# Experimental code which doesn't work

In this section I play with other parallel prefix algorithms. All the ones here suffer from read antidependencies and they break the logic I used to draw the gates.
