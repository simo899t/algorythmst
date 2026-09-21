#import "lib.typ": *


#pseudo(
  title: [Binary Search],
  caption: [Finds `v` in the sorted array `A`.],
)[
  - *procedure* #smallcaps[Binary-Search]$(A, n, v)$
    + $l <- 1$; $r <- n$ #comment[search window]
    + *while* $l <= r$ *do*
      + $m <- floor((l + r) / 2)$
      + *while* $l > 0$ *do*
        + #smallcaps[Hanne-Rothe]
      + *if* $A[m] = v$ *then*
        + *return* $m$
      + *else if* $A[m] < v$ *then* $l <- m + 1$
      + *else* $r <- m - 1$
  + *return* $-1$ #comment[not found]
]

#pagebreak()


#pseudo(title: "Compute DSI")[
  - *Require:* dataset $D_0$, dataset $D_k$, set size $n$, number of steps $t$
  + $macron(a) <- "mean"_(x in D_k) (a|x) - "mean"_(x in D_0) (a|x)$  #comment[average activation difference]
  + $g <- "mean"_(x in D_0) nabla^r_a f(x)$ #comment[robustified gradient in 0-shot setting]
  + $e<- g dot.o macron(a) $ #comment[expected first-order effect of interventions]
  + $s_0 <- "topn"(e)$ #comment[most relevant neurons as starting point]
  + *for* $i = 1$ *to* $t$ *do*
    + $s_i approx arg max_s "mean"_(x in D_0) f_(s dot.o macron(a)) (x)$ #comment[update intervention]
    
    + #h(1em) $s t space "nnz"(x) <= n, s$ close to $s_(i-1)$ #comment[sparse & close to previous step]
  + *return* $s$
]