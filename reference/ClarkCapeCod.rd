<!DOCTYPE html>
<!-- Generated by pkgdown: do not edit by hand --><html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><meta name="description" content="Analyze loss triangle using Clark's Cape Cod method."><title>Clark Cape Cod method — ClarkCapeCod • ChainLadder</title><script src="../deps/jquery-3.6.0/jquery-3.6.0.min.js"></script><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><link href="../deps/bootstrap-5.1.0/bootstrap.min.css" rel="stylesheet"><script src="../deps/bootstrap-5.1.0/bootstrap.bundle.min.js"></script><!-- Font Awesome icons --><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/v4-shims.min.css" integrity="sha256-wZjR52fzng1pJHwx4aV2AO3yyTOXrcDW7jBpJtTwVxw=" crossorigin="anonymous"><!-- bootstrap-toc --><script src="https://cdn.rawgit.com/afeld/bootstrap-toc/v1.0.1/dist/bootstrap-toc.min.js"></script><!-- headroom.js --><script src="https://cdnjs.cloudflare.com/ajax/libs/headroom/0.11.0/headroom.min.js" integrity="sha256-AsUX4SJE1+yuDu5+mAVzJbuYNPHj/WroHuZ8Ir/CkE0=" crossorigin="anonymous"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/headroom/0.11.0/jQuery.headroom.min.js" integrity="sha256-ZX/yNShbjqsohH1k95liqY9Gd8uOiE1S4vZc+9KQ1K4=" crossorigin="anonymous"></script><!-- clipboard.js --><script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.6/clipboard.min.js" integrity="sha256-inc5kl9MA1hkeYUt+EC3BhlIgyp/2jDIyBLS6k3UxPI=" crossorigin="anonymous"></script><!-- search --><script src="https://cdnjs.cloudflare.com/ajax/libs/fuse.js/6.4.6/fuse.js" integrity="sha512-zv6Ywkjyktsohkbp9bb45V6tEMoWhzFzXis+LrMehmJZZSys19Yxf1dopHx7WzIKxr5tK2dVcYmaCk2uqdjF4A==" crossorigin="anonymous"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/autocomplete.js/0.38.0/autocomplete.jquery.min.js" integrity="sha512-GU9ayf+66Xx2TmpxqJpliWbT5PiGYxpaG8rfnBEk1LL8l1KGkRShhngwdXK1UgqhAzWpZHSiYPc09/NwDQIGyg==" crossorigin="anonymous"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/mark.js/8.11.1/mark.min.js" integrity="sha512-5CYOlHXGh6QpOFA/TeTylKLWfB3ftPsde7AnmhuitiTX4K5SqCLBeKro6sPS8ilsz1Q4NRx3v8Ko2IBiszzdww==" crossorigin="anonymous"></script><!-- pkgdown --><script src="../pkgdown.js"></script><meta property="og:title" content="Clark Cape Cod method — ClarkCapeCod"><meta property="og:description" content="Analyze loss triangle using Clark's Cape Cod method."><!-- mathjax --><script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js" integrity="sha256-nvJJv9wWKEm88qvoQl9ekL2J+k/RWIsaSScxxlsrv8k=" crossorigin="anonymous"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/config/TeX-AMS-MML_HTMLorMML.js" integrity="sha256-84DKXVJXs0/F8OTMzX4UR909+jtl4G7SPypPavF+GfA=" crossorigin="anonymous"></script><!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]--></head><body>
    <a href="#main" class="visually-hidden-focusable">Skip to contents</a>
    

    <nav class="navbar fixed-top navbar-light navbar-expand-lg bg-light"><div class="container">
    
    <a class="navbar-brand me-2" href="../index.html">ChainLadder</a>

    <small class="nav-text text-muted me-auto" data-bs-toggle="tooltip" data-bs-placement="bottom" title="">0.2.15</small>

    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div id="navbar" class="collapse navbar-collapse ms-2">
      <ul class="navbar-nav me-auto"><li class="nav-item">
  <a class="nav-link" href="../articles/ChainLadder.html">Get started</a>
</li>
<li class="active nav-item">
  <a class="nav-link" href="../reference/index.html">Reference</a>
</li>
<li class="nav-item">
  <a class="nav-link" href="../news/index.html">Changelog</a>
</li>
      </ul><form class="form-inline my-2 my-lg-0" role="search">
        <input type="search" class="form-control me-sm-2" aria-label="Toggle navigation" name="search-input" data-search-index="../search.json" id="search-input" placeholder="Search for" autocomplete="off"></form>

      <ul class="navbar-nav"><li class="nav-item">
  <a class="external-link nav-link" href="https://github.com/mages/ChainLadder/" aria-label="github">
    <span class="fab fa fab fa-github fa-lg"></span>
     
  </a>
</li>
      </ul></div>

    
  </div>
</nav><div class="container template-reference-topic">
<div class="row">
  <main id="main" class="col-md-9"><div class="page-header">
      <img src="" class="logo" alt=""><h1>Clark Cape Cod method</h1>
      
      <div class="d-none name"><code>ClarkCapeCod.rd</code></div>
    </div>

    <div class="ref-description section level2">
    <p>Analyze loss triangle using Clark's Cape Cod method.</p>
    </div>

    <div class="section level2">
    <h2 id="ref-usage">Usage<a class="anchor" aria-label="anchor" href="#ref-usage"></a></h2>
    <div class="sourceCode"><pre class="sourceCode r"><code><span class="fu">ClarkCapeCod</span><span class="op">(</span><span class="va">Triangle</span>, <span class="va">Premium</span>, cumulative <span class="op">=</span> <span class="cn">TRUE</span>, maxage <span class="op">=</span> <span class="cn">Inf</span>, 
        adol <span class="op">=</span> <span class="cn">TRUE</span>, adol.age <span class="op">=</span> <span class="cn">NULL</span>, origin.width <span class="op">=</span> <span class="cn">NULL</span>,
        G <span class="op">=</span> <span class="st">"loglogistic"</span><span class="op">)</span></code></pre></div>
    </div>

    <div class="section level2">
    <h2 id="arguments">Arguments<a class="anchor" aria-label="anchor" href="#arguments"></a></h2>
    <dl><dt>Triangle</dt>
<dd><p>A loss triangle in the form of a matrix.
The number of columns must be at least four;
the number of rows may be as few as 1.
The column names of the matrix should be able to be interpreted
as the "age" of the losses in that column.
The row names of the matrix should uniquely define the year of
origin of the losses in that row.
Losses may be inception-to-date or incremental.</p></dd>
<dt>Premium</dt>
<dd><p>The vector of premium to use in the method.
If a scalar (vector of length 1) is given,
that value will be used for all origin periods.
(See "Examples" below.)
If the length is greater than 1 but 
does not equal the number of rows of <code>Triangle</code>
the <code>Premium</code> values will be "recycled" with a warning.</p></dd>
<dt>cumulative</dt>
<dd><p>If <code>TRUE</code> (the default), values in <code>Triangle</code> are
inception to date.
If <code>FALSE</code>, <code>Triangle</code> holds incremental losses.</p></dd>
<dt>maxage</dt>
<dd><p>The "ultimate" age to which losses should be projected.</p></dd>
<dt>adol</dt>
<dd><p>If <code>TRUE</code> (the default), the growth function should be applied
to the length of time from the average date of loss ("adol")
of losses in the origin year.
If <code>FALSE</code>, the growth function should be applied
to the length of time since the beginning of the origin year.</p></dd>
<dt>adol.age</dt>
<dd><p>Only pertinent if <code>adol</code> is <code>TRUE</code>.
The age of the average date of losses within an origin period
in the same units as the "ages" of the <code>Triangle</code> matrix.
If <code>NULL</code> (the default) it will be assumed to be half the width
of an origin period (which would be the case if losses can be assumed
to occur uniformly over an origin period).</p></dd>
<dt>origin.width</dt>
<dd><p>Only pertinent if <code>adol</code> is <code>TRUE</code>.
The width of an origin period
in the same units as the "ages" of the <code>Triangle</code> matrix.
If <code>NULL</code> (the default) it will be assumed to be the mean difference
in the "ages" of the triangle, 
with a warning if not all differences are equal.</p></dd>
<dt>G</dt>
<dd><p>A <code>character</code> scalar identifying the "growth function."
The two growth functions defined at this time are "loglogistic"
(the default)
and "weibull".</p></dd>
</dl></div>
    <div class="section level2">
    <h2 id="details">Details<a class="anchor" aria-label="anchor" href="#details"></a></h2>
    <p>Clark's "Cape Cod" method assumes that the 
incremental losses across development periods in a loss triangle
are independent.
He assumes that the expected value of an incremental loss is
equal to the <em>theoretical</em> expected loss ratio (<b>ELR</b>)
times the on-level premium for the origin year
times the change in the <em>theoretical</em>
underlying growth function over the development period.
Clark models the growth function, also called the percent of ultimate,
by either the loglogistic function (a.k.a., "the inverse power curve") 
or the weibull function.
Clark completes his incremental loss model 
by wrapping the expected values within an 
overdispersed poisson (ODP) process where
the "scale factor" 
sigma^2
is assumed to be a known constant for all 
development periods.</p> 
<p>The parameters of Clark's "Cape Cod" method are therefore:
ELR,
and 
omega
and 
theta
(the parameters of the <b>loglogistic</b> and <b>weibull</b> growth functions).
Finally, Clark uses maximum likelihood to parameterize his model,
uses the ODP process to estimate process risk, and
uses the Cramer-Rao theorem and the "delta method" to estimate parameter risk.</p>
<p>Clark recommends inspecting the residuals to help assess the 
reasonableness of the model relative to the actual data
(see <code><a href="plot.clark.html">plot.clark</a></code> below).</p>
    </div>
    <div class="section level2">
    <h2 id="value">Value<a class="anchor" aria-label="anchor" href="#value"></a></h2>
    <p>A <code>list</code> of class "ClarkLDF" with the components listed below.
("Key" to naming convention: all caps represent parameters;
mixed case represent origin-level amounts;
all-lower-case represent observation-level (origin, development age) results.)</p>
<dl><dt>method</dt>
<dd><p>"CapeCod"</p></dd>
<dt>growthFunction</dt>
<dd><p>name of the growth function</p></dd>
<dt>Origin</dt>
<dd><p>names of the rows of the triangle</p></dd>
<dt>Premium</dt>
<dd><p>Premium amount for each origin year</p></dd>
<dt>CurrentValue</dt>
<dd><p>the most mature value for each row</p></dd>
<dt>CurrentAge</dt>
<dd><p>the most mature "age" for each row</p></dd>
<dt>CurrentAge.used</dt>
<dd><p>the most mature age used; differs from "CurrentAge"
        when adol=TRUE</p></dd>
<dt>MAXAGE</dt>
<dd><p>same as 'maxage' argument</p></dd>
<dt>MAXAGE.USED</dt>
<dd><p>the maximum age for development 
        from the average date of loss; 
        differs from MAXAGE when adol=TRUE</p></dd>
<dt>FutureValue</dt>
<dd><p>the projected loss amounts ("Reserves" in Clark's paper)</p></dd>
<dt>ProcessSE</dt>
<dd><p>the process standard error of the FutureValue</p></dd>
<dt>ParameterSE</dt>
<dd><p>the parameter standard error of the FutureValue</p></dd>
<dt>StdError</dt>
<dd><p>the total standard error (process + parameter) 
        of the FutureValue</p></dd>
<dt>Total</dt>
<dd><p>a <code>list</code> with amounts that appear on the "Total" row
        for components "Origin" (="Total"), "CurrentValue", "FutureValue",
        "ProcessSE", "ParameterSE", and "StdError"</p></dd>
<dt>PAR</dt>
<dd><p>the estimated parameters</p></dd>
<dt>ELR</dt>
<dd><p>the estimated loss ratio parameter</p></dd>
<dt>THETAG</dt>
<dd><p>the estimated parameters of the growth function</p></dd>
<dt>GrowthFunction</dt>
<dd><p>value of the growth function as of the 
        CurrentAge.used</p></dd>
<dt>GrowthFunctionMAXAGE</dt>
<dd><p>value of the growth function as of the
        MAXAGE.used</p></dd>
<dt>FutureGrowthFactor</dt>
<dd><p>the ("unreported" or "unpaid") percent of
        ultimate loss that has yet to be recorded</p></dd>
<dt>SIGMA2</dt>
<dd><p>the estimate of the sigma^2 parameter</p></dd>
<dt>Ldf</dt>
<dd><p>the "to-ultimate" loss development factor
        (sometimes called the "cumulative development factor")
        as defined in Clark's paper for each origin year</p></dd>
<dt>LdfMAXAGE</dt>
<dd><p>the "to-ultimate" loss development factor as of 
        the maximum age used in the model</p></dd>
<dt>TruncatedLdf</dt>
<dd><p>the "truncated" loss development factor for developing
        the current diagonal to
        the maximum age used in the model</p></dd>
<dt>FutureValueGradient</dt>
<dd><p>the gradient of the FutureValue function</p></dd>
<dt>origin</dt>
<dd><p>the origin year corresponding to each observed value of incremental loss</p></dd>
<dt>age</dt>
<dd><p>the age of each observed value of incremental loss</p></dd>
<dt>fitted</dt>
<dd><p>the expected value of each observed value of incremental loss 
        (the "mu's" of Clark's paper)</p></dd>
<dt>residuals</dt>
<dd><p>the actual minus fitted value for 
        each observed incremental loss</p></dd>
<dt>stdresid</dt>
<dd><p>the standardized residuals for 
        each observed incremental loss
        (= residuals/sqrt(sigma2*fitted), 
        referred to as "normalized residuals" in Clark's paper; see p. 62)</p></dd>
<dt>FI</dt>
<dd><p>the "Fisher Information" matrix as defined in Clark's paper
    (i.e., without the sigma^2 value)</p></dd>
<dt>value</dt>
<dd><p>the value of the loglikelihood function at the solution point</p></dd>
<dt>counts</dt>
<dd><p>the number of calls to the loglikelihood function
        and its gradient function when numerical convergence was achieved</p></dd>
</dl></div>
    <div class="section level2">
    <h2 id="references">References<a class="anchor" aria-label="anchor" href="#references"></a></h2>
    <p>Clark, David R., 
"LDF Curve-Fitting and Stochastic Reserving: A Maximum Likelihood Approach",
<em>Casualty Actuarial Society Forum</em>, Fall, 2003
<a href="https://www.casact.org/sites/default/files/database/forum_03fforum_03ff041.pdf" class="external-link">https://www.casact.org/sites/default/files/database/forum_03fforum_03ff041.pdf</a></p>
    </div>
    <div class="section level2">
    <h2 id="author">Author<a class="anchor" aria-label="anchor" href="#author"></a></h2>
    <p>Daniel Murphy</p>
    </div>
    <div class="section level2">
    <h2 id="see-also">See also<a class="anchor" aria-label="anchor" href="#see-also"></a></h2>
    <div class="dont-index"><p><code><a href="ClarkLDF.html">ClarkLDF</a></code></p></div>
    </div>

    <div class="section level2">
    <h2 id="ref-examples">Examples<a class="anchor" aria-label="anchor" href="#ref-examples"></a></h2>
    <div class="sourceCode"><pre class="sourceCode r"><code><span class="r-in"><span class="va">X</span> <span class="op">&lt;-</span> <span class="va">GenIns</span></span>
<span class="r-in"><span class="fu"><a href="https://rdrr.io/r/base/colnames.html" class="external-link">colnames</a></span><span class="op">(</span><span class="va">X</span><span class="op">)</span> <span class="op">&lt;-</span> <span class="fl">12</span><span class="op">*</span><span class="fu"><a href="https://rdrr.io/r/base/numeric.html" class="external-link">as.numeric</a></span><span class="op">(</span><span class="fu"><a href="https://rdrr.io/r/base/colnames.html" class="external-link">colnames</a></span><span class="op">(</span><span class="va">X</span><span class="op">)</span><span class="op">)</span></span>
<span class="r-in"><span class="va">CC.loglogistic</span>  <span class="op">&lt;-</span> <span class="fu">ClarkCapeCod</span><span class="op">(</span><span class="va">X</span>, Premium<span class="op">=</span><span class="fl">10000000</span><span class="op">+</span><span class="fl">400000</span><span class="op">*</span><span class="fl">0</span><span class="op">:</span><span class="fl">9</span>, maxage<span class="op">=</span><span class="fl">240</span><span class="op">)</span></span>
<span class="r-in"><span class="va">CC.loglogistic</span></span>
<span class="r-out co"><span class="r-pr">#&gt;</span>  Origin CurrentValue     Premium   ELR FutureGrowthFactor FutureValue</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       1    3,901,463  10,000,000 0.597             0.1304     778,463</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       2    5,339,085  10,400,000 0.597             0.1594     989,952</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       3    4,909,315  10,800,000 0.597             0.1950   1,257,443</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       4    4,588,268  11,200,000 0.597             0.2392   1,599,333</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       5    3,873,311  11,600,000 0.597             0.2947   2,041,248</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       6    3,691,712  12,000,000 0.597             0.3655   2,618,547</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       7    3,483,130  12,400,000 0.597             0.4563   3,377,840</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       8    2,864,498  12,800,000 0.597             0.5721   4,371,698</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       9    1,363,294  13,200,000 0.597             0.7138   5,625,140</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      10      344,014  13,600,000 0.597             0.8617   6,996,681</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>   Total   34,358,090 118,000,000                           29,656,345</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>  UltimateValue  StdError  CV%</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      4,679,926   269,249 34.6</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      6,329,037   311,329 31.4</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      6,166,758   358,975 28.5</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      6,187,601   412,520 25.8</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      5,914,559   471,781 23.1</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      6,310,259   535,626 20.5</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      6,860,970   601,534 17.8</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      7,236,196   665,861 15.2</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      6,988,434   726,348 12.9</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      7,340,695   786,672 11.2</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>     64,014,435 3,402,779 11.5</span>
<span class="r-in"></span>
<span class="r-in"><span class="co"># Clark's "CapeCod method" also works with triangles that have  </span></span>
<span class="r-in"><span class="co"># more development periods than origin periods. The Premium</span></span>
<span class="r-in"><span class="co"># is a contrived match to the "made up" 'qincurred' Triangle.</span></span>
<span class="r-in"><span class="fu">ClarkCapeCod</span><span class="op">(</span><span class="va">qincurred</span>, Premium<span class="op">=</span><span class="fl">1250</span><span class="op">+</span><span class="fl">150</span><span class="op">*</span><span class="fl">0</span><span class="op">:</span><span class="fl">11</span>, G<span class="op">=</span><span class="st">"loglogistic"</span><span class="op">)</span></span>
<span class="r-out co"><span class="r-pr">#&gt;</span>  Origin CurrentValue Premium   ELR FutureGrowthFactor FutureValue UltimateValue</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>    1995        1,100   1,250 0.726             0.0071           6         1,106</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>    1996        1,300   1,400 0.726             0.0089           9         1,309</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>    1997        1,200   1,550 0.726             0.0113          13         1,213</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>    1998        1,298   1,700 0.726             0.0149          18         1,316</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>    1999        1,583   1,850 0.726             0.0204          27         1,610</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>    2000        1,066   2,000 0.726             0.0290          42         1,108</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>    2001        1,411   2,150 0.726             0.0438          68         1,479</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>    2002        1,820   2,300 0.726             0.0717         120         1,940</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>    2003        1,221   2,450 0.726             0.1308         233         1,454</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>    2004        1,212   2,600 0.726             0.2753         519         1,731</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>    2005          422   2,750 0.726             0.6363       1,270         1,692</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>    2006           13   2,900 0.726             0.9971       2,099         2,112</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>   Total       13,646  24,900                                4,425        18,071</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>  StdError   CV%</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>        16 256.6</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>        20 217.3</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>        23 183.1</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>        28 153.0</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>        35 126.3</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>        43 102.6</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>        56  81.3</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>        75  62.3</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       106  45.5</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       160  30.7</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       247  19.5</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       318  15.2</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       546  12.3</span>
<span class="r-in"></span>
<span class="r-in"><span class="co"># Method also works for a "triangle" with only one row:</span></span>
<span class="r-in"><span class="co"># 1st row of GenIns; need "drop=FALSE" to avoid becoming a vector.</span></span>
<span class="r-in"><span class="fu">ClarkCapeCod</span><span class="op">(</span><span class="va">GenIns</span><span class="op">[</span><span class="fl">1</span>, , drop<span class="op">=</span><span class="cn">FALSE</span><span class="op">]</span>, Premium<span class="op">=</span><span class="fl">1000000</span>, maxage<span class="op">=</span><span class="fl">20</span><span class="op">)</span></span>
<span class="r-out co"><span class="r-pr">#&gt;</span>  Origin CurrentValue   Premium   ELR FutureGrowthFactor FutureValue</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       1    3,901,463 1,000,000 5.180             0.1329     688,191</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>   Total    3,901,463 1,000,000                              688,191</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>  UltimateValue StdError  CV%</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      4,589,654  332,977 48.4</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      4,589,654  332,977 48.4</span>
<span class="r-in"></span>
<span class="r-in"><span class="co"># If one value of Premium is appropriate for all origin years</span></span>
<span class="r-in"><span class="co"># (e.g., losses are on-level and adjusted for exposure)</span></span>
<span class="r-in"><span class="co"># then only a single value for Premium need be provided.</span></span>
<span class="r-in"><span class="fu">ClarkCapeCod</span><span class="op">(</span><span class="va">GenIns</span>, Premium<span class="op">=</span><span class="fl">1000000</span>, maxage<span class="op">=</span><span class="fl">20</span><span class="op">)</span></span>
<span class="r-out co"><span class="r-pr">#&gt;</span>  Origin CurrentValue    Premium   ELR FutureGrowthFactor FutureValue</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       1    3,901,463  1,000,000 6.506             0.1220     793,689</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       2    5,339,085  1,000,000 6.506             0.1497     973,638</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       3    4,909,315  1,000,000 6.506             0.1838   1,195,562</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       4    4,588,268  1,000,000 6.506             0.2264   1,473,293</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       5    3,873,311  1,000,000 6.506             0.2807   1,826,208</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       6    3,691,712  1,000,000 6.506             0.3506   2,281,212</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       7    3,483,130  1,000,000 6.506             0.4417   2,873,992</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       8    2,864,498  1,000,000 6.506             0.5602   3,644,648</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>       9    1,363,294  1,000,000 6.506             0.7084   4,609,114</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      10      344,014  1,000,000 6.506             0.8666   5,638,009</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>   Total   34,358,090 10,000,000                           25,309,365</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>  UltimateValue  StdError  CV%</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      4,695,152   279,198 35.2</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      6,312,723   314,887 32.3</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      6,104,877   354,390 29.6</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      6,061,561   397,940 27.0</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      5,699,519   445,419 24.4</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      5,972,924   496,063 21.7</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      6,357,122   548,195 19.1</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      6,509,146   599,501 16.4</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      5,972,408   648,803 14.1</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>      5,982,023   697,588 12.4</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>     59,667,455 3,009,180 11.9</span>
<span class="r-in"></span>
<span class="r-in"><span class="co"># Use of the weibull function generates a warning that the parameter risk </span></span>
<span class="r-in"><span class="co"># approximation results in some negative variances. This may be of small </span></span>
<span class="r-in"><span class="co"># concern since it happens only for older years with near-zero </span></span>
<span class="r-in"><span class="co"># estimated reserves, but the warning should not be disregarded </span></span>
<span class="r-in"><span class="co"># if it occurs with real data.</span></span>
<span class="r-in"><span class="va">Y</span> <span class="op">&lt;-</span> <span class="fu">ClarkCapeCod</span><span class="op">(</span><span class="va">qincurred</span>, Premium<span class="op">=</span><span class="fl">1250</span><span class="op">+</span><span class="fl">150</span><span class="op">*</span><span class="fl">0</span><span class="op">:</span><span class="fl">11</span>, G<span class="op">=</span><span class="st">"weibull"</span><span class="op">)</span></span>
<span class="r-wrn co"><span class="r-pr">#&gt;</span> <span class="warning">Warning: </span>The parameter risk approximation produced 'negative variances' for the following origin years (values set to zero):</span>
<span class="r-wrn co"><span class="r-pr">#&gt;</span> Origin  Reserve ApproxVar RelativeVar </span>
<span class="r-wrn co"><span class="r-pr">#&gt;</span>   1995  0.00124 -6.17e-05     -0.0499 </span>
<span class="r-wrn co"><span class="r-pr">#&gt;</span>   1996  0.00823 -1.81e-03     -0.2198 </span>
<span class="r-wrn co"><span class="r-pr">#&gt;</span>   1997  0.04965 -4.13e-02     -0.8325 </span>
<span class="r-wrn co"><span class="r-pr">#&gt;</span>   1998  0.27093 -7.20e-01     -2.6563 </span>
<span class="r-wrn co"><span class="r-pr">#&gt;</span>   1999  1.33183 -9.22e+00     -6.9264 </span>
<span class="r-wrn co"><span class="r-pr">#&gt;</span>   2000  5.86716 -8.22e+01    -14.0080 </span>
<span class="r-wrn co"><span class="r-pr">#&gt;</span>   2001 22.99806 -4.54e+02    -19.7348 </span>
<span class="r-wrn co"><span class="r-pr">#&gt;</span>   2002 79.44399 -1.09e+03    -13.7447 </span>
<span class="r-in"></span>
<span class="r-in"><span class="co"># The plot of the standardized residuals by age indicates that the more</span></span>
<span class="r-in"><span class="co"># mature observations are more loosely grouped than the less mature, just</span></span>
<span class="r-in"><span class="co"># the opposite of the behavior under the loglogistic curve.</span></span>
<span class="r-in"><span class="co"># This suggests that the model might be improved by analyzing the Triangle </span></span>
<span class="r-in"><span class="co"># in two different "blocks": less mature vs. more mature. </span></span>
<span class="r-in"><span class="co"># The QQ-plot shows that the tails of the empirical distribution of</span></span>
<span class="r-in"><span class="co"># standardized residuals are "fatter" than a standard normal. </span></span>
<span class="r-in"><span class="co"># The fact that the p-value is essentially zero says that there is </span></span>
<span class="r-in"><span class="co"># virtually no chance that the standardized residuals could be </span></span>
<span class="r-in"><span class="co"># considered draws from a standard normal random variable.</span></span>
<span class="r-in"><span class="co"># The overall conclusion is that Clark's ODP-based CapeCod model with </span></span>
<span class="r-in"><span class="co"># the weibull growth function does not match up well with the qincurred </span></span>
<span class="r-in"><span class="co"># triangle and these premiums.</span></span>
<span class="r-in"><span class="fu"><a href="https://rdrr.io/r/graphics/plot.default.html" class="external-link">plot</a></span><span class="op">(</span><span class="va">Y</span><span class="op">)</span> </span>
<span class="r-plt img"><img src="ClarkCapeCod-1.png" alt="" width="700" height="433"></span>
</code></pre></div>
    </div>
  </main><aside class="col-md-3"><nav id="toc"><h2>On this page</h2>
    </nav></aside></div>


    <footer><div class="pkgdown-footer-left">
  <p></p><p>Developed by Markus Gesmann, Daniel Murphy, Yanwei (Wayne) Zhang, Alessandro Carrato, Mario Wuthrich, Fabio Concina, Eric Dal Moro.</p>
</div>

<div class="pkgdown-footer-right">
  <p></p><p>Site built with <a href="https://pkgdown.r-lib.org/" class="external-link">pkgdown</a> 2.0.1.</p>
</div>

    </footer></div>

  

  

  </body></html>

