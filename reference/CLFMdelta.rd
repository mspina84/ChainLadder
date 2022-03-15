<!DOCTYPE html>
<!-- Generated by pkgdown: do not edit by hand --><html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><meta name="description" content="This function finds the values of delta,
one for each development period, 
such that the model coefficients resulting from 
the 'chainladder' function with delta = solution are consistent
with an input vector of 'selected' development age-to-age factors."><title>Find "selection consistent" values of delta — CLFMdelta • ChainLadder</title><!-- favicons --><link rel="icon" type="image/png" sizes="16x16" href="../favicon-16x16.png"><link rel="icon" type="image/png" sizes="32x32" href="../favicon-32x32.png"><link rel="apple-touch-icon" type="image/png" sizes="180x180" href="../apple-touch-icon.png"><link rel="apple-touch-icon" type="image/png" sizes="120x120" href="../apple-touch-icon-120x120.png"><link rel="apple-touch-icon" type="image/png" sizes="76x76" href="../apple-touch-icon-76x76.png"><link rel="apple-touch-icon" type="image/png" sizes="60x60" href="../apple-touch-icon-60x60.png"><script src="../deps/jquery-3.6.0/jquery-3.6.0.min.js"></script><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><link href="../deps/bootstrap-5.1.0/bootstrap.min.css" rel="stylesheet"><script src="../deps/bootstrap-5.1.0/bootstrap.bundle.min.js"></script><!-- Font Awesome icons --><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/v4-shims.min.css" integrity="sha256-wZjR52fzng1pJHwx4aV2AO3yyTOXrcDW7jBpJtTwVxw=" crossorigin="anonymous"><!-- bootstrap-toc --><script src="https://cdn.rawgit.com/afeld/bootstrap-toc/v1.0.1/dist/bootstrap-toc.min.js"></script><!-- headroom.js --><script src="https://cdnjs.cloudflare.com/ajax/libs/headroom/0.11.0/headroom.min.js" integrity="sha256-AsUX4SJE1+yuDu5+mAVzJbuYNPHj/WroHuZ8Ir/CkE0=" crossorigin="anonymous"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/headroom/0.11.0/jQuery.headroom.min.js" integrity="sha256-ZX/yNShbjqsohH1k95liqY9Gd8uOiE1S4vZc+9KQ1K4=" crossorigin="anonymous"></script><!-- clipboard.js --><script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.6/clipboard.min.js" integrity="sha256-inc5kl9MA1hkeYUt+EC3BhlIgyp/2jDIyBLS6k3UxPI=" crossorigin="anonymous"></script><!-- search --><script src="https://cdnjs.cloudflare.com/ajax/libs/fuse.js/6.4.6/fuse.js" integrity="sha512-zv6Ywkjyktsohkbp9bb45V6tEMoWhzFzXis+LrMehmJZZSys19Yxf1dopHx7WzIKxr5tK2dVcYmaCk2uqdjF4A==" crossorigin="anonymous"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/autocomplete.js/0.38.0/autocomplete.jquery.min.js" integrity="sha512-GU9ayf+66Xx2TmpxqJpliWbT5PiGYxpaG8rfnBEk1LL8l1KGkRShhngwdXK1UgqhAzWpZHSiYPc09/NwDQIGyg==" crossorigin="anonymous"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/mark.js/8.11.1/mark.min.js" integrity="sha512-5CYOlHXGh6QpOFA/TeTylKLWfB3ftPsde7AnmhuitiTX4K5SqCLBeKro6sPS8ilsz1Q4NRx3v8Ko2IBiszzdww==" crossorigin="anonymous"></script><!-- pkgdown --><script src="../pkgdown.js"></script><meta property="og:title" content="Find " selection consistent values of delta clfmdelta><meta property="og:description" content="This function finds the values of delta,
one for each development period, 
such that the model coefficients resulting from 
the 'chainladder' function with delta = solution are consistent
with an input vector of 'selected' development age-to-age factors."><meta property="og:image" content="http://mages.github.io/ChainLadder/logo.png"><!-- mathjax --><script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js" integrity="sha256-nvJJv9wWKEm88qvoQl9ekL2J+k/RWIsaSScxxlsrv8k=" crossorigin="anonymous"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/config/TeX-AMS-MML_HTMLorMML.js" integrity="sha256-84DKXVJXs0/F8OTMzX4UR909+jtl4G7SPypPavF+GfA=" crossorigin="anonymous"></script><!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]--></head><body>
    <a href="#main" class="visually-hidden-focusable">Skip to contents</a>
    

    <nav class="navbar fixed-top navbar-light navbar-expand-lg bg-light"><div class="container">
    
    <a class="navbar-brand me-2" href="../index.html">ChainLadder</a>

    <small class="nav-text text-muted me-auto" data-bs-toggle="tooltip" data-bs-placement="bottom" title="">0.2.16</small>

    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div id="navbar" class="collapse navbar-collapse ms-3">
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
      <img src="../logo.png" class="logo" alt=""><h1>Find "selection consistent" values of delta</h1>
      
      <div class="d-none name"><code>CLFMdelta.rd</code></div>
    </div>

    <div class="ref-description section level2">
    <p>This function finds the values of delta,
one for each development period, 
such that the model coefficients resulting from 
the 'chainladder' function with delta = solution are consistent
with an input vector of 'selected' development age-to-age factors.</p>
    </div>

    <div class="section level2">
    <h2 id="ref-usage">Usage<a class="anchor" aria-label="anchor" href="#ref-usage"></a></h2>
    <div class="sourceCode"><pre><code>&lt;!-- %CLFMdelta(Triangle, selected, tolerance = .0005, step.a = 1, ...) --&gt;
CLFMdelta(Triangle, selected, tolerance = .0005, ...)</code></pre></div>
    </div>

    <div class="section level2">
    <h2 id="arguments">Arguments<a class="anchor" aria-label="anchor" href="#arguments"></a></h2>
    <dl><dt>Triangle</dt>
<dd><p>cumulative claims triangle.  A (mxn)-matrix \(C_{ik}\) 
    which is filled for \(k \leq n+1-i; i=1,\ldots,m; m\geq n \), see
    <code><a href="qpaid.html">qpaid</a></code> for how to use (mxn)-development triangles with
    m&lt;n, say higher development period frequency (e.g quarterly) than
    origin period frequency (e.g accident years).</p></dd>
<dt>selected</dt>
<dd><p>a vector of selected age-to-age factors or "link ratios",
    one for each development period of 'Triangle'</p></dd>
<dt>tolerance</dt>
<dd><p>a 'tolerance' parameters. Default: .0005;
    for each element of 'selected' 
    a solution 'delta' will be found -- if possible --
    so that the chainladder model indexed by
    'delta' results in a multiplicative coefficient within 'tolerance' 
    of the 'selected' factor.</p></dd>
</dl><p><!-- %  \item{step.a}{the starting width of the search intervals} --></p>
<dl><dt>...</dt>
<dd><p>not in use</p></dd>
</dl></div>
    <div class="section level2">
    <h2 id="details">Details<a class="anchor" aria-label="anchor" href="#details"></a></h2>
    
 
<p>For a given input Triangle and vector of selected factors, 
a search is conducted for chainladder models that are "consistent with" the 
selected factors. 
By "consistent with" is meant that the coefficients of the <code><a href="chainladder.html">chainladder</a></code> 
function are equivalent to the selected factors.
Not all vectors of selected factors can be considered consistent with a given
Triangle; 
feasibility is subject to restrictions on the 'selected' factors relative to
the input 'Triangle'.
See the References.</p>

<p>The default average produced by the <code>chainladder</code> function is the 
volume weighted average and corresponds to <code>delta = 1</code> in the call
to that function;
<code>delta = 2</code> produces the simple average; and
<code>delta = 0</code> produces the "regression average", i.e., 
the slope of a regression line fit to the data 
and running through the origin.
By convention, if the <code>selected</code> value corresponds to 
the volume-weighted average, the simple average, or the regression average,
then the value returned will be 1, 2, and 0, respectively.</p>
<p>Other real-number values for <code>delta</code> will produce a different average.
The point of this function is to see if there exists a model as determined
by delta whose average is consistent with the value in the 
<code>selected</code> vector.
That is not always possible. See the References.</p>
<p>It can be the case that one or more of the above three "standard averages" 
will be quite close to each other 
(indistinguishable within <code>tolerance</code>).
In that case, the value returned will be, in the following priority order
by convention,
1 (volume weighted average),
2 (simple average), or
0 (regression average).</p>
<p></p>
    </div>
    <div class="section level2">
    <h2 id="value">Value<a class="anchor" aria-label="anchor" href="#value"></a></h2>
    <p>A vector of real numbers, say delta0, such that 
<code>coef(chainladder(Triangle, delta = delta0))</code> = <code>selected</code>  within <code>tolerance</code>.
  A <code>logical</code> attribute 'foundSolution' indicates if a solution was
  found for each element of <code>selected</code>.</p>
    </div>
    <div class="section level2">
    <h2 id="references">References<a class="anchor" aria-label="anchor" href="#references"></a></h2>
    
  
<p><cite>Bardis, Majidi, Murphy. A Family of Chain-Ladder Factor Models for Selected Link Ratios. <em>Variance</em>. Pending. Variance 6:2, 2012, pp. 143-160.</cite></p>
    </div>
    <div class="section level2">
    <h2 id="author">Author<a class="anchor" aria-label="anchor" href="#author"></a></h2>
    <p>Dan Murphy</p>
    </div>

    <div class="section level2">
    <h2 id="ref-examples">Examples<a class="anchor" aria-label="anchor" href="#ref-examples"></a></h2>
    <div class="sourceCode"><pre class="sourceCode r"><code><span class="r-in"></span>
<span class="r-in"><span class="va">x</span> <span class="op">&lt;-</span> <span class="va">RAA</span><span class="op">[</span><span class="fl">1</span><span class="op">:</span><span class="fl">9</span>,<span class="fl">1</span><span class="op">]</span></span>
<span class="r-in"><span class="va">y</span> <span class="op">&lt;-</span> <span class="va">RAA</span><span class="op">[</span><span class="fl">1</span><span class="op">:</span><span class="fl">9</span>,<span class="fl">2</span><span class="op">]</span></span>
<span class="r-in"><span class="cn">F</span> <span class="op">&lt;-</span> <span class="va">y</span><span class="op">/</span><span class="va">x</span></span>
<span class="r-in"><span class="fu">CLFMdelta</span><span class="op">(</span><span class="va">RAA</span><span class="op">[</span><span class="fl">1</span><span class="op">:</span><span class="fl">9</span>, <span class="fl">1</span><span class="op">:</span><span class="fl">2</span><span class="op">]</span>, selected <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/mean.html" class="external-link">mean</a></span><span class="op">(</span><span class="cn">F</span><span class="op">)</span><span class="op">)</span> <span class="co"># value is 2, 'foundSolution' is TRUE</span></span>
<span class="r-out co"><span class="r-pr">#&gt;</span> 1 </span>
<span class="r-out co"><span class="r-pr">#&gt;</span> 2 </span>
<span class="r-out co"><span class="r-pr">#&gt;</span> attr(,"foundSolution")</span>
<span class="r-out co"><span class="r-pr">#&gt;</span> [1] TRUE</span>
<span class="r-in"><span class="fu">CLFMdelta</span><span class="op">(</span><span class="va">RAA</span><span class="op">[</span><span class="fl">1</span><span class="op">:</span><span class="fl">9</span>, <span class="fl">1</span><span class="op">:</span><span class="fl">2</span><span class="op">]</span>, selected <span class="op">=</span> <span class="fu"><a href="https://rdrr.io/r/base/sum.html" class="external-link">sum</a></span><span class="op">(</span><span class="va">y</span><span class="op">)</span> <span class="op">/</span> <span class="fu"><a href="https://rdrr.io/r/base/sum.html" class="external-link">sum</a></span><span class="op">(</span><span class="va">x</span><span class="op">)</span><span class="op">)</span> <span class="co"># value is 1, 'foundSolution' is TRUE</span></span>
<span class="r-out co"><span class="r-pr">#&gt;</span> 1 </span>
<span class="r-out co"><span class="r-pr">#&gt;</span> 1 </span>
<span class="r-out co"><span class="r-pr">#&gt;</span> attr(,"foundSolution")</span>
<span class="r-out co"><span class="r-pr">#&gt;</span> [1] TRUE</span>
<span class="r-in"></span>
<span class="r-in"><span class="va">selected</span> <span class="op">&lt;-</span> <span class="fu"><a href="https://rdrr.io/r/base/mean.html" class="external-link">mean</a></span><span class="op">(</span><span class="fu"><a href="https://rdrr.io/r/base/c.html" class="external-link">c</a></span><span class="op">(</span><span class="fu"><a href="https://rdrr.io/r/base/mean.html" class="external-link">mean</a></span><span class="op">(</span><span class="cn">F</span><span class="op">)</span>, <span class="fu"><a href="https://rdrr.io/r/base/sum.html" class="external-link">sum</a></span><span class="op">(</span><span class="va">y</span><span class="op">)</span> <span class="op">/</span> <span class="fu"><a href="https://rdrr.io/r/base/sum.html" class="external-link">sum</a></span><span class="op">(</span><span class="va">x</span><span class="op">)</span><span class="op">)</span><span class="op">)</span> <span class="co"># an average of averages</span></span>
<span class="r-in"><span class="fu">CLFMdelta</span><span class="op">(</span><span class="va">RAA</span><span class="op">[</span><span class="fl">1</span><span class="op">:</span><span class="fl">9</span>, <span class="fl">1</span><span class="op">:</span><span class="fl">2</span><span class="op">]</span>, <span class="va">selected</span><span class="op">)</span> <span class="co"># about 1.725</span></span>
<span class="r-out co"><span class="r-pr">#&gt;</span>        1 </span>
<span class="r-out co"><span class="r-pr">#&gt;</span> 1.724596 </span>
<span class="r-out co"><span class="r-pr">#&gt;</span> attr(,"foundSolution")</span>
<span class="r-out co"><span class="r-pr">#&gt;</span> [1] TRUE</span>
<span class="r-in"><span class="fu">CLFMdelta</span><span class="op">(</span><span class="va">RAA</span><span class="op">[</span><span class="fl">1</span><span class="op">:</span><span class="fl">9</span>, <span class="fl">1</span><span class="op">:</span><span class="fl">2</span><span class="op">]</span>, selected <span class="op">=</span> <span class="fl">2</span><span class="op">)</span> <span class="co"># negative solutions are possible</span></span>
<span class="r-out co"><span class="r-pr">#&gt;</span>         1 </span>
<span class="r-out co"><span class="r-pr">#&gt;</span> -1.160568 </span>
<span class="r-out co"><span class="r-pr">#&gt;</span> attr(,"foundSolution")</span>
<span class="r-out co"><span class="r-pr">#&gt;</span> [1] TRUE</span>
<span class="r-in"></span>
<span class="r-in"><span class="co"># Demonstrating an "unreasonable" selected factor.</span></span>
<span class="r-in"><span class="fu">CLFMdelta</span><span class="op">(</span><span class="va">RAA</span><span class="op">[</span><span class="fl">1</span><span class="op">:</span><span class="fl">9</span>, <span class="fl">1</span><span class="op">:</span><span class="fl">2</span><span class="op">]</span>, selected <span class="op">=</span> <span class="fl">1.9</span><span class="op">)</span> <span class="co"># NA solution, with warning</span></span>
<span class="r-wrn co"><span class="r-pr">#&gt;</span> <span class="warning">Warning: </span>No optimal delta solution for age 1. Returning NA.</span>
<span class="r-out co"><span class="r-pr">#&gt;</span>  1 </span>
<span class="r-out co"><span class="r-pr">#&gt;</span> NA </span>
<span class="r-out co"><span class="r-pr">#&gt;</span> attr(,"foundSolution")</span>
<span class="r-out co"><span class="r-pr">#&gt;</span> [1] FALSE</span>
<span class="r-in"></span>
</code></pre></div>
    </div>
  </main><aside class="col-md-3"><nav id="toc"><h2>On this page</h2>
    </nav></aside></div>


    <footer><div class="pkgdown-footer-left">
  <p></p><p>Developed by Markus Gesmann, Daniel Murphy, Yanwei (Wayne) Zhang, Alessandro Carrato, Mario Wuthrich, Fabio Concina, Eric Dal Moro.</p>
</div>

<div class="pkgdown-footer-right">
  <p></p><p>Site built with <a href="https://pkgdown.r-lib.org/" class="external-link">pkgdown</a> 2.0.2.</p>
</div>

    </footer></div>

  

  

  </body></html>

