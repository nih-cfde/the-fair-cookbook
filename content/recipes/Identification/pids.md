# Recommendations for minting persistent and resolvable identifiers

**Authors**: [Rick Wagner](https://orcid.org/0000-0003-1291-5876)
			 [Robert Carter](https://orcid.org/0000-0003-0937-8141)
			 [Philippe Rocca-Serra](https://orcid.org/0000-0001-9853-5668)

**Maintainers**: [Rick Wagner](https://orcid.org/0000-0003-1291-5876)

**Version**: initial draft

**License**: [CC0 1.0 Universal (CC0 1.0) Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/deed.en)

---

## Objectives

The main objective of this recipe is to provide a set guidelines and recommendations for producing or using resolvable identifiers. This is a key element as it provides `interoperability` and 'reusability', the I and R in FAIR.


## Introduction

 A `persistent identifier` is a **globally unique name for a resource within the CFDE**. This name can be used to retrieve a description of the resource or to identify an entity like a file or dataset without dereferencing the identifier (i.e., accessing the resource itself). Persistent identifiers are created and maintained by the DCC responsible for the data and must be defined using the characteristics described in this document to ensure their data is `Findable`, `Accessible`, `Interoperable`, and `Reusable` (FAIR) [1]. Because DCCs need to be able to define and choose different identifiers for additional use cases, this document provides a minimum set of requirements that are intended to be flexible and fit within the existing practices of data repositories, publishers, and libraries [2, 3]. 


As part of the Crosscut Metadata Model (C2M2), persistent identifiers can enable several use cases:

* Unambiguously referring to a resource 
* Estimating the amount of data stored by a DCC 
* Accessing descriptions of named resources 
* Verifying that a file is the one referenced by a persistent identifier 
* Determining if two identifiers refer to the same file or files 
* Citing data 

At present, the scope of these requirements is limited to two entities within the C2M2, files and collection (a grouping of files). These requirements may be extended to support other use cases, in particular data citation. Some of the information provided by the persistent identifier may be duplicated within the C2M2; over time, the C2M2 itself may be built in part from sets of persistent identifiers. 
The CFDE's Persistent Identifier Recommendations promotes the following recommendation towards improving the FAIRness of Common Fund sponsored data: 

* All data identifiers should be expressed as a URL 
* Identifier URLs should resolve to landing pages with human-readable metadata 
* Data metadata should be embedded in the landing page by using JSON-LD and Schema.org [4] 
* Metadata should be available via [content negotiation](https://developer.mozilla.org/en-US/docs/Web/HTTP/Content_negotiation) at the same URL 
* All data, even temporary or intermediate data, should be associated with an identifier 
* Different types of identifiers can be assigned to the same data 
* Identifiers must capture data checksums to enable verification of data integrity 
* Identifier creation and resolution must become part of the research data lifecycle and, where possible, be integrated with tools and applications that can automate this process 


### 1. Required Identifier Characteristics

All persistent identifiers used within the CFDE **must** meet the following requirements regarding their uniqueness, format, resolution, and description.

* **`Uniqueness`**: Persistent identifiers must unique within the CFDE and only refer to single file or collection. Multiple identifiers (of the same or different types) may refer to the same file or collection. Identifiers should provide a means (preferably checksums) to determine if multiple identifiers refer to the same resource. 

* **`Format`**:  Persistent identifiers must comply with the IETF standard for URIs, [RFC 3986](https://tools.ietf.org/html/rfc3986). This may be either be as an HTTPS URL or a compact URI. The use of HTTPS URLs is strongly preferred. 

Examples:

> **HTTPS URL:** https://doi.org/10.25490/a97f-egyk

> **Compact URI:** doi:10.25490/a97f-egyk 

* **`Resolution`**:  Persistent identifiers using compact URIs must use prefixes (also known as URI schemes) registered with [N2T](https://n2t.net) or [Identifiers.org](https://identifiers.org) [5]. This permits the resolution of compact URIs in a consistent manner and helps to ensure uniqueness of identifiers by defining identifier naming authorities. Instructions on how to register prefixes are on the N2T and Identifiers.org sites. The joint list of registered prefixes is available [here](http://n2t.net/e/cdl_ebi_prefixes.yaml). 


Examples: 

> **N2T:** https://n2t.net/doi:10.25490/a97f-egyk

> **Identifiers.org:** https://identifiers.org/doi:10.25490/a97f-egyk 


* **`Description`**: When an identifier is resolved, either as a HTTPS URL or from a compact URI to a URL, the minimum result must be an HTML landing page, with human-readable metadata describing the referenced object. 

### 2. Recommended Identifier Characteristics

Beyond these minimal requirements, there are several recommendations that contribute to the CFDE use cases and can improve the reuse and citation of the data referred to by persistent identifiers. Many of these recommendations are drawn from the [ref data citation roadmap](https://www.nature.com/articles/sdata2018259). They primarily focus on the descriptive metadata provided by the persistent identifier by its landing page, especially in a machine- readable format. 

* **`Machine Readability`**: In addition to the [HTML landing page](https://docs.nih-cfde.org/en/latest/CFDE-glossary/#landing-page), intended to be read by a person using a browser, the identifier and metadata associated with the resource should be embedded in the landing page in [JSON-LD](https://docs.nih-cfde.org/en/latest/CFDE-glossary/#json-ld). The metadata should also be retrievable as JSON-LD using the `Accept` header to allow clients to retrieve the metadata without unnecessarily parsing HTML. 

* **`Metadata Schema`**:  The CFDE use cases for **file** and **collection metadata** include validation, disambiguation, and metrics around storage utilization and locality. For example, Google vs. Amazon. Later, the use of the location attribute for the file identifiers with a list of URIs for data protocols may allow for data access. The recommended metadata for collections also includes the elements to allow for data citation, primarily to reduce the amount metadata required for individual files. 

DCCs may choose to use different identifiers for files and collections based on their own needs. For example, a DCC may choose to use DOIs for their collections and ARKs for their files. And because resources may be referenced by multiple persistent identifiers, some files may also be referenced by DOIs so that the files may be cited as a citable dataset [6]. 

#### **Specifics about identifiers for Files**

File identifier metadata should include the following:

- **`identifier`**: The persistent identifier. 
- **`filename`**: The name of the file without addition path information. 
- **`size`**: The size of the file in bytes. 
- **`checksum`**: The output of a cryptographic hash function run on the file, preferably SHA256, which can be used to verify data integrity and identify files regardless of a data repository’s naming conventions. 
- **`checksum_algorithm`**: The checksum algorithm used, one of md5, sha256, or sha512. 
- **`location`**: One or more locations using RFC 7595 schemes (e.g., HTTPS, SCP, FTP) or other agreed upon conventions (S3, GS) that map to access protocols. Collections Collection identifier metadata should include the following 
- **`identifier`**: The persistent identifier. 
- **`name`**: The human-readable name of the collection. 
- **`author`**: The person(s) publishing the collection. 
- **`publisher`**: The organization or entity publishing the collection. 
- **`datePublished`**: The date published. 
- **`version`**: Version of the collection. 
- **`type`**: Must be dataset. 
- **`filename`**: The name of a manifest file without addition path information. The manifest file should contain a list of the persistent identifiers for the individual files in the collection. 
- **`size`**: The size of the manifest file in bytes. 
- **`checksum`**: The output of a cryptographic hash function run on the manifest file, preferably SHA256, which can be used to verify data integrity and identify files regardless of a data repository’s naming conventions. 
- **`checksum_algorithm`**: The checksum algorithm used, one of md5, sha256, or sha512. 
- **`location`**: One or more locations using RFC 7595 schemes (e.g., HTTPS, SCP, FTP) or other agreed upon conventions (S3, GS) that map to access protocols. CFDE Resources The CFDE Coordinating Center is evaluating the operation a persistent identifier service for files and collections based on different identifier schemes including Handles, DOIs, and ARKs. DCCs interested in creating persistent identifiers for files and collections using this service may contact the CFDE CC for further details. 


## Conclusion

The section draws the attention to essential properties identifiers must have in order to deliver `interoperability`. These will be implemented for all key objects and some of their key qualifiers.

---

## References

- [1] Wilkinson MD, Dumontier M, Aalbersberg IjJ, Appleton G, Axton M, Baak A, Blomberg N, Boiten J-W, da Silva Santos LB, Bourne PE, Bouwman J, Brookes AJ, Clark T, Crosas M, Dillo I, Dumon O, Edmunds S, Evelo CT, Finkers R, Gonzalez-Beltran A, Gray AJG, Groth P, Goble C, Grethe JS, Heringa J, ’t Hoen PA., Hooft R, Kuhn T, Kok R, Kok J, Lusher SJ, Martone ME, Mons A, Packer AL, Persson B, Rocca-Serra P, Roos M, van Schaik R, Sansone S-A, Schultes E, Sengstag T, Slater T, Strawn G, Swertz MA, Thompson M, van der Lei J, van Mulligen E, Velterop J, Waagmeester A, Wittenburg P, Wolstencroft K, Zhao J, Mons B. The FAIR Guiding Principles for scientific data management and stewardship. Scientific Data [Internet]. Springer Science and Business Media LLC; 2016 Mar 15;3(1). Available from: http://dx.doi.org/10.1038/sdata.2016.18

- [2] Data Citation Synthesis Group. Joint Declaration of Data Citation Principles [Internet]. Force11; 2014. Available from: https://www.force11.org/group/joint-declaration-data-citation-principles-final 

- [3] Fenner M, Crosas M, Grethe JS, Kennedy D, Hermjakob H, Rocca-Serra P, Durand G, Berjon R, Karcher S, Martone M, Clark T. A data citation roadmap for scholarly data repositories. Scientific Data [Internet]. Springer Science and Business Media LLC; 2019 Apr 10;6(1). Available from: http://dx.doi.org/10.1038/s41597-019-0031-8 

- [4] Guha RV, Brickley D, Macbeth S. Schema.org. Communications of the ACM [Internet]. Association for Computing Machinery (ACM); 2016 Jan 25;59(2):44–51. Available from: http://dx.doi.org/10.1145/2844544 

- [5] Wimalaratne SM, Juty N, Kunze J, Janée G, McMurry JA, Beard N, Jimenez R, Grethe JS, Hermjakob H, Martone ME, Clark T. Uniform resolution of compact identifiers for biomedical data. Scientific Data [Internet]. Springer Science and Business Media LLC; 2018 May 8;5(1). Available from: http://dx.doi.org/10.1038/sdata.2018.29 

- [6] DataCite Metadata Working Group. DataCite Metadata Schema Documentation for the Publication and Citation of Research Data v4.3. DataCite [Internet]. DataCite; 2019; Available from: https://schema.datacite.org/meta/kernel-4.3/
