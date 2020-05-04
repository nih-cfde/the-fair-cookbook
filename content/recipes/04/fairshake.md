# Evaluating FAIRness with FAIRshake

A look at how we can use FAIRshake in a FAIR evaluation of DATS serialized metadata in the context of the CFDE.

**Authors**: Daniel J. B. Clarke

**Maintainers**: Daniel J. B. Clarke

**Version**: 1.0

**License**: GPLv2+


## Background

[FAIRness](https://github.com/nih-cfde/specifications-and-documentation/blob/master/draft-CFDE_glossary/glossary.md#FAIRness) is somewhat abstract. While all of the components of FAIRness can be strived towards, it remains difficult to provide a concrete answer about whether something is 'FAIR' or not. In most cases, improving something is next to impossible to do unless you have a way to measure it. To address this limitation of the FAIR guidelines, [FAIRshake](https://github.com/nih-cfde/specifications-and-documentation/blob/master/draft-CFDE_glossary/glossary.md#FAIRshake) was created with the basic goal of making FAIR more concrete and measurable. While FAIRshake provides a catalog of community-contributed ways to characterize FAIRness, it is still up to a given project to decide which they will adopt and/or create.

FAIRshake provides:
- a catalog of digital objects: any thing such as a dataset, API, workflow, that has its own unique identity and is the target of a FAIR assessment. That-is whatever it is, you want it to be Findable, Accessible, Interoperable and Reusable.
- a catalog of projects: any set of digital objects grouped for the purpose of analytic and findability purposes, e.g. if you plan on automating FAIR assessments, it makes sense to do it as part of a project so that assessments can be compared only against other assessments in your project.
- a catalog of metrics: any singular FAIR criterion that can often be answered with yes/no/percentage of compliance.
- a catalog of rubrics, sets of metrics meant to be answered together, e.g. a "FAIR" API should satisfy several independent metrics already registered in FAIRshake.
- facilitation of FAIR assessments: any digital object can be assessed with a given rubric in the context of a project both manually through the website and 'automatically' by enabling assessment registration over API. Some automatic assessments have been integrated into the manual assessment UI on FAIRshake but this is still in development. Contributing your own automatic assessment modules will be discussed in this article.
- aggregations of FAIR assessments: FAIRshake provides the FAIR insignia, a look at the average assessments on a given digital object, project, or rubirc. It also provides project analytics in the form of answer breakdown.

In this recipe we'll look at the process of performing a FAIR evaluation using FAIRshake starting from nothing and covering various decisions that must be made along the way. We'll use the CFDE DCC resources [transformed to DATS](TODO) as the target of our assessment. This is because an automated assessment common to all DCCs is not possible to begin with without a common machine-readable.

## Ingredients
1. A set of digital objects to assess for FAIRness
2. A rubric on FAIRshake encapsulating the FAIR metrics you wish to assess
3. Machine-readable (ideally standardized) metadata description in the case of automated assessments

## Objectives
1. Use FAIRshake to facilitate FAIR Rubric discovery and development
2. Assess a digital object manually
3. Identify avenues for performing automated assessments
4. Perform an automated assessment on a set of digital objects serialized with machine-readable metadata
5. Develop an understanding of how well your digital objects comply with the chosen rubric
6. Understand how new automated assessment mechanisms can be contributed to the FAIRshake ecosystem


## Recipe

### Using FAIRshake
FAIRshake can be accessed at [fairshake.cloud](https://fairshake.cloud) and has a youtube tutorial and some technical documentation accessible on the website. Let's walk through a simple example of using the website.

After [logging in to the website](https://fairshake.cloud/accounts/login/), we will be able to create content on the website. Let's try performing an assessment using the [FAIR metrics by fairmetrics.org Rubric](https://fairshake.cloud/rubric/25/). This rubric is a FAIRshake entry for the universal FAIR metrics published in [this paper](https://www.nature.com/articles/sdata2018118).
![FAIR metrics Rubric on FAIRshake](./images/ss1.png) 
To perform an assessment with this rubric, we'll need something to assess. For this, you can find a digital object already in FAIRshake or register your own (with 'create object' at the bottom of the rubric).
![Searching for Digital Objects to Assess on FAIRshake](./images/ss2.png)
![Starting an assessment on FAIRshake](./images/ss3.png)
The assessment may be associated with a project (or not), this is relevant if you want to aggregate a set of assessments after the fact. The target (digital object) and rubric are mandatory. When we confirm this, we can then submit a manual assessment with FAIRshake.
![Performing a manual assessment on FAIRshake](./images/ss4.png)
You may find that some of these questions are hard to answer, this is because the universal FAIR metrics are designed to be widely applicable and are as such, somewhat broad and abstract. While the metrics in this rubric are very useful to achieve, they may not be enough in certain contexts. If you complete and publish an assessment, your answers will become associated with the digital object and be used for rendering the insignia and in analytics for that digital object.
The rubric we used for the CFDE is [here](https://fairshake.cloud/rubric/36) and includes most of the FAIR metrics but also some metrics that address specific CFDE use-cases such as 'A relevant file type is present and resolvable with EDAM'.
This rubric was used to assess the metadata produced by the CFDE for several DCCs as part of [this project](https://fairshake.cloud/project/87), you can also see statistics for those assessments there.
![Reviewing FAIR assessment breakdown on FAIRshake](./images/ss5.png)
We could of course hire an army of people to assess all of the digital objects, in many cases however answers are redundant or automatable. Assuming the file-type can be found in the first place, we can write code which validates whether it's in EDAM or not. After determining these answers in bulk, we can then publish them on FAIRshake through the API.

### Preparing to perform Automated Assessments
Certain standards are very well defined and designed in such a way that makes it possible to computationally verify an instance is complying with it. In an ideal world, all standards would be made in this way, such that a mechanism exists for confirming compliance, in reality many standards aren't ultimately necessitating harmonization before datasets, apis, or anything to be used together.

Some examples of well defined standards are TCP/IP and HTTP, it is the effectiveness of these standards and their adoption which enables the internet to function and grow as it does. Another, perhaps more relevant, standard is RDF which defines a way to serialize metadata and permits harmonization via ontologies or shape constraint languages (such as SHACL). Another standard not explicitly based on RDF is JSON Schema. JSON Schema builds off of JSON and allows one to use json itself to define what is a valid JSON instance of some metadata. A JSON Schema document can effectively become its own standard given that it is well described and validatable using a JSON Schema validator.

In the case of assessing digital objects that comply with standards that are defined using mechanisms easily validated, automated assessments become simple and in many cases involve simply taking advantage of already constructed mechanisms for asserting compliance with those standards. In the case that those standards are **not** well defined; the best course of action would be to: convert those digital objects to an alternative and validatable standard or alternatively formally codify the standard. In either case you're doing some FAIRification in an effort to even begin the assessment. We have to do this step because you can't measure compliance with a standard if you don't have a quantifiable standard in the first place! Well you could try, manually.

### Performing an Automated Assessment on DATS
One can think of an automated assessment as a unit/integration test for compliance with a standard. Ideally, this test will reveal issues with integration at the digital object provider level at the benefit of the consumer of those digital objects. Automated assessments are only possible on existing machine-readable metadata and validatable standards, like DATS. As such we'll utilize DATS for our assessment; not only will we assess compliance with DATS itself, we'll go further with several additional 'optional' parts of DATS including ontological term verification and other sanity checks.

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


#### Publishing codified FAIRshake metrics and resolvers for assessment reproducibility
It is useful for reproducibility purposes but also for reusibility purposes for automated FAIR assessment code to be shared publicly. To that end a repository for storing that code and its association with the FAIRshake metrics was developed and can be found [here](https://github.com/MaayanLab/fairshake-assessments). This catalog and the code in it can also be used to perform future FAIR assessments that use the same metrics, rubrics, or resolvers. Pull requests are welcome but existing automated mechanisms can immediately be used by installing the package and using some of the core functions.

### Registering assessments on FAIRshake
Now that we've performed our assessment, we should publish these results on FAIRshake for us and the world to see where improvements can be made. It is important to note that the assessment results are a function of all parties (the digital object, the standard, the underlying repository or system that serves the digital object) and as such must be compared relative to the baseline.

```python
# TODO: insert CFDE assessment.py in a consumable form here
```

## Conclusion
The process of FAIRification with FAIRshake both manually and automatically was detailed and described with the CFDE case study. While the assessment described here was for the CFDE DATS serialized assets, the same process is applicable to any standard and any type of digital object. Examples exist for assessing APIs, Github repositories, and tools, among other case studies using standards applicable to each. As more standards become codified and accessible through FAIRshake, they will become simpler to evaluate ultimately increasing the FAIRness of the standard itself and anything using that standard.
