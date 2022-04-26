# Experience from Kids First (KF)

**Authors**: Abhijna Parigi, Marisa Lim

**Maintainers**: Abhijna Parigi, Marisa Lim

**License**: [CC0 1.0 Universal (CC0 1.0) Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/deed.en)

## Objectives:
> This is a cookbook recipe documenting the process of inputting the Kids First data into the C2M2 model to produce `Level 1 tables`. 

> This conversion process is also known as the ETL, which stands for Extract, Transform, and Load.

## Step by Step Process:

### Step 1: Gather data from the Kids First (KF) portal

* Visit the KF portal website: [https://portal.kidsfirstdrc.org/dashboard](https://portal.kidsfirstdrc.org/dashboard)
* Log in using your `ORCID credenetials` (preffered), `gmail`, or `facebook` credentials.
* Select the `File Repository` tab on the main navigation bar at the top of the website.

<!-- Image  -->

* Download the Kids First Data by:
  - Clicking the columns options and select all columns. Then click `Export TSV`.
  - Click `File Manifest`.
  - Click `Download` and choose the option `Biospecimen Data` (3rd option of the dropdown menu)

### Step 2: Data pre-processing:

* Initial preprocessing: From Kids First datasets, remove all the columns that do NOT have any headers.
* Go to the [C2M2 documentation page](https://docs.nih-cfde.org/en/latest/c2m2/draft-C2M2_specification/#c2m2-technical-specification) and look for the diagram labeled "C2M2 model diagram". This diagram is important as it shows the "core tables", colored blue and black, needed to map the KF datasets to the C2M2 model. Tables 1-4 shown below are examples of mapping used for the "core ables" and table 5 is an examples used for the associate tables. The number of rows for each table coressponds to the number of unique `id` entries. 

*Note: id_namespace and project_id_namespace have repeating values of cfde_id_namespace:3.*

#### Table 1: file.tsv

source: exported TSV file

|C2M2 colnames | KF colnames|
|:--------------|:------------|
|id_namespace  | |
|id            |File ID|
|project_id_namespace| |
|project|Study ID|
|persistent_id| |
|creation_time| |
|size_in_bytes| File Size |
|sha256| |
|md5| |
|filename| File Name|
|file_format| File Format|
|data_type| Data Type|

#### Table 2: biosample.tsv

source of `Biospecimen ID`: exported TSV file
source of `Experiment Strategy`: `File Manifest`
source of `Composition`: `Biospecimen Data`

|C2M2 colnames | KF colnames|
|:--------------|:------------|
|id_namespace  | |
|id            | Biospecimen ID|
|project_if_namespace | |
|project | Study ID |
|persistent_id| |
|creation_time | |
|assay_type | Experiment Strategy|
|anatomy | Composition|

#### Table 3: subject.tsv

source: exported TSV file

|C2M2 colnames | KF colnames|
|:--------------|:------------|
|id_namespace  | |
|id            | Participants ID |
|project_if_namespace | |
|project | Study ID|
|persistent_id| | 
|creation_time | |
|granularity | . |

*Note: granularity has this repeating value: cfde_subject_granularity:0. persistent_id and creation_time were left empty.*

#### Table 4: project.tsv

source: exported TSV file

|C2M2 colnames | KF colnames|
|:--------------|:------------|
|id_namespace  | |
|id            | Study ID |
|persistent_id |  |
|creation_time |  |
|abbreviation  |  |
|name          | Study Name |

*Note: persistent_id, creation_time, and abbreviation were left empty.*

#### Table 5: subject_role_taxonomy.tsv

source: exported TSV file

| C2M2 colnames | KF colnames|
|:--------------|:------------|
|id_namespace | |
|id | Participants ID |
|role_id |  |
|taxonomy_id | . |

> :octocat:  warning:
> `role_id` has this repeating value: `cfde_id_namespace:3` 
> `taxonomy_id` has this repeating value: `NCBI:txid9606`

























