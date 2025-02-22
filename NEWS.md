# ChainLadder 0.2.16 

 * Fixed typo checking for weight argument in glmReserve. Thanks to Kennedy Mwavu for reporting this issue
 * Fixed weights in CDR.MackChainLadder. Thanks to Giorgia Chieruzzi for contributing the patch

# ChainLadder 0.2.15 

 * Started using pkgdown to create package website 
 * Added ChainLadder hexagon graphic
 * Moved vignettes/NEWS.Rmd to NEW.md to autogenerate changelog with pkgdown
 * Clarified how to extract MackChainLadder objects in package vignette 
 
# ChainLadder 0.2.14
 
 * Updated package dependencies to address a warning from CRAN

# ChainLadder 0.2.13
 
 * Updated URLs in the bibliography of the package vignette and help files

# ChainLadder 0.2.12
 
 * Moved continuous integration testing from TravisCI to GitHub Actions
 * Changed vignette format from Sweave to RMarkdown to facilitate easier
   testing using GitHub Actions

# ChainLadder 0.2.11

 * Fixed as.triangle for a 'long' data set, when input data had missing values.
 Thanks to Dimitri Minassian for reporting this issue.
 * Fixed standard error estimation in  MackChainLadder when tail factor > 1 
 and alpha = 2. Thanks to Valentin Cornaciu for reporting this issue.

# ChainLadder 0.2.10

 * Added Berquist-Sherman Paid Claim Development Adjustment methods to adjust 
 paid claims based on the underlying relation between paid and closed claims.
 * Added tests to check calendar year effect, correlation between development
 factors and inflation.
 
 Thanks to Marco De Virgilis.

# ChainLadder 0.2.9

 * Fix to as.triangle.data.frame. The labels of origin and development period 
 were mixed up with the move away from reshape2 to aggregate in version 0.2.8. 
 Thanks to Edward Tasker for reporting this issue.

# ChainLadder 0.2.8

 * Fix to print statements to align them with the generic print methods. 
 Thanks to Markus Senn
 * Clarified how the 'weights' argument in chainladder and MackChainLadder 
 can be used 
 * Removed dependency on reshape2 as it has been deprecated

# ChainLadder 0.2.7

 * New quantile method for 'MackChainLadder' andv function QuantileIFRS17
 to estimate the IFRS 17 Risk Adjustment. Thanks to Eric Dal Moro and Yuriy
 Krvavych

# ChainLadder 0.2.6
  
  * New function 'triangle' to create a triangle from the given set of vectors 
    of observed data. Thanks to Vincent Goulet

# ChainLadder 0.2.5
  
  * Fixed bug in Mack.S.E function when "sigma[i - 2]^2" is zero.
    Thanks to Patrick Green for reporting and fixing the issue.

# ChainLadder 0.2.4
  
  * Fixed meta information of NEWS vignette, so it will be shown
    as NEWS on CRAN

# ChainLadder 0.2.3
  
## Changes

### NEWS file

Moved NEWS file to Markdown format.

### Triangles may now have non-numeric rownames

Previously it was required that the row and column names of a triangle be convertible to numeric, although that "requirement" did not always cause a problem.
For example, the following sets the rownames of GenIns to the beginning Date
of the accident year.

```
x <- GenIns
rownames(x) <- paste0(2001:2010, "-01-01")
```

A plot with the `lattice=TRUE` option, which previously would blow up,
now displays with nice headings.

```
plot(x, lattice=TRUE)
```

It can often be useful to have "origin" values that are 
not necessarily convertible to numeric.
For example, suppose you have a table of claim detail at various evaluation dates.
Invariably, such a table will have a Date field holding the date of loss.
It would be nice to be able to summarize that data by accident year "cuts".
It turns out there's a builtin function in R that will get you most of the way there. It's called 'cut'.

Here we take the GenIns data in long format and
generate 50 claims per accident period.
We assign each claim a random date within the year.
The incurred (or paid) "value" given is a random perturbation of one-fiftieth of
`GenInsLong$value.`

We accumulate the detail into an accident year triangle using
ChainLadder's `as.triangle` method.
The summarized triangle displayed at the end is very similar to `GenIns`, and
has informative row labels.

```
x <- GenInsLong
# start off y with x's headings
y <- x[0,]
names(y)[1] <- "lossdate"
set.seed(1234)
n = 50 # number of simulated claims per accident perior
for (i in 1:nrow(x)) {
  y <- rbind(y,
             data.frame(
               lossdate = as.Date(
                 as.numeric(as.Date(paste0(x[i, "accyear"]+2000, "-01-01"))) +
                   round(runif(n, 0, 364),0), origin = "1970-01-01"),
               devyear = x[i, "devyear"],
               incurred.claims = rnorm(n, mean = x[i, "incurred claims"] / n,
                                         sd = x[i, "incurred claims"]/(10*n))
             ))
}
# here's the magic cut
y$ay <- cut(y$lossdate, breaks = "years")
# this summarized triangle is very similar to GenIns
as.triangle(y, origin = "ay", dev = "devyear", value = "incurred.claims")
```

The user is encouraged to experiment with other cut's --
e.g., `breaks = "quarters"` will generate accident quarter triangles.

### New as.LongTriangle function

A new function, `as.LongTriangle`, will convert a triangle
from "wide" (matrix) format to "long" (data.frame) format.
This differs from ChainLadder's
as.data.frame.triangle method in that the 
rownames and colnames of Triangle are stored as **factors**.
This feature can be particularly important when plotting a triangle
because the order of the "origin" and "dev" values is important.

Additionally, the columns of the resulting data frame
may be renamed from the default values ("origin", "dev", and "value")
using the "varnames" argument for "origin"/"dev"
and the "value.name" argument for "value".

In the following example, the `GenIns` triangle in ChainLadder
is converted to a `data.frame` with non-default names:

```
GenLong <- as.LongTriangle(GenIns, 
              varnames = c("accident year", "development age"),
                           value.name = "Incurred Loss")
```

In the following plot,
the last accident year and the last development age are shown last, 
rather than second as they would have been if displayed alphabetically
(ggplot's default for character data):

```
library(ggplot2)
ggplot(GenLong, aes(x=`development age`, y = `Incurred Loss`,
                    group = `accident year`, color = `accident year`)) +
  geom_line()
```


### glmReserve "exposure" attribute may now have names

Previously, when an "exposure" attribute was assigned to a triangle
for use with `glmReserve`,  it was assumed/expected that the user would supply the values in the same order as the accident years. 
Then, behind the scenes, glmReserve would use an arithmetic formula to match
the exposure with the appropriate accident year using the numeric "origin" values
after the triangle had been converted to long format.

`glmReserve` now allows for "exposure" to have "names"
that coincide with the rownames of the triangle,
which are used to match to origin in long format.
Here is an example, newly found in `?glmReserve`.

```
  GenIns2 <- GenIns
  rownames(GenIns2) <- paste0(2001:2010, "-01-01")
  expos <- (7 + 1:10 * 0.4) * 10
  names(expos) <- rownames(GenIns2)
  attr(GenIns2, "exposure") <- expos
  glmReserve(GenIns2)
```

### glmReserve adds support for negative binomial GLM

The `glmReserve` function now supports the negative binomial GLM, 
a more natural way to model over-dispersion in count data.
The model is fitted through the `glm.nb` function from the `MASS` package. 

To fit the negative binomial GLM to the loss triangle, 
simply set `nb = TRUE` in calling the glmReserve function:

```
(fit6 <- glmReserve(GenIns, nb = TRUE))
```

### New unit tests

New files in the `/inst/unittests/` folder can be used for
future enhancements

  * runit.Triangles.R for Triangles.R
  * runit.glmReserve.R for glmReserve.R

Contributors of new contributions to those R files are encouraged
to utilize those runit scripts for testing, 
and, of course, add other runit scripts as warrantted. 

### Clarified warnings issued by MackChainLadder

By default, R's `lm` method generates a warning when it detects
an "essentially perfect fit".
This can happen when one column of a triangle is identical to the previous column;
i.e., when all link ratios in a column are the same.
In the example below, the second column is a fixed constant, 1.05,
times the first column.
ChainLadder previously issued the lm warning below.

```
x <- matrix(byrow = TRUE, nrow = 4, ncol = 4, 
            dimnames = list(origin = LETTERS[1:4], dev = 1:4),
            data = c(
              100, 105, 106, 106.5,
              200, 210, 211, NA,
              300, 315, NA, NA,
              400, NA, NA, NA)
            )
mcl <- MackChainLadder(x, est.sigma = "Mack")

Warning messages:
1: In summary.lm(x) : essentially perfect fit: summary may be unreliable
2: In summary.lm(x) : essentially perfect fit: summary may be unreliable
3: In summary.lm(x) : essentially perfect fit: summary may be unreliable
```
which may have raised a concern with the user when none was warranted.

Now ChainLadder issues an "informational warning":

```
x <- matrix(byrow = TRUE, nrow = 4, ncol = 4, 
            dimnames = list(origin = LETTERS[1:4], dev = 1:4),
            data = c(
              100, 105, 106, 106.5,
              200, 210, 211, NA,
              300, 315, NA, NA,
              400, NA, NA, NA)
            )
```

```
mcl <- MackChainLadder(x, est.sigma = "Mack")
```

## Bug fixes

### Fixed tail extrapolation

Fixed tail extrapolation in Vignette.
(Thanks to Mark Lee.)

  * Fixed summary calls.
  * Updated documentation for weights parameter of chainladder method.
  * Fixes for tail extrapolation in Vignette and Chainladder
      1) The calculation for the tail log-linear extrapolation given in
	       the vignette had a minor error.  This has been corrected,
	       and the result now agrees with the results of
	       MackChainLadder(RAA, tail=TRUE).
      2) The calculation of the tail using the log-linear extrapolation
	       in ChainLadder.R had a potential error - when clratios has
	       values of less than unity they are dropped, but the extrapolation
	       was started from a quantity indexed by the length of f, not
	       the value of fn.  This changes the results if clratios has a
	       pattern like e.,g.: ... 1.1, 0.98,1.01,0.005 (i.e. a link ratio
	       less than unity which is not the last value)
      3) Minor fix to the comments in ChainLadder.R and MackChainLadder.R,
	       fixing notation for alpha which is now consistent with the
	       documentation and Mack's original paper.
	       

# ChainLadder 0.2.2 [2015-08-31]
  

  * Added back functionality to estimate the index parameter for the compound 
    Poisson model in 'glmReserve' (now depends on package cplm). 
    This works for both 'formula' and 'bootstrap'. 
    
  * Added methods 'resid' and plot for class 'glmReserve' (now depends on 
    ggplot2)


# ChainLadder 0.2.1

## New Features

  * New function PaidIncurredChain by Fabio Concina, based on the
    2010 Merz & Wuthrich paper Paid-incurred chain claims reserving method

  * plot.MackChainLadder and plot.BootChainLadder gained new argument     
    'which', allowing users to specify which sub-plot to display. 
    Thanks to Christophe Dutang for this suggestion.
  
## Changes
  
  * Updated NAMESPACE file to comply with new R CMD checks in R-3.3.0
  
  * Removed package dependencies on grDevices and Hmisc
  
  * Expanded package vignette with new paragraph on importing spreadsheet
    data, a new section "Paid-Incurred Chain Model" and an added example for
    a full claims development picture in the "One Year Claims Development
    Result" section.


# ChainLadder 0.2.0

## New Features

  * New generic function CDR to estimate the one year claims development
    result. S3 methods for the Mack and bootstrap model have been 
    added already:
      - CDR.MackChainLadder to estimate the one year claims 
        development result of the Mack model without tail factor, 
        based on papers by Merz & Wuthrich (2008, 2014)
      - CDR.BootChainLadder to estimate the one year claims 
        development result of the bootstrap model, using ideas and code 
        by Giuseppe Crupi.
        
  * New function tweedieReserve to estimate reserves in a GLM framework,
    including the one year claims development result.

  * Package vignette has new chapter 'One Year Claims Development
    Result'. 

  * New example data MW2008 and MW2014 form the Merz & Wuthrich (2008, 2014) 
    papers
  
## Changes

  * Source code development moved from Google Code to GitHub:
    https://github.com/mages/ChainLadder
  
  * as.data.frame.triangle now gives warning message when dev. period 
    is a character  

  * Alessandro Carrato, Giuseppe Crupi and Mario Wuthrich have been 
    added as authors, thanks to their major contribution to code and
    documentation
  
  * Christophe Dutang, Arnaud Lacoume and Arthur Charpentier have been 
    added as contributors, thanks to their feedback, guidance and 
    code contribution   


# ChainLadder 0.1.9

## Changes

  * Updated README and DESCRIPTION file to comply with changes of 
    CRAN policy.


# ChainLadder 0.1.8

## Bug Fixes
  
  * BootChainLadder produced warnings for triangles that had static 
    developments when the argument process.distr was set to "od.pois".
  * as.triangle.data.frame didn't work for a data.frame less than three rows
  * Arguments xlab and ylab were not passed through in plot.triangle, when
    lattice=TRUE

# ChainLadder 0.1.7

## Changes

  * The glmReserve function currently doesn't allow the parameter var.power
    to be set to NULL, which would have called the cpglm function of the 
    cplm package. The cplm package is due to dependency issues with lme4 
    no longer available via CRAN.

# ChainLadder 0.1.6

## New Features

  * A new function, CLFMdelta, finds the value of 
    delta such that the model coefficients resulting from 
    the 'chainladder' function with that value for argument delta are 
    consistent with an input vector of 'selected' age-to-age factors,
    subject to restrictions on the 'selected' factors relative to
    the input 'Triangle'. See the paper 
    "A Family of Chain-Ladder Factor Models for Selected Link Ratios"
    by Bardis, Majidi, Murphy, Variance Journal
  
  * A new 'coef' method returns the age-to-age factor coefficients of 
    the regression models estimated by the 'chainladder' function.
    
  * Exports a function "LRfunction" that calculates a Triangle's 
    link ratio function and can be used to plot the space of 
    "reasonable link ratio selections" per the CLFM paper.
    
## Changes

   * Removed some package dependencies in DESCRIPTION and moved them 
     to Imports.


# ChainLadder 0.1.5-6

## New Features

  * The list output of the MackChainLadder function now includes
    the parameter risk and process risk breakdowns of the total risk
    estimate for the sum of projected losses across all origin years
    by development age.
  * The Mack Method's recursive parameter risk calculation now enables 
    Dr. Mack's original two-term formula (the default) and optionally
    the three-term formula found in Murphy's 1994 paper and in the 
    2006 paper by Buchwalder, Buhlmann, Merz, and Wuthrich.
  * A few more Mack Method examples.


# ChainLadder 0.1.5-5

## Bug Fixes

  * The phi-scaling factor in BootChainLadder was incorrect. 
    Instead of calculating the number of data items in the upper left
    triangle as n*(n+1)/2, n*(n-1)/2 was used. Thanks to Thomas
    Girodot for reporting this bug.


# ChainLadder 0.1.5-4

## New Features

  * The function "getLatestCumulative" adds attributes to 
    the result
    - names = origin (rownames) from the Triangle
    - rowsname = name of row dimension of Triangle
    - colnames = dev (colnames) from Triangle
    - colsname = name of the column dimension of Triangle
    The function has an additional argument, na.values, a 
    vector of values (e.g., zero) that are synonymous with NA 
    when searching for the rightmost non-NA value
  * as.triangle.data.frame now aggregates multiple data.frame
    records when more than one (origin, dev) observation is
    found (the previous version took the first observation).

## Changes

   * The vignette has been updated with sections on Multivariate
     chain-ladder, Clark's method and Generalised linear model methods 
   * MunichChainLadder no longer accepts triangles with more rows than
     columns as the function is not laid out for such data sets
     yet. Thanks to Ben Escoto for highlighting this issue. 


# ChainLadder 0.1.5-3

## New Features

   * The function "glmReserve" now simulates predictive distributions
     of the loss reserves when bootstrapping is used.
   * "glmReserve" allows the variance function of the compound Poisson 
     distribution to be estimated from the data, using the estimation 
     method provided by the "cplm" package. 
   * We offer a new function "MultiChainLadder2" to fit several commonly 
     used multivariate chain ladder models, which is much easier to use. 

## Changes

   * The output from "glmReserve" is made to be of class "glmReserve", instead 
     of class "glm" used in previous versions. 
   * Fix bugs when exposure is included in "glmReserve". Thanks to
     Alessandro Carrato for reporting this bug. 
   * The "mse.method" argument in "glmReserve" supports partial match.
   * Dramatic improvement on the documentation of "MultiChainLadder".
   * Complete the sections of "MultiChainLadder" and "glmReserve" in
     the vignettes.  


# ChainLadder 0.1.5-2

## New Features

  * We started writing a vignette. The current version is still draft
    and far from complete. Feedback will be much appreciated.

## Changes

  * Removed .Internal call to make ChainLadder compliant with R 2.15.0 
  * Changed argument "t" in plot.triangle to "type" in order to be
    consistent with plot.default

## Bug Fixes

  * as.triangle() gave triangles back, with development periods not 
    ordered, when the input data frame had unordered development 
    periods in different units, e.g. dev=c(1,100,10)
    Thanks to Ben Escoto for reporting this issue.


# ChainLadder 0.1.5-1

  * Internal changes to plot.MackChainLadder to pass new checks
    introduced by R 2.14.0.
  * Commented out unnecessary creation of 'io' matrix in ClarkCapeCod
    function. Allows for analysis of very large matrices for CapeCod
    without running out of RAM. 'io' matrix is an integral part of
    ClarkLDF, and so remains in that function.
  * plot.clark method
     - Removed "conclusion" stated in QQplot of clark methods.
     - Restore 'par' settings upon exit
     - Slight change to the title
  * Reduced the minimum 'theta' boundary for weibull growth function
  * Added warnings to as.triangle if origin dev. period are not numeric
   

# ChainLadder 0.1.5-0

## New Features

  * New function glmReserve, which implements loss reserving models
    within the generalized linear model framework following a paper by
    England P. and Verrall R. (1999) 


# ChainLadder 0.1.4-4

 * Minor changes to reflect a more rigours package build process for
   R >= 2.14.0
 * Start up message uses now packageStartupMessage rather than cat to
   allow the message to be suppressed.


# ChainLadder 0.1.4-3

## New Features

  * ClarkLDF and ClarkCapeCod functions were reorganized to clarify
    the delivery and presentation of the methods' results
    - Individual components now contain distinct values within
      Clark's methodologies 
    - 'summary' methods produce "reports" that display results in
      the form of typical loss development and Bornhuetter-Ferguson
      exhibits
    - "Table" functions now produce the results as shown in the
      tables on pp. 64, 65 and 68 of Clark's paper
    - A 'vcov' method produces the covariance matrix of the
      estimated parameters
  * An 'ata' function exists to calculate the "age-to-age" development
    factors of a loss "triangle", as well as the simple and volume
    weighted averages


# ChainLadder 0.1.4-2

## Bug fixes

  * The TruncatedGrowth function value under the Clark Cape Cod method
    was incorrectly printed in the Table68 data.frame when the
    calculations were to be based on the average date of loss (argument
    adol=TRUE). The underlying calculations used the correct adol
    adjustment, only the printed output was incorrect.


# ChainLadder 0.1.4-1

## New Features

  * ClarkLDF and ClarkCapeCod functions: additional functionality
	- Clark's methods now work for "one-row triangles" -- i.e.,
	  loss experience from only one origin period
	- Clark's methods work for "phase-shifted" triangles -- i.e.,
	  triangles whose first age does not coincide with the end of
	  the origin period. Example: accident year origin periods with
	  September 30th evaluation dates.

  * A 'vcov' method now exists to produce the covariance matrix of the
    estimated parameters using the approach in Clark's paper

  * Additional values (in lists) returned by Clark's methods:
	- FI = Fisher Information matrix as Clark defines it in his
	  paper (i.e., without the sigma^2 value)
	- dR = the gradient of the reserves function evaluated at the
	  optimal parameter values
	- value = value of the log-likelihood function at the solution
	- counts = number of evaluations of the log likelihood and its
	  derivative before convergence

  * Fine-tuning of maximum likelihood numerical algorithm's control
    parameters
	- Enable more consistent convergence properties between R's
   	  32-bit and 64-bit environments
  	- Initial starting values for the weibull function were
    	  adjusted for successful convergence across a wider set of
    	  triangles
  	- Upper bounds introduced for "L-BFGS-B" maximum likelihood
	  method to bound weibull away from unity at too early an age

  * If the solution is found at the boundary of the parameter region,
    it is conceivable that a "more optimal" solution might exist if the
    boundary constraints were not as conservative, so a warning is given

## Bug fixes

  * The parameters returned by the methods were the scaled versions;
    they now at their original scales.


  * The loss development factor (LDF) being returned by ClarkCapeCod
    was not documented


# ChainLadder 0.1.4-0

## New Features

  * New implementation of the methods in David Clark's "LDF Curve
    Fitting" paper in the 2003 Forum by Daniel Murphy.

	- Includes LDF and CapeCod methods (functions 'ClarkLDF' and
          'ClarkCapeCod', respectively)
	- Programmed to handle log-logistic and weibull growth functions
	- Printing an object returned by the function results in a
          table similar to that on p. 65 of the paper
	- Plotting such an object results in four residual plots,
          including a Q-Q plot with the results of the Shapiro-Wilk
          test


# ChainLadder 0.1.3-4
   
## Bug fixes

  * 'residuals.MackChainLadder': Zero weights applied to
    MackChainLadder caused an error. Thanks to Ernesto Schirmacher for
    reporting this bug.  


# ChainLadder 0.1.3-3

## New Features

  * New multivariate chain ladder function 'MultiChainLadder' by Wayne
    (Yanwei) Zhang  <actuaryzhang@uchicago.edu>
  * New function 'getLatestCumulative' available. It returns for a
    given triangle the most recent values for each origin period.
  * New demos! Type demo(package='ChainLadder') for more information.
  * Demos exist for the following topics: ChainLadder,
    MackChainLadder, DatabaseExamples, MSOffice, MultiChainLadder
  * New SWord example file ChainLadder_SWord_Example.doc, which
    demonstrates how R code snippets can be integrated into a Word
    file.
    The following R command system.file("SWord",
    package="ChainLadder") will show the directory of the file.


## User-visible changes

  * The examples in MackChainLadder and ChainLadder-package have been
    shortened and demo files have been created instead.
    The examples focus on the syntax of the function calls, while the
    demos give more detailed information on how you might want to use
    the functions in a business context.
   
## Bug fixes

  * 'plot.MunichChainLadder':  The labels of the axis of the residuals
    plots where the mixed up. 
    Thanks to Ben Escoto for reporting this issue.
  * 'estimate.sigma' didn't check for sigma>0 before applying a
    log-linear regression. Thanks to Dan Murphy reporting this bug.


# ChainLadder 0.1.2-13

## User-visible changes

  * 'MackChainLadder' has new argument 'alpha' as an additional
     weighting parameter. As a result, the argument 'weights' is now
     just that, weights should be between 0 and 1.
     The argument 'alpha' describes the different chain ladder
     age-to-age factors:
     The default for alpha for all development periods is 1. See
     Mack's 1999 paper: 
     alpha=1 gives the historical chain ladder age-to-age factors, 
     alpha=0 gives the straight average of the observed individual
      	     development factors and 
     alpha=2 is the result of an ordinary regression with intercept 0. 
  
  * Basic 'chainladder' function now available using linear
    models. See ?chainladder for more information.

  * More examples for 'MackChainLadder' demonstrate how to apply the
    MackChainLadder over several triangles in 'one-line'.

  * 'as.data.frame.triangle' has new argument 'lob' (e.g. line of
    business) which allows to set an additional label column in the
    data frame output.

## Bug fixes

  * 'MackChainLadder':  Latest position of incomplete triangles were
    in some cases not returned correctly. Thanks to Ben Escoto for
    reporting and providing a patch.

  * 'MackChainLadder': 
    - Mack.S.E was not correctly calculated for non-standard chain
      ladder age-to-age factors (e.g. straight averages or ordinary
      regression through the origin) due the missing argument for 'alpha'. 
    - Chain ladder age-to-age factors were always applied to diagonal
      elements to calculate forecasts, although data in sub-diagonal
      triangle could exist. Many thanks to Przemyslaw Sloma for
      reporting those issues. 
  

# ChainLadder 0.1.2-12

## New Features

 * New triangle class with S3 methods for plot, print and conversion
   from triangles to data.frames and vis versa

 * New utility functions 'incr2cum' and 'cum2incr' to convert
   incremental triangles into  cumulative triangles and vis
   versa. Thanks to Chritophe Dutang.
 * New logical argument lattice for plot.MackChainLadder (and
   plot.triangle), which allows to plot developments by origin period
   in separate panels.  

## Bug fixes

  * 'MunichChainLadder': tail factors were not accepted. Thanks to
    Stefan Pohl for reporting this issue.


# ChainLadder 0.1.2-11

## Bug fixes

  * 'MackChainLadder': 'F.se'[ultimate] was calculated of the ultimate
    column instead of the latest paid. 


# ChainLadder 0.1.2-10

## User-visible changes

  * 'MackChainLadder' has new arguments 'tail.sigma' and 'tail.se' to
    provide estimates of the variability for a given tail factor.
 
## Bug fixes

  * 'MackChainLadder': calculation of 'Mack.S.E' did not use an
    ultimate sigma factor to estimate 'Mack.S.E' when a tail factor >
    1 was provided (Thanks to Mark Hoffmann for reporting this issue).


# ChainLadder 0.1.2-9

## User-visible changes

  * Updated documentation to work with new Rd-file parser 
    (R version >= 2.9.0) 
  * Updated documentation for 'ABC' data (Thanks to Glen Barnett)


# ChainLadder 0.1.2-8

## User-visible changes

  * Updated documentation for 'MackChainLadder' (Thanks to Daniel Murphy)


# ChainLadder 0.1.2-7

## User-visible changes 

  * 'MackChainLadder' gives two more elements back: 'Mack.ProcessRisk'
    and 'Mack.ParameterRisk' for the process and parameter risk error
    (Thanks to Daniel Murphy)
  * In the summary output of 'MackChainLadder' the label 'CV'  changed
    to 'CV(IBNR)' to clarify that we show the coefficient of variance
    of the IBNR.
  * 'MackChainLadder' provides new example plots for CV(IBNR)
    vs. origin period and CV(Ultimate) vs. origin period  
  * Updated documentation


# ChainLadder 0.1.2-6

## User-visible changes

  * Updated documentation


# ChainLadder 0.1.2-5

## New Features

  * New function 'BootChainLadder', based on papers by England and Verrall, 
    and Barnett and Zehnwirth
  * 'MackChainLadder' and 'MunichChainLadder' allow for tail factors
  * 'MackChainLadder' estimates the overall standard error for the total IBNR	
  * New arguments 'tail' and 'est.sigma' for MackChainLadder, to control 
    the tail factor and the estimation of sigma_{n-1}
  * New arguments 'tailP', 'tailI' and 'est.sigmaP', 'est.sigmaI' for
    'MunichChainLadder', which are passed on to 'MackChainLadder' to control 
    the tail factor and the estimation of sigma_{n-1} for the Paid and 
    Incurred triangle
  * 'Mack-, 'Munich-, and 'BootChainLadder' accept (mxn) matrices with m>=n,
    e.g more accident years than development years
  * New example data sets: 'ABC' (annual run-off triangle of a worker's 
    compensation portfolio of a large company), 'qpaid', 'qincurred' ('made-up'
    data of a quarterly development triangle of annual origin period)
  * Triangles with higher development period frequency (e.g quarterly) than 
    origin period frequency (e.g annual) can be used after being 'blown-up'
    to a common period frequency, see the help of 'qpaid'
  * 'Mack-, 'Munich- and 'BootChainLadder' accept 'blown-up' triangles of 
    higher development period frequency than origin period frequency filled 
    with 'NA', see the help of 'qpaid'

## User-visible changes

  * summary functions for 'Mack-, 'Munich-, 'BootChainLadder' give all a list 
    back with two elements: 'ByOrigin' and 'Totals'	
  * Change of labels: origin years -> origin period and development years ->
    development origin
  * Coefficient of Variation is abbreviate with 'CV' instead of 'CoV'
  * The example spreadsheet 'ChainLadder_in_Excel.xls' has new examples, 
    including 'BootChainLadder'
  * New greeting message after the R-call 'library(ChainLadder)'
  * Improved documentation

## Bug fixes

  * 'MunichChainLadder': calculation of 'lambdaP' and 'lambdI' was incorrect. 
    Thanks to Beat Huggler for reporting this issue.


# ChainLadder 0.1.2-4

  * R/BootstrapReserve.R Included all the functions for the BootChainLadder
    function. The BootChainLadder procedure provides a predictive
    distribution of reserves for a cumulative claims development
    triangle.
  * R/BootstrapReserve.R, MackChainLadder.R, MunichChainLadder The summary
    methods for MackChainLadder, MunichChainLadder, BootChainLadder
    give a list back with two elements "ByOrigin" and "Totals"
  * R/zzz.R Included a .onLoad function to produce a little message
    after the ChainLadder package is loaded.
  * Excel/ChainLadder_in_Excel.xls Added new examples for
    BootChainLadder and how to use Rapply to call functions from the
    ChainLadder package.


# ChainLadder 0.1.2-2

  * R/MackChainLadder.R Included tail factor estimation. The
    function MackChainLadder has a new argument "tail" to either
    estimate the tail factor via a log-linear regression or to set it manually.
  * data/qpaid.RData, qincurred.RData Added examples of quarterly
    development triangles 


# ChainLadder 0.1.2-0

  * R/MackChainLadder.R Prepared the functions Mack.S.E and 
    Total.Mack.S.E to accept triangles with rows full of NA values.
    This might be useful for non quadratic triangles


# ChainLadder 0.1.1-5

  * R/MackChainLadder.R Bug fix: Function Mack.S.E did not give F.se back, 
    which is needed by TotalMack.S.E. 
    Many thanks to Florian Leitenstorfer for reporting this issue.


# ChainLadder 0.1.1-4

  * inst/Excel/ChainLadder_in_Excel.xls uses now dynamic functions 
    and shows how to call 'plot' from Excel 
  * R/MackChainLadderFunctions.R: Changed labels Reserving to IBNR 
    (=Incurred But Not Reported)


# ChainLadder 0.1.1-3

  * R/MackChainLadderFunctions.R: Mack.S.E checks now which sigma>0 before log
    linear regression of sigma to estimate sigma[n-1]


# ChainLadder 0.1.1-2

  * R/MackChainLadderFunctions.R: added function
    TotalMack.S.E function to estimate the overall standard error for
    the reserve. MackChainLadder gives now also the
    Total.Mack.S.E. back plus the estimate standard error for all
    individual age-to-age factors F.se.


# ChainLadder 0.1.1-1

  * First release on CRAN  
