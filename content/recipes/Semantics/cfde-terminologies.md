# NIH CFDE Selected Terminologies

**Authors** [Philippe Rocca-Serra](https://orcid.org/0000-0001-9853-5668)

**Maintainers** [Philippe Rocca-Serra](https://orcid.org/0000-0001-9853-5668)

**Version**: 0.1

**License**: [CC0 1.0 Universal (CC0 1.0) Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/deed.en)

---

## Objectives

The main objective of this section is to draw the attention to the importance of semantics in `interoperability` and `reusability` as implemented in the C2M2 model and the associated task of ingesting datasets from an array of resources, each tackling a specific research area.

A secondary objective is to prepare for the `extract/transform/load` (ETL) processes by simply being aware of this model requirements.

## Overview
For a number of attributes, the [C2M2 model](https://github.com/nih-cfde/specifications-and-documentation) delegates to controlled terminologies and ontologies the associated value sets definition. This affords specification stability while allowing flexibility by outsourcing the maintenance needs for value set, typically when new values are required.
While the [C2M2 model specifications](https://github.com/nih-cfde/specifications-and-documentation) clearly identifies the elements requiring values selected from a controlled terminology, the following table offers a full overview.
The table also highlights the planned implementation, with phased releases from compliance level 0 through to compliance level 2, which will see the inclusion of new types, thereby extending the `interoperability` aspect of the FAIR potential of datasets made available by the DCC through the Deriva-based system following the `extraction transformation and load process` from the source repositories.

## C2M2 vetted Vocabularies

|Domain|Resource Name|License|C2M2 Level 0| C2M2 level1|C2M2 level2|
|-|-|-|-|-|- |
|id_namespace_string|CFDE internal CV|NA |:heavy_plus_sign:|:heavy_plus_sign: | :heavy_plus_sign:|
|subject_role|CFDE internal CV | NA | |:heavy_plus_sign: |:heavy_plus_sign:|
|subject_granularity |CFDE internal CV |NA | |:heavy_plus_sign:|:heavy_plus_sign:|
|protocol|CFDE internal CV |NA | | :heavy_plus_sign:|:heavy_plus_sign:|
|taxonomy| [NCBITax](http://www.obofoundry.org/ontology/ncbitaxon.html)|CC0 1.0 (public domain) | |:heavy_plus_sign:|:heavy_plus_sign:|
|anatomy| [UBERON](http://www.obofoundry.org/ontology/uberon.html)|CC-BY | |:heavy_plus_sign: |:heavy_plus_sign:|
|sample_type |[OBI](http://www.obofoundry.org/ontology/obi.html) |CC-BY | |:heavy_plus_sign:|:heavy_plus_sign:|
|assay_type| [OBI](http://www.obofoundry.org/ontology/obi.html) |CC-BY | | :heavy_plus_sign:|:heavy_plus_sign:|
|file_format|[EDAM](https://github.com/edamontology/edamontology)|CC BY-SA 4.0 | |:heavy_plus_sign: |:heavy_plus_sign:|
|data_type | [EDAM](https://github.com/edamontology/edamontology)|CC BY-SA 4.0 | |:heavy_plus_sign:|:heavy_plus_sign: |
|disease| [MONDO](https://mondo.monarchinitiative.org/)|CC-BY | | |:heavy_plus_sign:|
|disease| [DOID](http://www.obofoundry.org/ontology/doid.html)| CC-BY| | |:heavy_plus_sign:|


## Which terminologies DCCs currently use?

For each of the potential data sources and for a set of core search facets, a survey of semantic resources used by representative DCCs has been summerized in the table below.

>:warning:It is worth noting that the table includes a subsection (indicated in *italic*) which covers identification schemes used for molecular entities. These are distinct from concept annotation with ontology terms, however since they allow interoperability between resources, they have been included). 




| Domain            | MW                    | LINCS             | HMP                   | GTEx                                                     | 4D Nucleome           | KidsFirst                                                                                                    |
|-------------------|-----------------------|-------------------|-----------------------|----------------------------------------------------------|-----------------------|--------------------------------------------------------------------------------------------------------------|
| **taxonomy**          | free text             | free text         |free text             | free text                                                | free text             |free text                                                                                                    |
| **anatomy**           | free text             | free text         |free text           | [UBERON](http://www.obofoundry.org/ontology/uberon.html) | free text             | [NCIT](https://ncit.nci.nih.gov/ncitbrowser/)                                                                |
| **sample type**       | free text             | free text         |free text             | [UBERON](http://www.obofoundry.org/ontology/uberon.html) | free text             | [NCIT](https://ncit.nci.nih.gov/ncitbrowser/)                                                                |
| **disease**           | free text             | free text         |free text             | free text                                                | free text             | [HPO](https://hpo.jax.org/) [NCIT](https://ncit.nci.nih.gov/ncitbrowser/) [MONDO](http://www.obofoundry.org/ontology/mondo.html) |
| **assay type**        | internal cv/free text | [BAO](http://bioassayontology.org/)           |internal cv/free text | internal cv/free text                                    | internal cv/free text | internal cv/free text                                                                                        |
| **data type**         | _                     | free text         |free text             | _                                                        | internal cv/free text | internal cv/free text                                                                                        |
| chemical compound | [pubchem CID](https://pubchem.ncbi.nlm.nih.gov/),[InChi](https://www.inchi-trust.org/)     | [pubchem CID](https://pubchem.ncbi.nlm.nih.gov/),[InChi](https://www.inchi-trust.org/) | _                     | _                                                        | _                     | _                                                                                                            |
| gene product      | refseq                | _                 | _                     | _                                                        | _                     | _                                                                                                            |
| protein           | uniprot               | _                 | _                     | _                                                        | _                     | _                                                                                                            |

___

## Conclusions

* By explicitly identifying a number of semantic artefacts for describing key attributes, the C2M2 defines a curation framework, with the aim of anchoring free text descriptors to controlled terms, which can be exploited for query expansion or resource linking.
* The resource survey that has been carried out is an important step in the FAIRification process as it identifies potential `areas of intervention`, defined as semantic markup of free text description can deliver gains in `interoperability` and `reusability`.
* Taking the notion of `taxonomical descriptors` for example, the harmonization across the various sources can be easily achieved by relying on a resource such as NCBITaxonomy and the curation action is simplified by that limited diversity of *species* found in the different databases.
* On the other hand, the harmonization tasks for domains such as `sample type`, `assay type` can be more involved, not to mention the case of `phenotypic descriptions` or `disease`, even though `level 0 and level 1 compliance` do not expect such a degree of integration.

> ##  What to read next?
> * [CFDE C2M2 model](../Discoverability/c2m2.md)
> * [ETL to CFDE C2M2 model](../Discoverability/seo.ipynb)


