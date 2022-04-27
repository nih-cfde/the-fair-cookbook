# Controlled Terminologies & Ontologies

**authors**: [Philippe Rocca-Serra](https://orcid.org/orcid.org/0000-0001-9853-5668)

**maintainers**: [Philippe Rocca-Serra](https://orcid.org/orcid.org/0000-0001-9853-5668)

**version**: initial draft

**license**: [CC0 1.0 Universal (CC0 1.0) Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/deed.en)
    
___

## Objectives:

The aim of this recipe is to provide a compact introduction about `controlled terminologies` and `ontologies`, why these resources are central to the preservation of knowledge and data mining and how such resources are developed.


## Controlled terminology or Ontology, what's the difference ?

The need for `controlled vocabulary` often arises in situation where validation of textual information is necessary for operational requirements. 
The main initial driver for data entry harmonization is to increase query recall. It is most basic form, `keywords` may be used to perform indexation. However, if relying on user input alone, the chances of typographic errors increases with the number of users. These unavoidable events accumulate over time and end up  hurting the accuracy of search results and this is the reason for offering sets of predefined values. It reduces the noise. 
However, this can come at the cost of precision, as the predefined terms may not cover the exact thing users may need to describe. Furthermore, term mis-selection by user is not eliminated and introduces another type of error.

A `controlled terminology` is a *`normative`* collection of terms, the spelling of which is fixed and for which additional information may be provided such as `definition`, a set of `synonyms`, a `editor`, a `version` as well as a `license` determining the condition of use. The set of information about a specific controlled terminology term is designated as `term metadata`. In a controlled terminology, terms appear as a `flat list`, meaning that no relationship between any of the entities the controlled terminology represents is captured in any formal way.
This is the main drawback and limitation of `controlled terminologies`, which are often developed to support a data model or an application.

An`ontology` on the other hand, is a `formal representation of a domain knowledge where concepts are organized hierarchically`. The qualifier`formal` refers to a set of axioms and rules based on logic (e.g. `first order logic`) to structure, organize and check the consistency of the term hierarchy. As one can sense right away, ontologies are often more sophisticated artefact, supported by a more advanced theorical frameworks and and dedicated tools to develp of them (e.g. Protégé, TopBraid Composer, OBO foundry INCAtools or Robot tool)


    
## How are they built and maintained and why does it matter?

In order to improve over simple `controlled terminologies`, a huge area of research has developed to provide `tools` and `frameworks` supporting the representations of relationships between entities. The field is known as `formal semantics` in knowledge representation circles. One of most immediately available example of `entity relationships` and their potential for improving searches is the `is_a` relationship, which aims to cover the Parent / Child relationship that holds between 2 entities. For instance:
```
-Vertebrate
--mammal
---dolphin
--bird
---pigeon

```
In this representation, `classes` are *directly* asserted (placed) under a parent class if and only if the rule `new class is a child of the parent Class`. 'Orchids', which in this hierarchy.

While working on small structured vocabularies, it is still possible to detect potential errors, but this approach does not scale to support real life semantic artefacts which support complex biological and biomedical information systems. Languages ([RDF](https://www.w3.org/TR/2014/NOTE-rdf11-primer-20140624/),[SKOS](https://www.w3.org/2004/02/skos/),[OWL](https://www.w3.org/OWL/)) exist to provide the expressivity required to axiomatize relations between entities. In turn, building on these formal rules and associated proofers, automatic classifiers known as reasoner can inspect semantics artefacts to detect inconsistencies and to suggest parent classes. This is a step known as 'inference' where new knowledge is produced by the software agent rather than direct assertion by humans. This provide a significant support, even if far from supporting all the subtleties of actual knowledge.

There are `6 important features` to consider where selecting an semantic artefact for making FAIR datasets:

**1. What license and terms of use does it mandate?**

**2. What format does it come in?**

**3. Is it well maintained ? i.e. frequent release, term requests handling, versioning and deprecation policies clarified.**

**4. Are there stable persistent resolvable identifiers for all terms?**

**5. Who use it and What resources are being annotated with it?**

**6. Is it well documented?  There should be enough metadata for each class in the artefact and enough metadata about the artefact itself**
    
## Why are they useful?

As outlined in the introduction, the most immediate use for controlled terminology is to ensure consistency in data entry.
But the usefulness of ontologies and controlled vocabularies goes beyond this initial use.
The main purpose of biomedical ontologies is to structure knowledge so it can be operated on by software agents.

One needs to also understand that the two processes coexist and operate in parallel. As more experiments are performed, new discoveries are made. This new knowledge needs to be represented in the domain ontology so the new notions can be used to annotate the results of earlier experiments in the context of retrospective analysis.

For example, The [Gene Ontology (GO)](http://www.obofoundry.org/ontology/go.html) is a widely used resources to describe `Molecular Processes`, `Biological Functions` and `Molecular Components`. The Gene Ontology Consortium maintains the controlled vocabulary itself but also releases of Genome Wide Gene Ontology Annotations. These are resources which associate genes and genomic features found in those genomes with GO terms. These are very important resources especially in the context of genome wide analysis such as transcriptomics profiling analysis.
A particular type of analysis, [`enrichment analysis`](http://geneontology.org/docs/go-enrichment-analysis/), relies on the availability of such annotations to detect departures from expected probability distribution in an expression profile and which biological processes are most affected in specific conditions.

The applications are plentiful. The importance of ontologies for structuring information will only grow with the need to the obtain Machine Learning ready datasets and speed up the readiness of datasets. This is what FAIR is all about.


## Are all ontologies compatible with each other?

There is not simple answer to that question as it depends heavily on the type of tasks data scientists have in mind.
If the purpose is simply to improve query recall on a limited set of fields, a curation policy could be devised to mix and match resources to meet the needs at hands, possibly by building an application ontology.

However, in a more integrated framework, it is important to be aware of the some development choices made by the maintainers of the semantic artefacts.


* **In the context of basic research and model organism based research**, the **`OBO foundry`** is an organization which coordinates the development of interoperable resources. GO, mentioned earlier is one of them. The establishment of domain specific reference ontologies sharing the same underlying rules means that some level of compositional development can be done. By this, it means that axioms can be built connecting classes from compatible resources.
This point becomes particularly important when considering the role of `reasoner` when assessing and checking the consistency of artefacts themselves but also when analysing instance datasets themselves.

* **In the context of observation studies**, the OMOP model also relies on controlled terminologies such as SNOMED-CT, RxNORM for drugs and LOINC for clinical and laboratory test descriptions.

* **In the context of Clinical Data collections**, the CDISC models work tightly with CDISC Terminology, National Cancer Institute's Enterprise Vocabulary Services (EVS) and also recommend use of SNOMED-CT and terminologies such as LOINC, both of which come with specific licensing terms users need to get familiar with.


### Use Cases and Iterative Approach  


The use and implementation of common terminologies will enable a normalization/harmonization of variable labels (data label) and allowed values (data term) when querying a database. Implementing the use of common terminologies in the curation workflow will ensure consistency of the annotation across all studies.



### Selection Criteria

A set of widely accepted criteria for selecting terminologies (or other reporting standards) do not exists. However, the initial work by the Clinical and Translational Science Awards’ (CTSA) Omics Data Standards Working Group and BioSharing ([http://jamia.bmj.com/content/early/2013/10/03/amiajnl-2013-002066.long](http://jamia.bmj.com/content/early/2013/10/03/amiajnl-2013-002066.long)) has been used as starting point top define possible criteria for excluding and/or including a terminology resource.


*   **Exclusion criteria**:
    * :x: absent licence or terms of use (_indicator of usability_)
    * :x: restrictive licences or terms of use with restrictions on redistribution and reuse 
    * :x: absence of term definitions 
    * :x: absence of sufficient class metadata (_indicator of quality_)
    * :x: absence of sustainability indicators (_absence of funding records_) 
 
*   **Inclusion criteria**:
    * :heavy_check_mark:  scope and coverage meets the requirements of the concept identified
    * :heavy_check_mark:  unique URI, textual definition and IDs for each term
    * :heavy_check_mark:  resource releases are versioned
    * :heavy_check_mark:  size of resource (_indicator of coverage_)
    * :heavy_check_mark:  number of classes and subclasses (_indicator of depth_)
    * :heavy_check_mark:  number of terms having definitions and synonyms (_indicator of richness_)
    * :heavy_check_mark:  presence of an help desk and contact point (_indicator of community support_)
    * :heavy_check_mark:  presence of term submission tracker / issue tracker (_indicator of resource agility and capability to grow upon request_)
    * :heavy_check_mark:  potential integrative nature of the resource (_as indicator of translational application potential_)
    * :heavy_check_mark:  licensing information available (_as indicator of freedom to use_)
    * :heavy_check_mark:  use of of top level ontology (_as indicator of a resource built for generic use_)
    * :heavy_check_mark:  pragmatism (_as indicator of actual, current real life practice)_
    * :heavy_check_mark:  possibility of collaborating: the resource accepts complaints/remarks that aim to fix or improve the terminology, while the resource organisation commits to fix or improve the terminology in brief delays (one month after receipt?)

These criteria are simply indicative and need to be modulated depending on the `contexts` described in the introduction, as specific constraints (e.g. regulatory requirements) may take precedence over some of the criteria listed here. 

---

## Conclusions:

Choosing ontology and semantic resources is a complex issue, which requires careful consideration, taking into account the research context of the data production workflow, regulatory requirements that may apply. The choices made affect the integrative potential of a dataset as they influence the level of `interoperability`. 
Clearly declaring the semantic resources used to annotate a dataset also influence `findability` and `reusability` and it is good practice to do so.

> ####  What to read next?
> * [Ontology services](./onto-services.md)
> * [CFDE selected terminologies](./cfde-terminologies.md)

___

## Bibliography:

1. RDF.https://www.w3.org/TR/2014/NOTE-rdf11-primer-20140624/
2. SKOS. https://www.w3.org/2004/02/skos/
3. OWL. https://www.w3.org/OWL/
4. Hermit. http://www.hermit-reasoner.com/
5. Elk. http://www.cs.ox.ac.uk/isg/tools/ELK/
6. OBO Foundry. http://obofoundry.org/
7. CDISC. https://www.cdisc.org/standards
8. CDISC Controlled Terminology. https://www.cdisc.org/standards/terminology
9. LOINC. https://loinc.org/
10. Gene Ontology. http://geneontology.org/
11. Protégé. https://protege.stanford.edu/
12. Topbraid composer. https://www.topquadrant.com/products/topbraid-composer/
13. INCAtools. https://github.com/INCATools
14. ROBOT. [R.C. Jackson, J.P. Balhoff, E. Douglass, N.L. Harris, C.J. Mungall, and J.A. Overton. ROBOT: A tool for automating ontology workflows. BMC Bioinformatics, vol. 20, July 2019.](https://doi.org/10.1186/s12859-019-3002-3)


