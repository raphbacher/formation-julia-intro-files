
# Autodiff:  <br> Calculus  from another angle 
(and the special role played by Julia's multiple dispatch and compiler technology)

(Alan Edelman, 2017)


  The first time I heard about automatic differentiation, it was easy for me to imagine what it was.  I was wrong.  In my head, I thought it was straightforward symbolic differentiation applied to code.  I kind of imagined it was like executing Mathematica or Maple, or even just automatically doing what I learned to do in my calculus class. 
  <img src="derfunc.gif" width="230">
  .... and anyway if it was not that, then it must be finite differences, like one learns in a numerical computing class.
  
<img src="http://image.mathcaptain.com/cms/images/122/Diff%202.png" width="150">



## Babylonian sqrt

I would like to use a simple example, computation of sqrt(x), where for me how autodiff works came as both a mathematical surprise, and a computing wonder.  The example is  the Babylonian algorithm, known to man for millenia, to compute sqrt(x):  


 > Repeat $ t \leftarrow  (t+x/t) / 2 $ until $t$ converges to $\sqrt{x}$.
 
 Each iteration has one add and two divides. For illustration purposes, 10 iterations suffice.

Check that it works:

## ...and now the derivative, almost by magic

Sum Rule: (x+y)' = x' + y' <br>
Quotient Rule: (x/y)' = (yx'-xy') / y^2

## It just works!

How does it work?  We will explain in a moment.  Right now marvel that it does.  Note we did not
import any autodiff package.  Everything is just basic vanilla Julia.

## Symbolically

We haven't yet explained how it works, but it may be of some value to understand that the below is mathematically
equivalent, though not what the computation is doing.

Notice in the below that Babylonian works on SymPy symbols.

## How autodiff is getting the answer
Let us by hand take the "derivative" of the Babylonian iteration with respect to x. Specifically t′=dt/dx

What just happened?  Answer: We created an iteration by hand for t′ given our iteration for t. Then we ran the iteration alongside the iteration for t.

How did this work?  It created the same derivative iteration, using very general rules that are set once and need not be written by hand.

Important:: The derivative is substituted before the JIT compiler, and thus efficient compiled code is executed.

## Dual Number Notation

Instead of D(a,b) we can write a + b ϵ, where ϵ satisfies ϵ^2=0.  (Some people like to recall imaginary numbers where an i is introduced with i^2=-1.) 

Others like to think of how engineers just drop the O(ϵ^2) terms.

The four rules are

$ (a+b\epsilon) \pm (c+d\epsilon) = (a \pm c) + (b \pm d)\epsilon$

$ (a+b\epsilon) * (c+d\epsilon) = (ac) + (bc+ad)\epsilon$

$ (a+b\epsilon) / (c+d\epsilon) = (a/c) + (bc-ad)/d^2 \epsilon $


## Generalization to arbitrary roots

## Forward Diff
Now that you understand it, you can use the official package

## Close Look at Convergence
