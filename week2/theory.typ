= Theoretical Exercises - Week 2
#label("theoretical-exercises---week-2")
#strong[Like last week, it is very imporant that you try to solve every
exercise. It is not important that you answer correctly. Spend no more
than 5-10 min on each exercise. If you do not solve the exercise, focus
on understanding the question, and try to figure out what it is you do
not understand.]

The TA\'s will be very happy to answer questions during the TA session
or on the board.

Do not despair if you cannot solve them, but try to understand the
question and pinpoint which parts you do not understand.

= 1. Learning Types
#label("1-learning-types")
In this exercise you must distinguish between Supervised Learning and
Unsupervised Learning. Imagine you work at a company that sells
#emph[stuff]. The company stores information about its costumers. For
each costumer the company saves the following 5 attributes:

```
AGE, SEX, INCOME, RESIDENCE, MONEY USED AT COMPANY
```

Question 1: In each of the following examples you should determine if
the problem is a Supervised or Unsupervised learning problem.

-  The company wants to learn how to predict \'MONEY USED AT COMPANY\'
  given \'AGE\', \'SEX\', \'INCOME\' and \'RESIDENCE\'. Supervised or
  Unsupervised?

  Supervised

-  The company wants to learn ways of grouping costumers depending on
  \'AGE\'. Supervised or Unsupervised?

  Unsupervised

-  The company wants to learn how to predict \'SEX\' given \'MONEY SPENT
  AT COMPANY\' and \'AGE\'. Supervised or Unsupervised?

  Supervised

-  The company wants to target different groups of costumers depending
  on \'AGE\', \'INCOME\' and \'MONEY SPENT AT COMPANY\'. Supervised or
  Unsupervised?

  Unsupervised(?)

Question 2: In supervised learning the data is of the form
$D_"supervised" = {(x_1, y_1), ..., (x_n, y_n)}$.
In unsupervised learning we have data of the form
$D_"unsupervised" = {x_1, ..., x_n}$.

Write the form the data would take in each case from Question 1.

HINT: Possible solutions to two of the cases

$ D eq brace.l 20 upright(" years") comma #h(0em) 21 upright(" years") comma #h(0em) 23 upright(" years") comma dot.basic dot.basic dot.basic brace.r $
$ D eq brace.l lr((lr([100 upright(" kr") comma #h(0em) 22 upright(" years")]) comma upright(" male"))) comma #h(0em) lr((lr([120 upright(" kr") comma #h(0em) 30 upright(" years")]) comma upright(" female"))) comma dot.basic dot.basic dot.basic brace.r $

= 2. Regression Or Classification
#label("2-regression-or-classification")
Question 1: In each of the following examples you should distinguish
between regression and classification.

-  In the previous question the company wanted to predict \'MONEY SPENT
  AT COMPANY\' from (\'AGE\', \'SEX\', \'INCOME\', \'RESIDENCE\'). Is
  that regression or classification?

-  Recognizing the color of wine as white, rose or red. Is that
  regression or classification?

-  Predicting a students grade in machine learning as a function of
  previous grades (on the 12 scale). Is that regression or
  classification?

-  Predicting email as spam, normal. Regression or classification?

Question 2: In supervised learning we want to approximate an unkown
target function $f colon X arrow.r Y$. In regression we could have
$Y eq bb(R)$ and in classification we could have
$Y eq brace.l c_1 comma dot.basic dot.basic dot.basic comma c_k brace.r$.

What is $Y$ in the above four cases?

= 3. The Perceptron
#label("3-the-perceptron")
=== Question 1: Running the Perceptron Learning Algorithm
#label("question-1-running-the-perceptron-learning-algorithm")
Assume we are given a training data set with 3 features, of which the
first is hardcoded to 1. The data consists of the four examples
$lr((lr((1 comma 2 comma 2)) comma 1)) comma lr((lr((1 comma 2 comma 3)) comma 1)) comma lr((lr((1 comma 4 comma 2)) comma minus 1)) comma lr((lr((1 comma 4 comma 0)) comma minus 1))$.
What hypothesis $w eq lr((w_0 comma w_1 comma w_2))$ does it return when
initialized with $w eq lr((0 comma 0 comma 0))$ and where we always pick
the first misclassified point when updating? NOTE: We assume
$s i g n lr((0)) eq 0$ and thus is different from all labels.

= 4. Choosing leaf return value in Decision Trees
#label("4-choosing-leaf-return-value-in-decision-trees")
== (Problem 1.12 from \'Learning From Data\')
#label("problem-112-from-learning-from-data")
Given $y_1 lt.eq dots.h.c lt.eq y_n in bb(R)$ find $h in bb(R)$ that on
average is closest to $y_1 comma dots.h comma y_n$ measured by squared
distance (least squares). That is,
$ h_(upright("mean")) eq upright("arg") min_h sum_(i eq 1)^n lr((h minus y_i))^2 $
Question 1: Show that $h_(upright("mean")) eq 1 / n sum_(i eq 1)^n y_i$
is the minimizer.

HINT: Computing the derivative may be worth the time and strain on your
brain.

HINT: a local minimum is a global minimum!

Question 2: Consider absolute deviation instead of squared distance,
i.e.

$ h_(upright(m e d)) eq upright("arg") min_h sum_(i eq 1)^n lr(|h minus y_i|) $

Show that
$h_(upright(m e d)) eq upright(m e d i a n) lr((y_1 comma dots.h comma y_n))$,
the median of the $y$ values is the minimizer.

HINT: Computing derivative may be usefull but $lr(|a|)$ is not
differentiable at zero but you may set it to zero (ask google about
subgradients if you are interested).

HINT: You can also argue purely algorithmically by thinking about what
happens with the cost as we sweep #emph[h] from $minus oo$ to $oo$).

HINT: a local minimum is a global minimum!

Question 3: What happens to the solutions
$h_(upright(m e a n)) comma h_(upright(m e d))$ if we add noise the last
element $y_n$, i.e. $y_n eq y_n plus epsilon$ for $epsilon arrow.r oo$.

Which method is more stable for outliers (data that looks nothing like
the remaining data)?

= 5. Decision Tree Cost with Entropy
#label("5-decision-tree-cost-with-entropy")
In this exercise we examine the entropy-based approach to constructing
decision stumps. Recall that, for any leaf $ell$, the entropy in that
leaf is
$H lr((ell)) := minus sum_(i eq 0)^(k minus 1) p_i lg_2 lr((p_i))$. Here
$p_i$ denotes the fraction of training examples in that leaf having the
label $i$. For binary classification, we thus have $k eq 2$.

The entropy of the entire tree $T$ is
$H lr((T)) := sum_ell lr((n_ell slash n)) H lr((ell))$, where $ell$ sums
over all leaves and $n_ell$ is the number of training examples in leaf
$ell$.

We consider classification into the $k eq 3$ classes Red (0), White (1),
Rose (2). We have $n eq 9$ training examples. The data has just one
feature. The data and labels are as follows:

$ X eq mat(delim: "[", 9 dot.basic; 33 dot.basic; 20 dot.basic; 27 dot.basic; 3 dot.basic; 6 dot.basic; 18 dot.basic; 14 dot.basic; 16 dot.basic; ) comma quad Y eq mat(delim: "[", 0; 0; 0; 0; 1; 1; 1; 2; 2; ) $

We consider the split $x lt 19$.

#strong[Task:]

-  Compute the entropy of the left and right leaf using this split.
-  Compute the entropy of the full tree using this split.

= 6: Implementing Regression Stumps
#label("6-implementing-regression-stumps")
In this exercise your task is to implement Regression Trees that consist
of one internal node (the root) and two leafs. Such trees are known as
Regression Stumps. For the loss/cost function we consider least squares
loss $lr((h lr((x)) minus y))^2$

This means that the learning algorithm has to find the best possible
feature to split the training data using a single feature value pair in
regards to Least Squares loss.

We have decided for you to present a Regression Stump by

-  idx: the data/feature vector index to consider in the root node (the
  one question asked)
-  val: the value to compare to for data feature idx in the root node
-  left: the value to return for a data point if it ends up in left leaf
  (x\[idx\] \< val) (only question type we consider in a node)
-  right: the value to return for a data point if it ends up in the
  right leaf (x\[idx\] \>\= val)

The approach we follow is as follows. Assume the input data has n data
points each a vector of $d$ real numbers.

#strong[Basic Algorithm:]

For each data feature f:

-  Compute for all possible values $v$ for feature $f$ in the training
  data, the least squares cost of the stump achieved by using feature f
  and value $v$ in the root using the optimal value in the two leafs.
  This gives a list of of costs, one for each split
  ($f comma v colon upright("cost")$).
-  Pick the split $f comma v$ with minimal cost and create the
  corresponding tree by setting idx, val, left, right

Your task is to give a full implementation of this algorithm and specify
the running time.

#strong[hint:] It is fine to implement a simple version for finding the
best split that takes $O lr((d n^2))$ time.

See #strong[regression\_stumps.py] for starter code.

#strong[You need to complete the RegressionStump class by completing the
following methods]

-  implement predict
-  implement score
-  implement fit

We advice to implement in the order specified.

= 7. BONUS exercise if time: Data that is not numbers
#label("7-bonus-exercise-if-time-data-that-is-not-numbers")
=== Question 1: Spam Filters
#label("question-1-spam-filters")
You are given the task to design a spam filter and you will be using
#strong[Linear Classification] and the perceptron algorithm (since that,
and decision trees, is all we know yet).

The input data consists of a list of (email, spam/not spam label), and
each email is represented by a variable length text string. Can you
train a spam filter using this data using the perceptron algorithm and
if so how? What issues do you see and do you have any ideas how they
could be adressed?

=== Question 2: Categorical Features
#label("question-2-categorical-features")
You are solving a problem with machine learning and have decided to use
linear classification (Perceptron). One of the data features is
categorical and has four unordered values: Apple, Banana, Grape, Mango.

How could you use that feature in a linear classification setup? (The
data should be a matrix of size $n times d$ of real numbers.

= 8. BONUS exercise if time: Classification Stumps in O(n d lg n ) time
#label("8-bonus-exercise-if-time-classification-stumps-in-on-d-lg-n--time")
In this exercise your job is to describe an algorithm that given a data
set of labelled data (two classses only), constructs the binary
classification tree (one internal node and two leafs) that minimize the
0-1 Loss over the training data. Such small classification trees are
called classification stumps.

i.e. given data
$ D eq brace.l lr((x_i comma y_i)) divides 1 lt.eq i lt.eq n comma y_i in brace.l 0 comma 1 brace.r comma x_i in bb(R)^d brace.r $
construct the binary classification tree $T$ that minimize
$ 1 / n sum_(i eq 1)^n 1_(T lr((x_i)) eq.not y_i) $ . Your algorithm
must only use $O lr((n d log n))$ time.

The root node considers only questions like $f_i lt 42$ and this may be
represented by the feature\'s index i and the value to compare with (42
here).

#strong[Hint: Consider each feature in turn and sort the data for that
feature and permute the labels $y$ with the same ordering and compute
the score for each relevant split in $O lr((n lg n))$ time]
