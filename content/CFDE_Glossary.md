# CFDE Glossary

## Controlled Vocabulary

**Asset** - a sample or a file.

**Biospecimens** - a material collected from an organism, a cell culture, or a material containing organisms, such as an environmental material. 

**Data-Generating Events** - a process, such as a data acquisition or a data transformation, resulting in the creation of a file (digital asset).

**Data Object** - a region of storage that contains a value or group of values. Each value can be accessed using its identifier or a more complex expression that refers to the object. In addition, each object has a unique data type.

**Dataset** - a collection of data, published or curated by a single agent, and available for access or download in one or more formats.

**DATS** - [Data Article Tag Suite](https://github.com/datatagsuite/README) is a data model for representing key information about datasets with an emphasis on data discovery and data findability, which has inspired the creation of the NIH-C2M2 model. [The DATS model is expressed as a JSON schema](https://datatagsuite.github.io/docs/html/dats.html). Associated JSON-LD context files support search engine optimization because they map into [schema.org](https://schema.org) and [DCAT](www.w3.org/TR/vocab-dcat-2/). Mappings into biological entities are also available via [OBO Foundry resources](http://www.obofoundry.org). 

**DERIVA** - Discovery Environment for Relational Information and Versioned Assets. A suite of tools and services that are designed to significantly reduce the overhead and complexity of creating and managing complex, big datasets. DERIVA provides a digital asset management system for scientific data to streamline the acquisition, modeling, management, and sharing of complex, big data, and provides interfaces so that these data can be delivered to diverse external tools for big-data analysis and analytic tools.

**[FAIR](https://www.go-fair.org/fair-principles/)** - Findable, Accessible, Interoperable, and Reusable. Making data FAIR is the main goal of the DCCs.

**[FAIRshake](https://fairshake.cloud/)** - a tool produced for carrying out *FAIR Assessment*. Under the CFDE, each data center’s inventory will be evaluated consistently based on FAIRshake, and the Coordinating Center will work with the individual Common Fund programs to adjust FAIR measures to meet the needs of the Common Fund. FAIRshake includes evaluating the FAIRness of digital objects including datasets, tools, and repositories.

**Figshare** - an online open access repository where researchers can preserve and share their research outputs, including figures, datasets, images, and videos.

**File** - digital objects that each of the DCCs host, such as genomic sequence, metagenomic, RNA-Seq, physiological, and metabolic data.

**Frictionless Data Package** - a format specification produced by the Open Knowledge Foundation and supported by the Frictionless.io organization. It aims to shorten the path from data to insight with a collection of specifications and software for the publication, transport, and consumption of data. This kills the cycle of find/improve/share that makes for a dynamic and productive data ecosystem.

**Globus Automate** - a distributed research automation platform that addresses the problem of securely and reliably automating, for many thousands of scientists, sequences of data management tasks that may span locations, storage systems, administrative domains, and timescales, and integrate both mechanical and human inputs.

**GUID** - Globally Unique IDentifier. A 128-bit unique identifier used to uniquely identify an entity as modern hashing functions used to generate those make identifier collisions (the event of the function producing the same sequence) highly unlikely (but not impossible).

**Insignia** - a grid of colored squares used to visually communicate FAIRness level.

**Metadata** - a type of information entity usually defined as data about the data, understood as descriptors to understand the context of a dataset. For example, metadata about an FASTQ file may be file size or file creator. Metadata is often classified into descriptive metadata, structural metadata, administrative metadata, and provenance metadata, all of which provide context to the actual data/dataset.

**Organization** - an entity comprising of multiple people, such as an institution or an association, that has a particular purpose.

**POC I/II** - proof of concept. A realization of a certain method or idea in order to demonstrate its feasibility. 

**Project** 

**Sample** - see *Biospecimens*.

**Subject** - a study participant (human, animal) from which samples may be obtained.

**Subject Group** - a set of study subjects, often grouped based on a set of criteria or the types of intervention study that the subjects will undergo.


## File Formats and Types 

**CFDE Asset Manifest** - a collection of *Assets* described by the *CFDE Asset Specification*. The ecosystem will support the concept of a manifest that describes a collection of files. The manifests enable bundling lists of CFDE data assets into a machine-readable file using a common format. Manifests will also be used to publish the complete inventories of data from each DCC, and will enable uniform collection of asset metadata to support indexing of the assets in the CFDE portal.

**CFDE Asset Specification** - defines the set of attributes used to charaterize an *Asset*. The specification simplifies the discovery of assets hosted at the DCCs with a minimal set of descriptors for each of these files. The types of files that are referenced (e.g., genomic sequence, metagenomic, RNA-Seq, physiological and metabolic data) are flexible and contain a small number of essential elements such as a *GUID*, originating institution (e.g., Broad Institute), assay type (e.g., whole genome/exome, transcriptome, epigenome), file type (e.g., fastq, alignment, vcf, counts), and tissue source and species name for the sample.
![data asset specification](https://user-images.githubusercontent.com/40363469/66134046-ac16bc80-e5c5-11e9-9b30-66407a3446e5.png)

**[CFDE Common Metadata Format](https://fair-research.org/deliverables/cfde-metadata-format.html)** - specifies a minimal set of attributes (metadata) related to an *Asset*.
![common metadata format](https://user-images.githubusercontent.com/40363469/66134031-a8833580-e5c5-11e9-9cc8-5e4b275fa20c.png)

**[Core ER Diagram](https://github.com/nih-cfde/cfde-deriva/blob/2019-08/diagrams/cfde-core-model.png)**

**[Core Table Schema](https://github.com/nih-cfde/cfde-deriva/blob/2019-08/table-schema/cfde-core-model.json)**

**[Entity-Relation Diagram](https://github.com/nih-cfde/cfde-deriva/blob/2019-10/extractors_and_metadata.GTEx/cfde-core-model.2019.10.21.1430.png)**

**Inventory** - asset inventory distributed by the DCCs through a portal.

**Metadata Manifest** - a file that includes metadata for a group of accompanying files that are part of a coherent unit (manifest), such as name, version, background scripts, and browser actions.


## Processes

**C2M2 Creation Flow**

**C2M2 Extractor Flow**

**FAIR Assessment** - the process of evaluating the level of compliance of a dataset with the FAIR principles. The assessment may be performed with tools such as [FAIRshake](https://fairshake.cloud) or [FAIREvaluator](https://fairsharing.github.io/FAIR-Evaluator-FrontEnd/#!/).

**Globus Automate Flow** - Globus, a software service created and based at the University of Chicago, helps scientists simplify their workflow by automating data transfer and synchronization tasks. Users can create automated sequences initiated by events.

**Master Flow**

**Metadata Ingest** - assigning identifiers to the objects and then extracting or creating metadata for these objects.

**[Table Schema to DERIVA Translation](https://github.com/nih-cfde/cfde-deriva/blob/2019-08/examples/tableschema_to_deriva.py)**


## Software and Tools

**API** - Application Programmer Interface. Allows developers to manipulate (query, update) remote data sources through specific protocols or specific standards for communication (e.g., REST,SOAP). An important element of the ecosystem will be the standardization and publishing of an API that can be used by data consumers to retrieve the inventories, the data asset specification, and additional metadata associated with the assets. This will allow for consumers of these inventories to programmatically interrogate the federated system for information that may be relevant to a consuming service.

**C2M2** - Cross Cut Metadata Model. 

**[CFDE Data Dashboard](https://cfde.derivacloud.org/deriva-webapps/plot/)** - an interface that monitors DCC data upload to the cloud and usage statistics to support cross-DCC search and ecosystem integration.

**CFDE Query Portal** - a portal enabling users and administrators to search all the federated data assets at each Common Fund Program. The CFDE portal increases a user's ability to find these important resources, as well as mix and match sets of data from each site to use in subsequent analysis. Administrators and Program Officers at Common Fund can use a single website to view the growth of data from their program over time, review objective FAIR metrics for these assets, understand download statistics and geographic distribution, and view the degree of harmonization of these data in comparison to other sites.

**[Data Citation Rubric](https://github.com/nih-cfde/FAIR/blob/master/Demos/FAIRAssessment/data_citation_rubric.py)**

**dbGaP** - Database of Genotypes and Phenotypes.

**DERIVA Catalog** - a group of assets that may be digital objects (i.e., files) or references to physical objects. DERIVA uses an entity-relationship data model to catalog and organize these assets. 

**FAIR Insignia** - to visually communicate FAIRness level, a grid of colored squares, called the FAIR insignia, was developed. The FAIR insignia identifies areas of strength and weakness in the FAIRness level of digital objects, guiding digital object producers on how to improve the FAIRness of their products. 

**GitHub** - an online hub for storing and sharing computer programs and other plain text files. The CFDE team uses it for storage, hosting websites, communications, and project management.

**Jupyter Notebook** - a web-based interactive environment for organizing data, performing computation, and visualizing output.

**NPM** - a package manager for the JavaScript programming language. It is the default package manager for the JavaScript runtime environment Node.js. It consists of a command line client, also called npm, and an online database of public and paid-for private packages, called the npm registry.


## Use Case Terms

**Objective** - a description of a scientific process, told without reference to a specific technology solution. Focuses on resources required, method(s) followed, and outcome(s) targeted. Can be validated with scientific stakeholders.

**Persona** - a type of user who will appear in the epics and stories that follow.

**Requirement** - a well-scoped and defined piece of software or data engineering work that is needed to support a User Task. These should be small tasks that can be verified with engineering teams (e.g., did we deliver it? Yes or no.) A single requirement may be important for any number of different User Tasks, and various collections of Requirements can be grouped to support different User Tasks.

**Summary** - a high-level, non-technical description of an entire Use Case. The user in each summary has a name, a scientific or administrative problem, and both proximate and ultimate goals. The focus is on the problem and what is generally needed to solve it.

**User Task** - a story, told from the user’s perspective that captures a concrete step in a user's interactions with tools (e.g., software solutions) in the service of achieving the scientific objective. Must be written in terms that are meaningful to the user, from their perspective. This can be thought of as one in a series of medium scale tasks that must be completed to answer the question posed in the scientific objective. The list of User Tasks in a Use Case should cover everything the users needs to achieve their goals, even interactions that do not involve the software or data from the Common Fund.


## Other

**A2CPS** - NIH’s Acute to Chronic Pain Signatures program. The most comprehensive study to date to investigate the connections of peripheral biology, brain, psychological, and bio-behavioral risk factors. Composed of a consortium of organizations and scientists throughout the U.S. and Canada, A2CPS is part of the multi-pronged [NIH HEAL](https://heal.nih.gov/) (Helping to End Addiction Long-Term) initiative, an aggressive effort to speed scientific solutions to stem the national opioid public health crisis.

**ASHG** - American Society of Human Genetics. They hold an annual conference that is the largest human genetics and genomics meeting and exposition in the world.

**BIC** - Bioinformatics Center. The BIC is responsible for the task of harmonizing the large quantity and diversity of data and metadata being generated by the consortium and performing meaningful integrative analyses across these omics data types.

**CC** - Coordinating Center. The CFDE-CC’s purpose is to improve growth in use and reuse of CF program data by supporting DCCs that participate in the Common Fund Data Ecosystem.

**CFDE** - Common Fund Data Ecosystem. A data ecosystem is a collection of data silos or commons joined together by a set of standards and services that facilitate findability, accessibility, reuse, and interoperability of datasets between silos/commons. A data ecosystem is focused on enabling multi-way connectivity between datasets, in a horizontal fashion, rather than deeper vertical analysis within each dataset. The goal of an ecosystem is to enable use cases between data silos, not within.

**Common Fund Programs** - the intent of the CF programs is to provide a strategic and nimble approach to address key roadblocks in biomedical research that impede basic scientific discovery and its translation into improved human health. In addition, these programs capitalize on emerging opportunities to catalyze the rate of progress across multiple biomedical fields. The CF programs include:
  * 4DN - The 4D Nucleome program's goal is to study the three-dimensional organization of the nucleus in space and time (the 4th dimension). 
  * GTEx - the Genotype-Tissue Expression project is an ongoing effort to build a comprehensive public resource to study tissue-specific gene expression and regulation.
  * HMP - the Human Microbiome Project whose mission is to generate resources to facilitate characterization of the human microbiota to further our understanding of how the microbiome impacts human health and disease. 
  * Kids First - the Kids First Pediatric Research Program Data Resource Center enables researchers, clinicians, and patients to work together to accelerate research and promote new discoveries for children affected with cancer and structural birth defects. 
  * LINCS - the Library of Integrated Network-based Cellular Signatures project is based on the premise that disrupting any one of the many steps of a given biological process will cause related changes in the molecular and cellular characteristics, behavior, and/or function of the cell – the observable composite of which is known as the cellular phenotype. Observing how and when a cell’s phenotype is altered by specific stressors can provide clues about the underlying mechanisms involved in perturbation and, ultimately, disease.
  * Metabolomics - this program was developed with the goal of increasing national capacity in metabolomics by supporting the development of next generation technologies, providing training and mentoring opportunities, increasing the inventory and availability of high quality reference standards, and promoting data sharing and collaboration.
  * SPARC - the Stimulating Peripheral Activity to Relieve Conditions program seeks to accelerate development of therapeutic devices that modulate electrical activity in nerves to improve organ function.

**Controlled Vocabulary** - an organized arrangement of words and phrases used to index content and/or to retrieve content through browsing or searching. It typically includes preferred and variant terms and has a defined scope or describes a specific domain. For example, the DCIC curates an internal 4DN controlled vocabulary to provide definitions for emerging technologies and techniques, metadata terms, and captures important data features not defined by previous ontologies.

**DCC** - Data Coordinating/Resource Center.

**DCIC** - Data generated by 4DN partner institutions are integrated, curated, analyzed, and disseminated by the 4DN Data Coordination and Integration Center (DCIC).

**DTC** - Data and Tools Cores. The Metabolomics Program consortium consists of six RCMRCs and seven DTCs that are overseen by the Metabolomics Consortium Coordinating Center at the University of Florida.

**eRA Commons** - Designated ID provider for the whitelist.

**HMP** - Human Microbiome Project. 

**M3C** - the Metabolomics Consortium Coordinating Center at the University of Florida, which handles overall coordination for the Metabolomics program.

**Metabolomics Workbench Metabolite Database** – a Postgres database containing over 65,000 structures and annotations of biologically relevant metabolites collected from public repositories (e.g., LIPID MAPS, ChEBI, HMDB, BMRB, PubChem, KEGG). Users can search for metabolites in the database by substructure, text, or mass (m/z ratio). Each entry contains key information about the metabolite, including structure, molecular weight, common and systematic names, PubChem compound ID, and classification. Entries also contain cross references to external databases and repositories (e.g., HMDB, ChEBI, LIPID MAPS, METLIN, ChemSpider, KEGG, etc.) as well as links to the MoNA MS spectra and human metabolic pathways containing the metabolite. Additionally, the open-source chemistry cartridge enables substructure searching, generation of chemistry-centric attributes (formula, exact mass), and interconversion of molecular formats.

**MGP** – Human Metabolome Gene/Protein Database. Developed by the Common Fund Metabolomics program. A database of metabolome-related genes and proteins containing over 7,300 genes and over 15,500 proteins. Users can search by gene (name, symbol, entrez ID, etc.), HMDB Pathway, or Reactome Pathway. MGP displays genes/proteins and metabolites associated with a pathway of interest. Searching by gene displays information about the gene’s associated proteins and pathways, including a summary of the function and metabolites involved in the pathway.

**MoTrPAC** – Molecular Transducers of Physical Activity Consortium.

**MW** – Metabolomics Workbench. Developed by the Common Fund Metabolomics program, the MW is an online interface to the NMDR developed at UCSD. It allows users to manage and upload studies as well as browse and search available studies. Using the MW interface, submitters upload data and results, including metadata, targeted data measurements, protocols/methods files, untargeted data measurements, and raw data (MS/NMR files, etc.). Other researchers can then use the MW website to browse, search, analyze, and download data as well as view summary figures of key study search parameters (e.g., bubble chart showing studies by sample source). For example, studies can be filtered by study metadata (disease, sample source, species, instrumentation) or metabolite information (metabolite classification, biochemical pathways, retention time, etc.) to identify data relevant to the user’s needs. Additionally, it provides analysis tools and access to metabolite standards, protocols, tutorials, training, and other resources to support metabolomic researchers.

**NMDR** – National Metabolomics Data Repository. Responsible for collating, analyzing, and distributing the data gathered by the RCMRCs and hosting the tools and methods created by the DTCs.

**RAS** – Researcher Auth Service. A service under development by the NIH's Center for Information Technology that will facilitate access to controlled data assets and repositories.

**RCMRC** – Regional Comprehensive Metabolomics Resource Cores. The Metabolomics Program consortium consists of six RCMRCs, also called the Compound Identification Cores (CIDCs), and seven Data and Tools Cores (DTCs) that are overseen by the Metabolomics Consortium Coordinating Center at the University of Florida.

**RefMet** – Reference list of Metabolite names. Developed by the Common Fund Metabolomics program. Effectively a large spreadsheet that provides a standard nomenclature for over 95,500 chemical species. From the Metabolomics Workbench website, it can be browsed and searched directly or a user can input a list of metabolite names and have them automatically converted to RefMet nomenclature. A user can also directly download the data, either in whole or after filtering as one would with a simple Excel sheet. Or the entire dataset can be downloaded as part of a Shiny R app and queried locally.

**SSO** – Single Sign-On.

**STRIDES** – NIH’s Science and Technology Research Infrastructure for Discovery, Experimentation, and Sustainability initiative. Common Fund leadership has partnered with the STRIDES initiative, which provides lower-cost cloud services to NIH projects.

**TCC** – Training Coordination Center. This center is staffed by experts in bioinformatics curriculum development, teaching, and community building. It provides support and resources for the development of DCC-specific training programs as well as end-user training on CFDE products and general topics of interest to the Common Fund research community. The TCC can help with logistical support for hosting workshops, as well as providing guidance on how to grow and build a sustainable training program. The TCC provides instructor training for the DCCs and assists with creating useful qualitative and quantitative feedback and assessment tools. In addition to site-specific training, the TCC offers training on CFDE products as they become available, and pilots a general bioinformatics workshop curriculum on topics of broad interest within the Common Fund.

**TOPMed** – Trans-Omics for Precision Medicine. 


# DRAFT - list of term anchors currently linked from spec documents

**CFDE-asset-manifest**

**DCCs**

**DCC-data-ingestion-process**

**Entity-relationship-model**

**Metadata**

**Richness-levels**
