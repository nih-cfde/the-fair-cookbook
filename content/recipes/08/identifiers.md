# The need for identifiers

**authors**: [Philippe Rocca-Serra]()

**maintainers**

**version**: Initial Draft

**license**:

        

## Objectives:

The aim of the recipe is to provide an introduction to the notion of identifiers, the different kind of identifiers and the kind of infrastructure required to support their use in the context of CFDE and in the context of producing and consuming FAIR data.


## Definitions:

**identifier**: an identifier is a chain of characters (number, letter, symbol, or any combination of those) which is associated to an entity or a type of entities and which is used to refer to those entities in an indexing system.

**unique identifier**: a unique identifier (UID) is an identifier which  refers to only one instance of thing 

**locally unique identifier**: a locally unique identifier (LUID) is an  identifier which is unique to a given context (hence, local) but which may clash if moved out of this specific context. By clash, we mean that if dereferenced in the wrong context, it could return an instance different from the one it pointed to when it was minted in its original context.

**globally unique identifier**: a globally unique identifier  (GUID) is an identifier which is produced such that the probability of the exact same string is extremely low (but not null), hence global. Also known as `universally unique identifier` (UUID). Their production does not depend on central registration and relies on the generation of a 128-bit string.

```python
import uuid
id = uuid.uuid4() 
print(id)
5b6d0be2-d47f-11e8-9f9d-ccaf789d94a0
```

**persistent identifier**: a persistent identifier (PID) is an identifier which provides a long-lasting reference to a digital resource. The key notion introduced is that of`persistence`, which can only exist if a `resolution service` exists. Well known examples are `persistent identifiers` are `Digital Object Identifiers (DOI)`, `Archive Retrieval Keys (ARK)`, `Open Researcher and Contributor ID(ORCID)` or `Persistent Uniform Resource Locator (PURL)`. More examples can be found on the [PID forum](https://www.pidforum.org/).

**compact identifier**: a `compact identifier` is a unique string consisting of a `Prefix` (assigned by curator), a `colon (‘:’)`, and an `Accession (e.g. local identifier string)`. The prefix is composed of an optional `Provider Code`, and an assigned `Namespace`, separated by a slash (‘/’).

**identifier minting service**: an `identifier minting service` is a piece of software infrastructure which allows the production of an identifier. It can be as `simple` as as UUID generator (see above) or random number generator.

**identifier resolution service**: an identifier resolution service is a piece of software infrastructure which given an identifier can return a web resource about the entity designated by the identifier. Such service is essential to realize the notion of `persistence` of identifiers.


    
## The importance of PIDs in FAIR and in the context of CFDE:

Data interoperability as described by FAIR assumes that entities and information about them can be retrieved through`internet communication protocol`. This can thus only be realized by relying on PIDs and resolution service to obtain the resources of interest.

For a number of digital objects (`scholarly articles`, `grants`), persistent identifiers such DOI exist and for research `organizations` and `persons`, RORID and ORCID are gaining popularity becoming more widely used.

`Datasets` are another type of digital objects which are being identified by DOI with services such as [Zenodo](https://zenodo.org).

But `interoperability` goes far beyond reliable identification of these entities. For research scientists, entities such as:  
- [x] Taxonomic Information
- [x] Anatomical Information
- [x] Diseases and Conditions
- [x] Molecular Entities, such as:
    - [x] Chemicals
    - [x] Metabolites
    - [x] Genes
    - [x] Transcripts
    - [x] Protein
    - [x] Lipids
- [x] Pathways and Biochemical reactions
- [x] Assays
- [x] Instruments
- [x] Licenses

For all these entities, the **NIH CFDE** has identified a set of semantics artefacts/ontologies, the classes of which are all identified by PIDs and are used to annotated the datasets which will be represented in the [C2M2 model](TODO:ADD_URL) and made available through the [Deriva system](TODO:ADD_URL).

* Refer to the specific [NIH-CFDE recipe](TODO:ADD_URL) detailing which ontologies have been selected.

It is important to notice that for such resources, a central authority is responsible for issueing (minting) those identifiers as well as providing the landing pages for the different content types associated with these kind of PIDs.
This works well to address the semantic markup needs that arise in the data curation, data extraction transform load (ETL) processes. However, there is a need to be able to create resolvable identifiers on demands, for instance to uniquely identify data files. In order to discussion this specific use case, a specific document is available and details the use of [minids](https://fair-research.org/)

* Refer to the specific recipe on [MINIDS](https://github.com/nih-cfde/the-fair-cookbook/blob/dev/content/recipes/08/2/minids.md)




## Bibliographic References

1. Klump, J. and Huber, R., 2017. 20 Years of Persistent Identifiers – Which Systems are Here to Stay?. Data Science Journal, 16, p.9. [http://doi.org/10.5334/dsj-2017-009](http://doi.org/10.5334/dsj-2017-009)
2. McMurry JA, Juty N, Blomberg N, et al. Identifiers for the 21st century: How to design, provision, and reuse persistent identifiers to maximize utility and impact of life science data. PLoS Biol. 2017;15(6):e2001414. Published 2017 Jun 29. [http://doi.org/10.1371/journal.pbio.2001414](http://doi.org/10.1371/journal.pbio.2001414)
3. Martin Fenner, Mercè Crosas, Jeffrey S Grethe, David Kennedy, Henning Herm-jakob, Philippe Rocca-Serra, Gustavo Durand, Robin Berjon, Sebastian Karcher,Maryann Martone, and Tim Clark. 2019. A data citation roadmap for scholarly data repositories. Scientific Data6, 1 (2019), 1–9.[http://doi.org/10.1038/s41597-019-0031-80](http://doi.org/10.1038/s41597-019-0031-80)
4.https://www.pidforum.org/
5. John Kunze. The Entity (N2T) Resolver: low-risk, low-cost persistent identifica-tion.[https://hdl.handle.net/1813/3688](https://hdl.handle.net/1813/3688)
6. Wimalaratne, S., Juty, N., Kunze, J. et al. Uniform resolution of compact identifiers for biomedical data. Sci Data 5, 180029 (2018). [https://doi.org/10.1038/sdata.2018.29](https://doi.org/10.1038/sdata.2018.29)
7. Research Organization Registry
