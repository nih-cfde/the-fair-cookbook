# Introduction to FAIR Principles

**Author(s):** [John Cheadle](https://orcid.org/0000-0002-0106-4415)

**Maintainer(s):** [John Cheadle](https://orcid.org/0000-0002-0106-4415)

**Version:** 1.0

**License:** [CC0 1.0 Universal (CC0 1.0) Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/deed.en)

## Objectives

The aim of this recipe is to summarize the `FAIR Guiding Principles` as well as define terminology and provide additional resources for individuals who are new to FAIR.  The recipe also touches on how FAIR is evaluated in general and in the context of [NIH CFDE](https://commonfund.nih.gov/dataecosystem), and provides both internal and external links to pertinent resources.


## FAIR in 5 Questions

### What is FAIR?

The `FAIR principles` are a collection of guidelines by which to improve the  **Findability**, **Accessibility**, **Interoperability**, and **Reusability** of data objects. These principles emphasize discovery and reuse of data objects with minimal or no human intervention (i.e. automated and machine-actionable), but are targeted at human entities as well.

FAIR principles are described in detail [from the GO-FAIR organization](https://www.go-fair.org/fair-principles/). The permanent URL that resolves to the previous link can be found from the [FAIRsharing.org record](https://doi.org/10.25504/FAIRsharing.WWI10U).



### When was FAIR established?

The `FAIR guiding principles` were first formally published in 2016 by [Wilkinson, et al.](https://doi.org/10.1038/sdata.2016.18)  Since then, two additional publications centering around metrics and maturity indicators for FAIRness have been authored. A permanent link to these papers is provided below:

* [https://doi.org/10.1038/sdata.2016.18](https://doi.org/10.1038/sdata.2016.18)
* [https://doi.org/10.1038/sdata.2018.118](https://doi.org/10.1038/sdata.2018.118)
* [https://doi.org/10.1038/s41597-019-0184-5](https://doi.org/10.1038/s41597-019-0184-5)

    
### Why do we care about FAIR?

The potential benefits to adhering to the FAIR principles are myriad. The rationale outlined in the first published paper includes:

* Facilitation of ongoing discovery, evaluation, and reuse in downstream studies after initial publication of a digital object.
* Deep and broad knowledge integration by human and computational stakeholders alike to advance scientific discovery.
* Recent work hints at citation benefits of making data and metadata more accessing as documented in this recent publication [https://doi.org/10.1371/journal.pone.0230416](https://doi.org/10.1371/journal.pone.0230416)


### How is FAIR evaluated?

In 2018, Wilkinson et al. published a [paper](https://doi.org/10.1038/sdata.2018.118) detailing the evaluation of FAIR using `14 exemplar metrics`, which corresponds to each of the FAIR sub-principles. Metrics are manually scored tests of individual FAIR principles, in the form of a questionnaire.

A [2019 paper](https://doi.org/10.1038/s41597-019-0184-5) from the group was published which introduced an automatable framework composed of `maturity indicators (MIs)`, their corresponding compliance tests, and a web evaluator to run sets of compliance tests and report the results.  In contrast to metrics, MIs must be evaluated by machine; the focus here is primarily on automation and objective assessment.

Metrics and MIs are open to feedback from the community at large.  The dedicated public GitHub repository is located [here](https://github.com/FAIRMetrics).

Another [2019 paper by Clark et al. and led by Dr Ma'ayan](https://doi.org/10.1016/j.cels.2019.09.011) introduces  an alternative set of tools and interpretation of the FAIR guidelines, developing the notion or `rubric`, which are detailed in the section below. 


### How is FAIR evaluated in the context of the CFDE?

In the context of the CFDE, aspects of FAIR are evaluated using the [FAIRshake tool](https://fairshake.cloud/), which interrogates a digital object using an appropriate [rubric of metrics](https://fairshake.cloud/rubric/). The metrics are questionnaire-style. Many digital objects have already been evaluated with the [NIH-CFDE FAIR Rubric](https://fairshake.cloud/rubric/36/). Within FAIRshake other organizations define rubrics containing metrics that are more appropriate for evaluating their own digital objects.


### Why evaluate FAIR?

As we hinted, the FAIR principles are `broad guiding principles`, sometimes providing `very specific directions` but sometimes also `leaving room for interpretation` or `customization to local, community specific needs`. For instance, `'enough metadata'` is highly dependent on the domain of application. Therefore, a `one size fits all approach` is not applicable hence the decoupling between the software agent performing the evaluation (FAIRShake or FAIREvaluator) from the need to build a framework to express the evaluation rules (e.g. `rubrics` or `maturity indicators` as consumed respectively by the cited evaluation engines).


### How to contribute, reform, evolve evaluation rules?

While it is possible to assess FAIR on general terms, specific domains of knowledge requires dedicated extensions. To give a practical example, `Findability` and `Interoperability` mandate that `sufficient metadata` is provided. However the amount of metadata varies depending on the application and content, so requirements for the description of *transcriptomics experiments* differs from *medical imaging* ones.
It is therefore necessary to craft domain specific profiles which can be used by the FAIR assessor tools to determine the level of compliance. When using [FAIRShake](https://fairshake.cloud/), this is achieved by the creation of dedicated `rubrics`.

As the field of scoring FAIR is still relatively new, several groups, e.g. [RDA FAIR Maturity Model working group](https://www.rd-alliance.org/groups/fair-data-maturity-model-wg),  have been established to evolve the metrics or maturity indicators in an attempt to resolve differences in interpretation of the FAIR principles and also to create a forum where discussions can take place.

* FAIR rubrics: [https://fairshake.cloud/rubric/](https://fairshake.cloud/rubric/)<br/>
* FAIR metrics github repository: [https://github.com/FAIRMetrics/Metrics](https://github.com/FAIRMetrics/Metrics)<br/>


## Conclusion


FAIR principles, first officially published in 2016, are meant to be guideposts for rendering a digital object more discoverable and (re)usable.  The CFDE evaluates FAIRness using FAIRshake, which leverage collections of metrics that interrogate one or more of the FAIR principles.  Community adherence to FAIR principles provides benefits to human and computational stakeholders alike by facilitating ongoing discovery and reuse of digital objects after initial publication and enabling knowledge integration to further scientific discovery.

