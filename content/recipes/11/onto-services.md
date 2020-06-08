# Ontology services

**authors**: [Philippe Rocca-Serra](https://orcid.org/0000-0001-9853-5668)

**maintainers**: [Philippe Rocca-Serra](https://orcid.org/0000-0001-9853-5668)

**version**: initial draft

**license**: GPLv2+

        

## Objectives:

The aim of this chapter is to provide an overview of services and infrastructures available around terminologies and controlled vocabularies.  The services referred here encompass the following:
* terminology hosting
* terminology versioning
* terminology browsing
* term selection and metadata display
* free text annotation and semantic markup
* automatic annotation
* ontology mapping services


### Clinical Trial Data:

Operating in the field of Clinical Trials means that datasets are generated during `interventional studies`, meaning that researchers influence and control the predictor variables, which are usually different intensity levels of therapeutic agents in order to gain insights in terms of benefits in patient outcomes.
In this context, regulatory requirements make it so that data must be recorded in standard forms to allow for review and appraisal by US FDA reviewers. This means that the [CDISC standards]() are the *`de-facto standard`* in the area, which mandates the use of semantics resources such as:

| Semantic Resource|Domain |License |Format |Service|
|--|--|--|--|--|
|CDISC vocabulary|clinical trial data|||EVS|
|NCI Thesaurus|biomedicine|||EVS,Bioportal|
|SNOMED-CT|pathology|||EVS,Bioportal|
|UMLS|pathology|||EVS,Bioportal|
|LOINC|laboratory tests|||[Bioportal](https://bioportal.bioontology.org/ontologies/LOINC)|
|RxNORM|drugs|||[Bioportal](https://bioportal.bioontology.org/ontologies/RXNORM)|
|GUDID|instruments|||[accessGUDID](https://accessgudid.nlm.nih.gov/)|

All available from the [NCBI EVA system](https://evs.nci.nih.gov/).

> :warning:  Some resources are only available under restrictive licences, which prevent derivative work, which may limit access and use. 


### Observational Health Data:

This context refers to data collected during observation studies, which in constrat to `interventional studies`, draws inferences from a sample to a population where the independent variable is not under the control of the researcher because of ethical concerns or logistical constraints [1]. This is typically the case in the context of epidemiological work or exposure follow-up studies in the context of risk assessment and evaluation of clinical outcomes. `Observational health data` can also include `electronic health records (EHR)` or ` administrative insurance claims` and allow research around acquiring *`real world evidence`* from large corpora of data.
In this specific context, a model and associated set of standards has been particularly successful. With several hundred millions of patient information structured using the **Observational Medical Outcomes Partnership (OMOP)**, the Observational Health Data Sciences and Informatics (OHDSI) `open-science community` has been particularly successful. Therefore, building a FAIRification process around the standard stack produced by the ODHSI community needs to be considered if operated in such a `data context`.


The vocabulary server [Athena](https://athena.ohdsi.org/search-terms/terms) is the tool developed to support the needs of the OMOP/OHDSI community. Accessing the vocabulary services means accepting the SNOMED-CT terms of use.

The table below presents a small subset of semantic resources available from the Athena service (the largest and most commonly used)

| Semantic Resource|Domain |License |Format |Service|
|--|--|--|--|--|
|SNOMED-CT|pathology|||Athena|
|UMLS|pathology|||Athena|
|LOINC|laboratory tests|||Athena|
|RxNORM|drugs|||Athena|
|UCUM||||Athena|
|ICD9/10||||Athena|


> :warning:  Some resources are only available under restrictive licences, which prevent derivative work, which may limit access and use. 


For a more detail view and deep-dive into the ODHSI and OMOP semantic support, the reading the chapter dedicated to the [`controlled terminology` in the **`Book of OHDSI`**](https://ohdsi.github.io/TheBookOfOhdsi/StandardizedVocabularies.html)


### Basic research context:

This refers to datasets and research output being generated using model organisms and cellular systems in the context of basic, fundamental research. In this arena, the regulatory pressure is much less present but this does not rule out data management good practice and proper archival requirements.
As a consequence of fewer constraints, researchers are often confronted with a sea of options. This section aims to provide some guidance when tasked with deciding on which semantic resource to use.

#### :bell: **An important consideration** 
to bear in mind when writing selecting semantic resources is to assess whether or not `data archival in public repositories will be required`. For instance, submitting to NCBI Gene Expression Omnibus Data archive places no requirement but if depositing to EMBL-EBI ArrayExpress, then selecting a resource such as the [Experimental Factor Ontology](https://efo.owl) could ease deposition.

#### :bell: **[the FAIRsharing registry](https://fairsharing.org)** 
is an ELIXIR resources which provides invaluable content as the catalogue offers an overview of the various semantics artefacts used by public data repositories.

A number on open source, public and for some of them, interoperable by design resources are developed and distributed via the [OBO foundry](http://www.obofoundry.org/). 

These can be accessed via several vocabulary services maintainde by public institutions:

|Service|web address|hosting institution|
|-|-|-|
|Ontobee|[http://www.ontobee.org/ontology/](http://www.ontobee.org/ontology/)|University of Michigan Medical School|
|Ontology Lookup Service|[https://www.ebi.ac.uk/ols/index](https://www.ebi.ac.uk/ols/index)|EMBL-European Bioinformatics Institute|
|NCBO Bioportal|[https://bioportal.bioontology.org/](https://bioportal.bioontology.org/)|National Centre for Biomedical Ontologies, Stanford University| 

---

## Conclusions:

Semantic artefacts (Lexicons, Controlled Terminologies, Ontologies) can be accessed through a number of publicly available services, each with specific features and services attached to them.
For specialized domains, it may be beneficial to access the specialized servers (e.g. Athena), as they, to some extent, limit to search space to only those resources relevant to the fields.
This is in contrast to more general purpose, domain agnostic vocabulary services.
> ####  What to read next?
> * [CFDE selected terminologies?](../14/cfde-terminologies.html)




## References:

Smith, B., Ceusters, W., Klagges, B. et al. Relations in biomedical ontologies. Genome Biol 6, R46 (2005). https://doi.org/10.1186/gb-2005-6-5-r46

Rocca-Serra P, Bratfalean D, Richard F, Marshall C, Romacker M., Auffray C, ., … on the behalf of the eTRIKS consortium, . (2016, April 25). eTRIKS Standards Starter Pack Release 1.1 April 2016. Zenodo. http://doi.org/10.5281/zenodo.50825

Malone J, Stevens R, Jupp S, Hancocks T, Parkinson H, Brooksbank C. Ten Simple Rules for Selecting a Bio-ontology. PLoS Comput Biol. 2016;12(2):e1004743. Published 2016 Feb 11. http://doi.org/10.1371/journal.pcbi.1004743

Bairoch A. The Cellosaurus, a cell line knowledge resource. J. Biomol. Tech. (2018) 29:25-38. http://doi.org/10.7171/jbt.18-2902-002.

Sansone, S.-A., McQuilton, P., Rocca-Serra, P., Gonzalez-Beltran, A., Izzo, M., Lister, A.L. and Thurston, M. (2019) FAIRsharing as a community approach to standards, repositories and policies. Nature biotechnology, 37, 358: http://doi.org/10.1038/s41587-019-0080-8.

Hripcsak, G., Ryan, P. B., Duke, J. D., Shah, N. H., Park, R. W., Huser, V., Suchard, M. A., Schuemie, M. J., DeFalco, F. J., Perotte, A., Banda, J. M., Reich, C. G., Schilling, L. M., Matheny, M. E., Meeker, D., Pratt, N., & Madigan, D. (2016). Characterizing treatment pathways at scale using the OHDSI network. Proceedings of the National Academy of Sciences of the United States of America, 113(27), 7329–7336. https://doi.org/10.1073/pnas.1510502113

Hripcsak, George et al. “Observational Health Data Sciences and Informatics (OHDSI): Opportunities for Observational Researchers.” Studies in health technology and informatics vol. 216 (2015): 574-8.



