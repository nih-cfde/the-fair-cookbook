# Evaluating FAIRness with FAIRshake

A tutorial that demonstrates  how to use FAIRshake to perform FAIR evaluations of DATS serialized metadata in the context of the CFDE.

**Authors**: [Daniel J. B. Clarke](https://orcid.org/0000-0003-3471-7416)

**Maintainers**: [Daniel J. B. Clarke](https://orcid.org/0000-0003-3471-7416)

**Version**: 1.0

**License**: [CC0 1.0 Universal (CC0 1.0) Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/deed.en)


## Background

Adhering to [FAIRness](https://cfde-published-documentation.readthedocs-hosted.com/en/latest/spec-and-docs/CFDE-glossary/#FAIRness) is somewhat abstract. While all of the components of becoming FAIR can be addressed at some level, it remains difficult to provide a concrete answer about whether something is indeed FAIR or not. In general, improvement is only real if it can be measured. To address this limitation of the FAIR guidelines, [FAIRshake](https://cfde-published-documentation.readthedocs-hosted.com/en/latest/spec-and-docs/CFDE-glossary/#FAIRshake) was created with the basic goal of making FAIR more concrete and measurable. While FAIRshake provides a catalog of community-contributed ways to characterize FAIRness, it is still up to a given project to decide which of these criteria they will adopt and/or create.


FAIRshake provides:

- A catalog of digital objects: these can be, for example,  datasets, APIs, workflows, each having their own unique identity and is the target of a FAIR assessment. That-is whatever the digital object is, you want it to assess how much it is Findable, Accessible, Interoperable and Reusable.
- A catalog of projects: where a project contains any set of digital objects grouped for the purpose of analytic and findability purposes, e.g., all digital objects that belong to a specific NIH Common Fund program could be bundled into one project. If you plan on automating FAIR assessments, it makes sense to do it as part of a project so that assessments can be compared only against other assessments within your project.

- A catalog of metrics: these are any singular FAIR criterion, or a FAIR compliance question, that can often be answered with yes/no/percentage of compliance.
- A catalog of rubrics: these are sets/bundles of FAIR metrics meant to be answered together, e.g., a "FAIR" API should satisfy several independent metrics already registered in FAIRshake, these can be a part of one or more rubrics
- Facilitation of FAIR assessments: any digital object can be assessed with a given rubric in the context of a project both manually through the FAIRshake website, or 'automatically' by enabling assessment registration over API. Some automatic assessments have been integrated into the manual assessment UI on FAIRshake but this is still under development. Contributing your own automatic assessment modules will be discussed in this tutorial
- Aggregations of FAIR assessments: FAIRshake provides the FAIR insignia, a look at the average assessments of a given digital object, project, or rubric. It also provides project analytics in the form of a report with summary statistics charts.

In this recipe we'll look at the process of performing a FAIR evaluation using FAIRshake starting from nothing and covering various decisions that must be made along the way. We'll use the CFDE DCC resources [transformed to DATS](https://github.com/nih-cfde/FAIR) as the target of our assessment. This is because an automated assessment that is common across all CF DCCs is not possible to begin with without a common machine-readable metadata standard.


## Ingredients

1. A set of digital objects to assess for FAIRness
2. A rubric from FAIRshake encapsulating the FAIR metrics you wish to use to perform the FAIR assessments
3. Machine-readable (ideally standardized) metadata description for enabling automated assessments


## Objectives

1. Use FAIRshake to facilitate FAIR Rubric discovery and development
2. Assess a digital object manually
3. Identify avenues for performing automated assessments
4. Perform an automated assessment on a set of digital objects serialized with machine-readable metadata
5. Develop an understanding of how well your digital objects comply with the chosen rubric
6. Understand how new automated assessment mechanisms can be contributed to the FAIRshake ecosystem

## Recipe

### Using FAIRshake

FAIRshake can be accessed at [fairshake.cloud](https://fairshake.cloud). There are several YouTube tutorials and some technical documentation accessible on the website. Let's walk you through a simple example of using the FAIRshake website.


After [logging in to the website](https://fairshake.cloud/accounts/login/), you will be able to create content on the site. Let's try performing an assessment using the [FAIR metrics by fairmetrics.org Rubric](https://fairshake.cloud/rubric/25/). This rubric is a FAIRshake entry for the universal FAIR metrics published in [this paper](https://www.nature.com/articles/sdata2018118).

<!-- ![FAIR metrics Rubric on FAIRshake](./images/ss1.png)  -->
<div><img src="https://github.com/nih-cfde/the-fair-cookbook/blob/master/content/recipes/04/images/ss1.png?raw=true" width="1000px" style="padding:1px;border:thin solid black;"/></div>


To perform an assessment with this rubric, we'll need something to assess. For this, you can find a digital object already in FAIRshake or register your own (with 'create object' at the bottom of the rubric).

<!-- ![Searching for Digital Objects to Assess on FAIRshake](./images/ss2.png) -->
<div><img src="https://github.com/nih-cfde/the-fair-cookbook/blob/master/content/recipes/04/images/ss2.png?raw=true" width="1000px" style="padding:1px;border:thin solid black;"/></div>

<!-- ![Starting an assessment on FAIRshake](./images/ss3.png) -->
<div><img src="https://github.com/nih-cfde/the-fair-cookbook/blob/master/content/recipes/04/images/ss3.png?raw=true" width="1000px" style="padding:1px;border:thin solid black;"/></div>


The assessment may be associated with a project (or not), this is relevant if you want to aggregate a set of assessments after the fact. The target (digital object) and rubric are mandatory. When we confirm this, we can then submit a manual assessment with FAIRshake.

<!-- ![Performing a manual assessment on FAIRshake](./images/ss4.png) -->
<div><img src="https://github.com/nih-cfde/the-fair-cookbook/blob/master/content/recipes/04/images/ss4.png?raw=true" width="1000px" style="padding:1px;border:thin solid black;"/></div>


You may find that some of these questions are hard to answer, this is because the universal FAIR metrics are designed to be widely applicable and are as such, somewhat broad and abstract. While the metrics in this rubric are useful to satisfy, they may not be enough in certain contexts. If you complete and publish an assessment, your answers will become associated with the digital object that you assessed, and this information will be used for rendering the insignia and perform the analytics for that digital object. The rubric we used for the CFDE is available from [here](https://fairshake.cloud/rubric/36). It includes most of the universal FAIR metrics but also some metrics that address specific CFDE use-cases such as 'A relevant file type is present and resolvable with EDAM'. This rubric was used to assess the metadata produced by the CFDE for several DCCs as part of [this project](https://fairshake.cloud/project/87), you can also see statistics for those assessments there.

<!-- ![Reviewing FAIR assessment breakdown on FAIRshake](./images/ss5.png) -->
<div><img src="https://github.com/nih-cfde/the-fair-cookbook/blob/master/content/recipes/04/images/ss5.png?raw=true" width="1000px" style="padding:1px;border:thin solid black;"/></div>


Manually assessing thousands of digital objects would be extremely time consuming and inefficient. In many cases answers to FAIR metrics are redundant so those can be automatable. For example,  we can write code that validates whether the file type of a digital object is in EDAM or not. After determining these answers in bulk, we can then publish them on FAIRshake with the FAIRshake API.


### Preparing to perform Automated Assessments


Certain standards are well defined and designed in a way that makes it possible to computationally verify whether a digital object is complying with the standard. In an ideal world, all standards should be made in this way, such that an automated mechanism exists for confirming compliance. In reality, however, many standards are not--ultimately necessitating harmonization before datasets, APIs, or anything to be used together.



Some examples of well-defined standards are TCP/IP and HTTP. The effectiveness of these standards and their adoption enables the internet to function and grow as it does. Another, more relevant standard is [RDF](https://cfde-published-documentation.readthedocs-hosted.com/en/latest/spec-and-docs/CFDE-glossary/#RDF). RDF defines a way to serialize metadata and permits harmonization via ontologies or shape constraint languages (such as [SHACL](https://www.w3.org/TR/shacl/)). Another standard that is not explicitly based on RDF is [JSON Schema](https://cfde-published-documentation.readthedocs-hosted.com/en/latest/spec-and-docs/CFDE-glossary/#JSON-Schema). JSON Schema builds off of [JSON](https://cfde-published-documentation.readthedocs-hosted.com/en/latest/spec-and-docs/CFDE-glossary/#JSON) and allows one to use json itself to define what is a valid JSON instance of some metadata. A JSON Schema document can effectively become its own standard given that it is well described and validatable using a JSON Schema validator.



In the case of assessing digital objects that comply with standards that are defined using mechanisms easily validated, automated assessments become simple and in many cases involve simply taking advantage of already constructed mechanisms for asserting compliance with those standards. In the case that those standards are not well defined; the best course of action would be to convert those digital objects to an alternative and validatable standard, or alternatively formally codify the standard. In either case, you're doing some FAIRification in an effort to even begin the assessment. We have to do this step because we can't measure compliance with a standard if we don't have a quantifiable standard in the first place! Well we could do it but only manually.


### Performing an Automated Assessment on DATS


One can think of an automated assessment as a unit/integration test for compliance with a standard. Ideally, this test will reveal issues with integration at the digital object provider level at the benefit of the consumer of those digital objects. Automated assessments are only possible on existing machine-readable metadata and validatable standards, such as [DATS](https://cfde-published-documentation.readthedocs-hosted.com/en/latest/spec-and-docs/CFDE-glossary/#DATS). As such we'll utilize DATS for our assessment; not only will we assess compliance with DATS itself, we'll go further with several additional 'optional' parts of DATS including ontological term verification and other sanity checks.


While there are several ways one can go about making an assessment, one way is to construct the rubric and metrics metadata while you construct the code to assert that metric.


```python
rubric = {
  '@id': 25, # ID in FAIRshake
  'name': 'NIH CFDE Interoperability',
  'description': 'This rubric identifies aspects of the metadata models which promote interoperable dataset querying and filtering',
  'metrics': {},
}

def metric(schema):
  ''' A python decorator for registering a metric for the rubric. Usage:
  @metric({
    '@id': unique_id,
    'metric': 'metadata'
  })
  def _(asset):
    yield { 'value': 1.0, 'comment': 'Success' }
  '''
  global rubric
  def wrapper(func):
    rubric['metrics'][schema['@id']] = dict(schema, func=func)
  setattr(wrapper, '__name__', schema['name'])
  return wrapper

def assess(rubric, doc):
  ''' How to use use this rubric for assessing a document. Usage:
  assess(rubric, { "your": "metadata" })
  '''
  assessment = {
    '@type': 'Assessment',
    'target': doc,
    'rubric': rubric['@id'],
    'answers': []
  }
  # print(assessment)
  for metric in rubric['metrics'].values():
    # print('Checking {}...'.format(metric['name']))
    for answer in metric['func'](doc):
      # print(' => {}'.format(answer))
      assessment['answers'].append({
        'metric': { k: v for k, v in metric.items() if k != 'func' },
        'answer': answer,
      })
  return assessment
```



With these functions setup, all we have left is to define the metrics and their metadata, then the assess function can operate on a given document. Let's write a metric for assessing DATS:


```python
@metric({
  '@id': 107, # ID in FAIRshake
  'name': 'DATS',
  'description': 'The metadata properly conforms with the DATS metadata specification',
  'principle': 'Findable',
})
def _(doc):
  from jsonschema import Draft4Validator
  errors = list(Draft4Validator({'$ref': 'http://w3id.org/dats/schema/dataset_schema.json'}).iter_errors(doc))
  yield {
    'value': max(1 - (len(errors) / 100), 0),
    'comment': 'DATS JSON-Schema Validation results in {} error(s)\n{}'.format(
      len(errors) if errors else 'no',
      '\n'.join(map(str, errors))
    ).strip(),
  }

# ... additional metrics ...
```


With this added metric, which uses jsonschema to validate the conformance of the metadata document to the DATS metadata model, an assessment would now produce answers for this specific metric. We've normalized the answers between 0 and 1, you get a 1 for full conformance or a 0 for >= 100 validation errors. It's important to note that this isn't the complete picture, perhaps you have a field for a landing page, but that website is down!



```python
@metric({
  '@id': 16, # ID in FAIRshake
  'name': 'Landing Page',
  'description': 'A landing page exists and is accessible',
  'principle': 'Findable',
})
def _(doc):
  landingPages = set(
    node['access']['landingPage']
    for node in jsonld_frame(doc, {
      '@type': 'DatasetDistribution',
      'access': {
        'landingPage': {},
      }
    })['@graph']
    if node['access'] and node['access']['landingPage']
  )
  if landingPages:
    for landingPage in landingPages:
      if requests.get(landingPage).status_code < 400:
        yield {
          'value': 1,
          'comment': 'Landing page found {} and seems to be accessible'.format(landingPage)
        }
      else:
        yield {
          'value': 0.75,
          'comment': 'Landing page found {} but seems to report a problem'.format(landingPage)
        }
  else:
    yield {
      'value': 0,
      'comment': 'Could not identify any landing pages'
    }

```


So we'll have a separate question for that where we'll go further. Above we have an example which uses jsonld framing to find landing pages, for each of those landing pages we attempt to load the page and expect to get a reasonable http status code (<400 is 200s for success, or 300s for redirects). This could be improved further to be more stringent (ensure we can find the title of our document on the landing page or something along those lines) but even this basic loose criterion is not always satisfied.



Ultimately this can become a command line application that we run in parallel on lots of DATS metadata. You can refer to the scripts [here](https://github.com/nih-cfde/FAIR/tree/master/Demos/FAIRAssessment) for examples on how you can accomplish this. It's also possible to resolve additional metadata in the process of the assessment through forward chaining or other methods, an example of an assessment like that is also on that page: `data_citation_assessment.py` which uses a url to negotiate and resolve microdata according to this [Data citation paper's guidelines](https://www.nature.com/articles/s41597-019-0031-8).


### Publishing codified FAIRshake metrics and resolvers for assessment reproducibility


It is useful for reproducibility purposes but also for reusability purposes for automated FAIR assessment code to be shared publicly. To that end, a repository for storing that code and its association with the FAIRshake metrics was developed and can be found [here](https://github.com/MaayanLab/fairshake-assessments). This catalog and the code in it can also be used to perform future FAIR assessments that use the same metrics, rubrics, or resolvers. Pull requests are welcome but existing automated mechanisms can immediately be used by installing the package and using some of the core functions. Performing this assessment with that repository works like so:



```python
#!/bin/python
# assumption: DATS objects are generated line by line
# usage: assess.py < input_dats.txt > output_assessments.txt

import sys, json
from fairshake_assessments.core import assess_many_async
from fairshake_assessments.rubrics.rubric_36_nih_cfde import rubric_36_nih_cfde

for assessment in assess_many_async(map(json.loads, sys.stdin)):
  print(json.dumps(assessment))
```


Note that other rubrics, metrics, and resolvers (e.g. ways of finding DATS from a `url`) are available in the `fairshake-assessments` and are associated with some of the FAIRshake metrics.


### Registering assessments on FAIRshake

Now that we've performed our assessment, we should publish these results on FAIRshake for us and the world to see where improvements can be made. It is important to note that the assessment results are a function of all parties (the digital object, the standard, the underlying repository or system that serves the digital object) and as such must be compared relative to the same baseline.



```python
#!/bin/python
# assumption: DATS objects are generated line by line
# usage: register.py < output_assessments.txt

import sys, json
from fairshake_assessments.core import (
  get_fairshake_client,
  find_or_create_fairshake_digital_object,
  publish_fairshake_assessment,
)

# assumption: DATS objects are generated line by line
# usage: API_KEY='' assess.py < input_dats.txt > output_assessments.txt
# see https://fairshake.cloud/accounts/api_access/ for an API_KEY

fairshake = get_fairshake_client(api_key=os.environ['API_KEY'])
for assessment in map(json.loads, sys.stdin):
  target = find_or_create_fairshake_digital_object(fairshake=fairshake, **assessment['target'])
  publish_fairshake_assessment(fairshake=fairshake, **target)
```

## Conclusion

The process of FAIRification with FAIRshake both manually and automatically was detailed and described with a CFDE case study. While the assessment described here was for the CFDE DATS serialized assets, the same process is applicable to any standard and any type of digital object. Examples exist for assessing APIs, GitHub repositories, and tools, among other case studies using standards applicable to each. As more standards become codified and accessible through FAIRshake, they will become simpler to evaluate, ultimately increasing the FAIRness of the standard itself and anything using that standard. It should be noted that the process of using FAIRshake for performing assessments is mainly designed to increase awareness about standards that digital object producers can apply to improve the FAIRness of the digital assets they produce and publish.
