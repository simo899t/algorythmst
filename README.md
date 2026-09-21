# algorithmst

Beautiful pseudocode blocks for Typst, built on [lovelace](https://typst.app/universe/package/lovelace).

- Clean horizontal rules (booktabs style), no side borders
- Line numbers (`1:`) and indent guides
- Optional numbered title, rendered as **Algorithm N:** followed by the title in small caps
- Optional caption below the block
- Easy right-aligned comments with `#comment[...]`
- Display math is centred automatically

## Usage

```typst
#import "@local/algorithmst:0.1.0": *

#pseudo(
  title: [Binary Search],
  caption: [Finds `v` in the sorted array `A`.],
)[
  + *procedure* #smallcaps[Binary-Search]$(A, n, v)$
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
```


```typst
#import "@local/algorithmst:0.1.0": *

#pseudo(title: "Compute DSI")[
  - *Require:* dataset $D_0$, dataset $D_k$, set size $n$, number of steps $t$
  + $macron(a) <- "mean"_(x in D_k) (a|x) - "mean"_(x in D_0) (a|x)$ 
  + $g <- "mean"_(x in D_0) nabla^r_a f(x)$
  + $e<- g dot.o macron(a)$
  + $s_0 <- "topn"(e)$
  + *for* $i = 1$ *to* $t$ *do*
    + $s_i apx arg max_s "mean"_(x in D_0) f_(s dot.o macron(a)) (x)$
    
    + #h(1em) $s t space "nnz"(x) <= n, s$ close to $s_(i-1)$
  + *return* $s$
]
```

Without `title` and `caption`, `pseudo` gives just the framed block.

## API

| Function | Description |
| --- | --- |
| `pseudo(body, title: none, caption: none, ..args)` | Pseudocode block. Extra `args` go to lovelace's `pseudocode-list`. |
| `comment(body)` | Gray, right-aligned comment at the end of a line. |

## License

MIT

---

