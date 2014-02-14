openproceedings
===============

## Github/FigShare based OpenScience publishing platform for conference proceedings

Github provides an ideal platform for:

* collecting proceedings submissions as Github pull requests
* peer reviewing (typically open, optionally with anonimized accounts) as inline comments
* accept submissions my merging the pull request

See an example from the [2013 Scipy Proceedings](https://github.com/scipy-conference/scipy_proceedings/pull/61).

On top of this `openproceedings` provides:

* continous publication of HTML and PDF versions of proceedings on a website (provided by Pelican + Travis-ci)
* automatic submission of PDF version to FigShare via API
* FigShare DOI added to the website as link and in downloadable BibTeX file
* any subsequent modification to any submission immediately updates the website, and optionally triggers an update to FigShare

The workflow is strongly based on the `publisher` scripts of 
[Scipy proceedings](https://github.com/scipy-conference/scipy_proceedings/tree/master/publisher).

See for example a couple of papers from `Scipy` 2013 built with `openproceedings`, also published on FigShare:

http://openproceedings.github.io/2013/

## Components

* `Pelican` does all the hard work of converting RST or MarkDown to HTML and PDF: https://github.com/openproceedings/openproceedings-buildbot
* few bash scripts (`prepare.sh`, `build.sh`, `deploy.sh`) and `_travis.yml` take care of configuring setup Travis-ci, 
build HTMLs and PDFs (including pushing to FigShare) and deploying to the website.
* `figshare_pdf` is the plugin that implements the interface to FigShare: https://github.com/openproceedings/pelican_figshare_pdf
* a separate repository just for the papers: https://github.com/openproceedings/openproceedings-papers-2013

## How to set it up

* create a new Github organization
* create a new repository under the organization for Github Pages (i.e. needs to be named as yourorganization.github.io)
* create a fork of `openproceedings-buildbot` and `openproceedings-papers-2013` under the organization
* using `travis encrypt` set the variables `GH_TOKEN_CONTENT` and `GH_TOKEN` respectively to the Github authorization token 
for the papers and the Github Pages repositories to allow Travis to push to those.
* open a dedicated account on `FigShare`, create an `Application`, authorized it and use `travis encrypt` to set the environmental variable 
needed by `pelicanconf.py`
* check all the `.sh` scripts in the root of `openproceedings-buildbot` and update all the urls to point to your repositories
instead of `openproceedings`
* get in touch with me if you need help!
