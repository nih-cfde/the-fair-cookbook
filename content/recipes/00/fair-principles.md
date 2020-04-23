# Introduction to FAIR Principles

**Author(s):** John Cheadle

**Maintainer(s):** John Cheadle

**Version:** 1.0

**License:** GPLv2+

## Objectives
The aim of this recipe is to summarize the FAIR Guiding Principles as well as define terminology and provide additional resources for individuals who are new to FAIR.  The recipe also touches on how FAIR is evaluated in general and in the context of CFDE, and provides both internal and external links to pertinent resources.

## Step by Step Process:

### Step 1: What is FAIR?
The FAIR guidelines are a collection of principles by which to improve the Findability, Accessibility, Interoperability, and Reusability of data objects.  These principles emphasize discovery and reuse of data objects with minimal or no human intervention (i.e. automated and machine-actionable), but are targeted at human entities as well.

FAIR principles are described in detail [here](https://www.go-fair.org/fair-principles/).  The permanent URL that resolves to the previous link can be found [here](https://doi.org/10.25504/FAIRsharing.WWI10U).

### Step 2: When was FAIR established?
The FAIR guiding principles were first formally published in 2016 by Wilkinson, et al.  Since then, two additional publications centering around metrics and maturity indicators for FAIRness have been authored.  A permanent link to these papers is provided below:

* https://doi.org/10.1038/sdata.2016.18
* https://doi.org/10.1038/sdata.2018.118
* https://doi.org/10.1038/s41597-019-0184-5
    
### Step 3: Why do we care about FAIR?
The potential benefits to adhering to the FAIR principles are myriad.  The rationale outlined in the first published paper includes:

* Facilitation of ongoing discovery, evaluation, and reuse in downstream studies after initial publication of a digital object.
* Deep and broad knowledge integration by human and computational stakeholders alike to advance scientific discovery.
  
### Step 4: How is FAIR evaluated?
In 2018, Wilkinson et al. published a paper detailing the evaluation of FAIR using 14 exemplar metrics which corresponds to each of the FAIR sub-principles.  Metrics are manually scored tests of individual FAIR principles, in the form of a questionnaire.

A 2019 paper from the group was published which introduced an automatable framework composed of maturity indicators (MIs), their corresponding compliance tests, and a web evaluator to run sets of compliance tests and report the results.  In contrast to metrics, MIs must be evaluated by machine; the focus here is primarily on automation and objective assessment.

Metrics and MIs are open to feedback from the community at large.  The public GitHub repository is located [here](https://github.com/FAIRMetrics).

#### How is FAIR evaluated in the context of the CFDE?
n the context of the CFDE, aspects of FAIR are evaluated using the FAIRshake tool (link FAIRshake landing page), which interrogates a digital object using a specific rubric of metrics.  The metrics are questionnaire-style.  Within the FAIRshake context, other organizations define rubrics that contain metrics that are more appropriate for evaluating their digital objects.  More information can be found in the FAIRshake Rubric for CFDE recipe (link needed) within this cookbook.
    
### Step 5: Who evaluates FAIR?
Who IS evaluating FAIR?  For instance, if someone wanted to dispute/correct/change/question their FAIRshake score, who might they contact?  Can someone provide a resource for this?

## Conclusion
FAIR principles, first officially published in 2016, are meant to be guideposts for rendering a digital object more discoverable and (re)usable.  The CFDE evaluates FAIRness using FAIRshake, which leverage collections of metrics that interrogate one or more of the FAIR principles.  Community adherence to FAIR principles provides benefits to human and computational stakeholders alike by facilitating ongoing discovery and reuse of digital objects after initial publication and enabling knowledge integration to further scientific discovery.
