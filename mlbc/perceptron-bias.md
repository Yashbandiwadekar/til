# What Bias Actually Does in a Perceptron

**What:** Bias is an extra adjustable value that lets a neuron's decision
threshold sit anywhere, instead of being locked to exactly zero.

**Why it matters:** The weighted sum alone can't place a custom decision
point. Everyone can compute `z = w*x`, fewer people can explain *why* you
can't skip the bias term.

## Details

Say a neuron decides pass/fail from marks, with weight `w = 1`. Without bias:
```
z = w * x
```
For a student scoring 35: `z = 35`. But there's no way for the neuron to know
that 40 is the actual passing mark — `z` is just the raw score.

Add a bias `b = -40`:
```
z = w*x + b
```
Now `z = (1*35) - 40 = -5` (fail, z < 0) and `z = (1*60) - 40 = 20` (pass,
z >= 0). The bias moved the decision threshold from "z > 0" (meaningless) to
"z > 40 marks" (the actual rule) — that's the whole job of a bias term: it
shifts the boundary without touching the weights.

Same idea scales to multiple inputs: `z = w1*x1 + w2*x2 + b`, threshold at
`z >= 0` for the activation function.

## Source

MLBC Unit 3 notes (Artificial Neuron, Perceptron).
