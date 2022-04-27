# Experience from LINCS

A cookbook recipe documenting the easy extract & transform (ETL) process of fitting the LINCS data into the C2M2 model.

**Authors**: [Daniel J. B. Clarke](https://orcid.org/0000-0003-3471-7416)

**Maintainers**: [Daniel J. B. Clarke](https://orcid.org/0000-0003-3471-7416)

**Version**: 1.1

**License**: [CC0 1.0 Universal (CC0 1.0) Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/deed.en)


## Objectives
- Demonstrate an example of an ETL process for preparing data for the C2M2 Level 1
- Introduce tooling that can make this process easier
- Discuss necessary tradeoffs made to ensure maximal harmonization in the LINCS case


## Introduction

The [LINCS Data Portal](http://lincsportal.ccs.miami.edu/dcic-portal/) provides various ways to browse the existing LINCS data and highlight which small molecules, cell lines, genes, proteins, and antibodies are featured in a given dataset.

While LINCS revolves around *Datasets*, encompassing in some cases several files for each data level, the [C2M2](https://www.nih-cfde.org/product/cfde-c2m2/) models information revolving around files. Fortunately, the [C2M2 Level 1](https://www.nih-cfde.org/product/level-1-asset-manifest-specification/) provides collections, which enable arbitrary meaningful groupings of files, which is how the LINCS datasets can fit.


## Step by Step Process

### Step 1: Setting up your environment

<<<<<<< HEAD
The C2M2 is described using a [Frictionless datapackage specification](http://frictionlessdata.io/data-package/), which permits various additional tooling to be devised around it. In the case that your data is already accessible in a large table, it may, in some cases, be simpler to construct mysql views from your data that are oriented in a C2M2 compliant manner and can be validated with datapackages. Here however, we will demonstrate producing a C2M2-compliant datapackage directly from the LINCS REST API.
=======
The C2M2 Level 1 is described using a [Frictionless datapackage specification](http://frictionlessdata.io/data-package/), which permits various additional tooling to be devised around it. In the case that your data is already accessible in a large table, it may, in some cases, be simpler to construct mysql views from your data that are oriented in a C2M2 compliant manner and can be validated with datapackages. Here however, we will demonstrate producing a C2M2-compliant datapackage directly from the [LINCS REST API](https://maayanlab.cloud/sigcom-lincs/static/tutorial/ldp3/LDP3Tutorial.html).
>>>>>>> dev

A python helper class was devised to simplify codification of C2M2-compliant datapackages using [python3.7's dataclasses](https://docs.python.org/3/library/dataclasses.html) which provide convenient syntax highlighting and runtime assertions to catch errors early and easily introspect the C2M2 model with python docstrings. This package is available [here](https://github.com/nih-cfde/c2m2-frictionless-dataclass/tree/main/frictionless-dataclass) and is easily updated to future C2M2 schemas.

Given that you have access to the [FAIR repository](#fair-repo), this can be installed directly from GitHub with:

```bash
pip install "c2m2-frictionless @ git+https://github.com/nih-cfde/c2m2-frictionless-dataclass#egg=c2m2-frictionless&subdirectory=c2m2-frictionless"
```

This is also the time to install any relevant packages for interacting with your DCC's API, in our case we will use urllib to access the REST API.


### Step 2: Setup an ETL script

Here we will outline the skeleton of an ETL script which utilizes the `c2m2-frictionless` package. For more complete examples for LINCS and other DCCs using this package, see the [FAIR repository](#fair-repo).


extract_transform.py:
```python
#!/usr/bin/env python3

# Import C2M2 Frictionless Helper package
## dataclasses
import c2m2_frictionless
from c2m2_frictionless import C2M2

# TODO: Import other helper methods/setup DCC API

def extract_transform():
  ''' Generate c2m2 dataclasses to be added to the datapackage
  '''
  # Construct the core id_namespace separating this DCC's ids from the ids of
  #  all other DCCs
  ns = 'http://www.lincsproject.org/'
  # TODO: yield models

def extract_transform_validate(outdir):
  # use the extract_transform generator to produce a datapackage
  pkg = c2m2_frictionless.create_datapackage('C2M2', extract_transform(), outdir)
  # identify ontological terms in the datapackage, and complete the term tables
  c2m2_frictionless.build_term_tables(outdir)
  # validate assertion that the frictionless tableschema is complied with
  c2m2_frictionless.validate_datapackage(pkg)
  # validate assertion that (id_namespace, name) is unique in each resource
  c2m2_frictionless.validate_id_namespace_name_uniqueness(pkg)
  #
  return pkg

if __name__ == '__main__':
  import sys
  # grab an output directory off the command line
  extract_transform_validate(sys.argv[1] if len(sys.argv) >= 2 else '')

```

<<<<<<< HEAD
With the above skeleton in place, we can already run this script `python3 etl.py output` to produce and validate a C2M2 datapackage, though this package will only contain one element: the `id_namespace`. As described in the comments, this should be used to make sure that the ids within your DCC will not clash with the ids in another, for more about this please refer to the C2M2 [documentation](https://cfde-published-documentation.readthedocs-hosted.com/en/latest/spec-and-docs/C2M2-usage-guides-and-technical-documents/000-INTRODUCTION/).
=======
With the above skeleton in place, we can already run this script `python3 etl.py output` to produce and validate a C2M2 Level 1 datapackage, though this package will only contain one element: the `id_namespace`. As described in the comments, this should be used to make sure that the ids within your DCC will not clash with the ids in another, for more about this please refer to the [C2M2 documentation](https://cfde-published-documentation.readthedocs-hosted.com/en/latest/spec-and-docs/C2M2-usage-guides-and-technical-documents/000-INTRODUCTION/).
>>>>>>> dev

Now we are ready to expand the `extract_transform` function such that we walk through the DCC's pertinent dataset descriptions and yield C2M2 equivalent dataclasses.


### Step 3: Extracting and transforming your metadata for the C2M2

#### Step 3.1: Projects

We will first focus on grabbing the `project` structure. It is recommended that a primary project for which all other projects point to is used for your DCC for logical grouping in the UI. Please see the [C2M2 documentation](https://cfde-published-documentation.readthedocs-hosted.com/en/latest/spec-and-docs/C2M2-usage-guides-and-technical-documents/000-INTRODUCTION/) for a full description of what a "project" should represent, in short it is the groupings of datasets based essentially on funding awards.

```python
def lincs_fetchdata_iter():
  ''' This method paginates through the LINCS API yielding LINCS datasets
  '''
  # ...

# ...
def extract_transform():
  # ...
  # Projects refer to collections of items that were produced i.e. under the same award
  #  for a more complete definition of this and other C2M2 constructs,
  #  please refer to the C2M2 docs (https://www.nih-cfde.org/product/cfde-c2m2/)
  primary_project = C2M2.project(
    # The namespace from before, ensuring any ids we choose don't clash
    id_namespace=ns,
    local_id='lincs',
    # the persistent id here enables you to point to a specific id,
    #  ideally a resolvable one, that behaves as a landing page for the project
    persistent_id='http://www.lincsproject.org/',
    # this abbreviation may be used in the display of your project
    abbreviation='LINCS',
    # this is the full name of your project
    name='Library of Integrated Network-based Cellular Signatures',
    # this is the full description of your project
    description='The Library of Integrated Network-Based Cellular Signatures (LINCS) Program aims to create a network-based understanding of biology by cataloging changes in gene expression and other cellular processes that occur when cells are exposed to a variety of perturbing agents.',
  )
  yield primary_project
  # ...
  projects = {}
  # ...
  for dataset in lincs_fetchdata_iter():
    # LINCS datasets each refer to a `project`
    #  LINCS phase 1, 2, MCF10A, and more, these also fit as C2M2 project
    #
    # We will register the project if not done so already ensuring we
    #  don't end up with duplicates
    if dataset['projectname'] not in projects:
      project = C2M2.project(
        # we'll use the same namespace of our primary project
        id_namespace=primary_project.id_namespace,
        # we'll use the project name as the identifier with lack of a better
        #  solution
        local_id=dataset['projectname'],
        name=dataset['projectname'],
        # we've omitted the optional persistent_id here because we currently
        #  don't have landing pages for these project names and as such
        #  cannot produce a persistent id referring to them. Ideally however
        #  we would use those urls.
      )
      # we'll save the project for de-duplication purposes
      projects[dataset['projectname']] = project
      # we'll yield it so it gets included in our datapackage
      yield project
      # we'll also create a project_in_project associating our primary project
      #  to the project we just made
      yield C2M2.project_in_project(
        parent_project_id_namespace=primary_project.id_namespace,
        parent_project_local_id=primary_project.local_id,
        child_project_id_namespace=project.id_namespace,
        child_project_local_id=project.local_id,
      )
    else:
      # grab the already created project
      project = projects[dataset['projectname']]
    # ...
  # ...

```


#### Step 3.2: Collections & Files

With our project structure in place, we are now ready to walk through bringing the datasets and files into the package.

```python
# ...
def extract_transform():
  # ...
  for dataset in lincs_fetchdata_iter():
    # ...
    # grab creation time as iso 8601
    creation_time = dataset.get('datereleased')
    if creation_time is not None:
      creation_time = datetime.datetime.strptime(
        creation_time, '%Y-%m-%d'
      ).replace(
        tzinfo=datetime.timezone.utc
      ).isoformat()
    # each LINCS dataset group has multiple datasets,
    #  each LINCS dataset has multiple files.
    # We can model this with two collections referring to the independent
    #  sets of files
    #
    # LINCS Dataset Group
    collection = C2M2.collection(
      id_namespace=ns,
      local_id=dataset['datasetgroup'],
      persistent_id=f"http://lincsportal.ccs.miami.edu/datasets/view/{dataset['datasetgroup']}",
      name=dataset['datasetname'],
      description=dataset.get('description', ''),
      creation_time=creation_time,
    )
    yield collection
    # we can associate our collection with our project
    yield C2M2.collection_defined_by_project(
      collection_id_namespace=collection.id_namespace,
      collection_local_id=collection.local_id,
      project_id_namespace=project.id_namespace,
      project_local_id=project.local_id,
    )
    #
    # each dataset level (corresponding to a file) is specified in the metadata
    for dataset_id, dataset_version in zip(dataset.get('datasetlevels', []), dataset.get('latestversions', [])):
      file = C2M2.file(
        id_namespace=ns,
        # the LINCS dataset id is used as the id
        local_id=dataset_id,
        # The file is necessarily associated with the project
        project_id_namespace=project.id_namespace,
        project_local_id=project.local_id,
        # The landing page of the dataset is used as the persistent id
        persistent_id=f"http://lincsportal.ccs.miami.edu/datasets/view/{dataset_id}",
        # the creation time we converted to ISO8601 before
        creation_time=creation_time,
        # File filename, note that C2M2 doesn't currently have a distinction between
        #  download and landing page, we opted to put the download url in the filename.
        filename=f"http://lincsportal.ccs.miami.edu/dcic/api/download?path=LINCS_Data/{datum['centername']}&amp;file={dataset_id}_{dataset_version}.tar.gz",
        # Following are additional optional fields that we were unable
        #  to easily map with LINCS but should be filled in if possible.
        # size_in_bytes=0,
        # sha256='',
        # md5='',
        # file_format='', # EDAM format:
        # data_type='',   # EDAM data:
      )
      yield file
      # each file is in the collection
      yield C2M2.file_in_collection(
        file_id_namespace=file.id_namespace,
        file_local_id=file.local_id,
        collection_id_namespace=collection.id_namespace,
        collection_local_id=collection.local_id,
      )

```

With this, we have already satisfied a C2M2 Level 0 instance, but ideally we'll go a step further to C2M2 which has more annotations including information about Subjects and Biosamples, for more information refer to the [C2M2 Level documentation](https://cfde-published-documentation.readthedocs-hosted.com/en/latest/spec-and-docs/C2M2-usage-guides-and-technical-documents/000-INTRODUCTION/#c2m2-richness-levels).


#### Step 3.3: Subjects & Biosamples

The LINCS data associates Datasets with small molecules, cell lines, genes, proteins, antibodies, and other entities related to experimental conditions and readouts. A dataset consists of a series of experiments mostly carried out in high throughput with a goal of capturing changes in expression or other phenotypic changes that may be captured via images in various contexts under various conditions. For example, perturbed by small molecules in different cell lines.

Due to the sheer number of experiments performed in high throughput, LINCS stores the whole set of experiments in a few files representing the data level (level of processing performed on the raw data). It might be possible to extract these files and produce massive amounts of biosamples, but this information is not currently directly available on the website for the practical reason that having landing pages for each micro-experiment is not useful for the users of this data.

Because of this, LINCS lumps all the biosamples together into one "biosample" referring to the whole experiment. This allows annotating that biosample with the assay used to perform the experiment and associate that biosample with the subjects of the experiment that were studied. Subjects includes cell line, small molecules, and etc. This closely matches how the LINCS portal serves this data and fits in the C2M2.

```python
#
def lincs_fetchstats(datasetid, fields):
  # ...
#
# This dictionary describes how to get metadata for a given "stattype" (subject)
statstypes = {
  'cellline': type('StatType', tuple(), dict(
    # this describes the "type of subject" and is defined in the model
    id='cfde_subject_granularity:4',
    include=True,
    name='cell line',
    description='A cell line derived from one or more species or strains',
    # this is the landing page for this subject
    download_url=lambda datasetid: f"http://lincsportal.ccs.miami.edu/dcic/api/Results?searchTerm=%22{datasetid}%22&category=cellline",
    # this is the id we should use for this subject
    id_from_meta=lambda meta: meta.get('CL_LINCS_ID'),
  )),
  # ...
}
# ...
def extract_transform():
  # ...
  # Each "stattype" corresponds to a "subject granularity" in the C2M2, we'll
  #  register those subject granularities now
  subject_granularities = {}
  # Add all subject granularities from `stattypes`
  for stat_key, stat in statstypes.items():
    subject_granularities[stat_key] = stat.id
  # ...
  subjects = {}
  # ...
  for dataset in lincs_fetchdata_iter():
    # ...
    # we'll associate a single biosample for the purpose of listing assay
    biosample_id = collection.local_id
    # NOTE: We defer biosample creation till after we have the anatomy
    # the biosample is in the collection
    #
    # a dataset_group has a number of aspects that are associated with it
    # including small molecules, proteins, cell lines, etc.. these are the subjects of the
    # experiment. We will create all of these and associate them with our single 'super' biosample
    dataset_group_subjects = {}
    all_stats = lincs_fetchstats(datum['datasetid'], frozenset(datum.get('statsfields', [])))
    for stat_name, stats in all_stats.items():
      for stat in stats:
        subject = None
        subject_id = statstypes[stat_name].id_from_meta(stat)
        if subject_id:
          if stat_name not in subjects:
            subjects[stat_name] = {}
          if subject_id not in subjects[stat_name]:
            subject = C2M2.subject(
              id_namespace=ns,
              # in an effort to ensure id uniqueness, we'll use the stat_name as a prefix
              local_id=f"{stat_name}:{subject_id}",
              # our subject must be a part of the project, but because these subjects
              #   are re-used across all projects, we'll associate them with
              #   the primary project instead of just the project
              project_id_namespace=primary_project.id_namespace,
              project_local_id=primary_project.local_id,
              # here we associate this subject with the subject granularity
              granularity=subject_granularities[stat_name],
            )
            yield subject
            subjects[stat_name][subject_id] = subject
          else:
            subject = subjects[stat_name][subject_id]
          #
        # if we were able to get a subject out of this we'll add it as an
        #  association to the biosample
        if subject and subject.local_id not in dataset_group_subjects:
          dataset_group_subjects[subject.local_id] = subject
          # the biosample was derived from this subject
          yield C2M2.biosample_from_subject(
            biosample_id_namespace=ns,
            biosample_local_id=biosample_id,
            subject_id_namespace=subject.id_namespace,
            subject_local_id=subject.local_id,
          )
          # the subject is in the collection (lincs dataset group)
          yield C2M2.subject_in_collection(
            subject_id_namespace=subject.id_namespace,
            subject_local_id=subject.local_id,
            collection_id_namespace=collection.id_namespace,
            collection_local_id=collection.local_id,
          )
    #
    biosample = C2M2.biosample(
      id_namespace=ns,
      local_id=biosample_id,
      project_id_namespace=project.id_namespace,
      project_local_id=project.local_id,
      # TODO: ontological mappings
      # assay_type='',
      # anatomy=''
    )
    yield biosample
    yield C2M2.biosample_in_collection(
      biosample_id_namespace=biosample.id_namespace,
      biosample_local_id=biosample_id,
      collection_id_namespace=collection.id_namespace,
      collection_local_id=collection.local_id,
    )
    # ...
    for dataset_id, dataset_version in zip(datum.get('datasetlevels', []), datum.get('latestversions', [])):
      # ...
      # each file describes the biosample
      yield C2M2.file_describes_biosample(
        file_id_namespace=file.id_namespace,
        file_local_id=file.local_id,
        biosample_id_namespace=biosample.id_namespace,
        biosample_local_id=biosample.local_id,
      )
      # each file also describes all of the subjects in the study
      for subject in dataset_group_subjects.values():
        yield C2M2.file_describes_subject(
          file_id_namespace=file.id_namespace,
          file_local_id=file.local_id,
          subject_id_namespace=subject.id_namespace,
          subject_local_id=subject.local_id,
        )
    # ...
```


#### Step 3.4: Ontology mapping

Without subjects and biosamples in place, we can now add ontological terms which will be a point of harmonization between the different DCCs. For some, this will be simple, especially if the CFDE is prescribing an ontology that is already being used. For others, this may be a more complicated mapping effort. In LINCS, assays were described in a much more specific manner than the ontology for Biomedical Investigations (OBI). OBI is the currently prescribed ontology for assays in the C2M2--as such we need to collapse many of the assay descriptions into broader terms.

On the other hand, the organs were specified on the cell line in raw text, so these were mapped to the UBERON ontology.

```python
# ...
lincs_assay_obi_lookup = {
  'Aggregated small molecule biochemical target activity': 'OBI:0000070',
  'ATAC-seq': 'OBI:0002020',
  'Bead-based immunoassay': 'OBI:0001632',
  'ELISA': 'OBI:0001632',
  'Fluorescence imaging': 'OBI:0001501',
  'KiNativ': 'OBI:0001146',
  'KINOMEscan': 'OBI:0001146',
  'L1000': 'OBI:0000424',
  'LC-MS': 'OBI:0000470',
  'Mass spectrometry': 'OBI:0000470',
  'MEMA (fluorescence imaging)': 'OBI:0001501',
  'Microwestern': 'OBI:0000615',
  'P100 (mass spectrometry)': 'OBI:0000615',
  'PCR': 'OBI:0001146',
  'RNA-seq': 'OBI:0001271',
  'RPPA': 'OBI:0000615',
  'SWATH-MS': 'OBI:0000615',
  'Tandem Mass Tag (TMT) Mass Spectrometry': 'OBI:0000470',
  'To Be Classified': '',
}

lincs_anatomy_lookup = {
  'Ovary': 'UBERON:0000992',
  'cervix': 'UBERON:0000002',
  'kidney': 'UBERON:0002113',
  'vulva': 'UBERON:0000997',
  'gall bladder': 'UBERON:0002110',
  'urinary bladder': 'UBERON:0001255',
  'nervous system': 'UBERON:0001016',
  'Lung': 'UBERON:0002048',
  'skin': 'UBERON:0002097',
  'Intestine': 'UBERON:0000160',
  'Peripheral blood': 'UBERON:0000178', # WARNING: not 'peripheral'
  'miscellaneous': '',
  'adrenal gland': 'UBERON:0002369',
  'lung': 'UBERON:0002048',
  'thyroid': 'UBERON:0002046',
  'urinary tract': 'UBERON:0011143, UBERON:0001556',
  'uterus': 'UBERON:0000995',
  'pancreas': 'UBERON:0001264',
  'lymphatic system': 'UBERON:0006558',
  'muscle': 'UBERON:0001630',
  'biliary tract': '',
  'blood': 'UBERON:0000178',
  'stomach': 'UBERON:0000945',
  'intestine': 'UBERON:0000160',
  'head and neck': 'UBERON:0000974', #'UBERON:0000974, UBERON:0000974',
  'human': '',
  'Brain': 'UBERON:0000955',
  'testes': 'UBERON:0000473',
  'bone': 'UBERON:0002481',
  'large intestine': 'UBERON:0000059',
  'endometrium': 'UBERON:0001295',
  'ureter': 'UBERON:0000056',
  'pleura': 'UBERON:0000977',
  'Skin': 'UBERON:0002097',
  'breast': 'UBERON:0000310',
  'liver': 'UBERON:0002107',
  'Mammary gland': 'UBERON:0001911',
  'ovary': 'UBERON:0000992',
  'prostate': 'UBERON:0002367',
  'esophagus': 'UBERON:0001043',
  'brain': 'UBERON:0000955',
}

lincs_organism_lookup = {
  'Homo sapiens': type('NCBI:taxid9606', tuple(), dict(
    id='NCBI:taxid9606',
    clade='species',
    name='Homo sapiens',
  )),
  'Homo Sapiens': type('NCBI:taxid9606', tuple(), dict(
    id='NCBI:taxid9606',
    clade='species',
    name='Homo sapiens',
  )),
  'Homo Sapien': type('NCBI:taxid9606', tuple(), dict(
    id='NCBI:taxid9606',
    clade='species',
    name='Homo sapiens',
  )),
}
# ...
def first_or_none(it):
  ''' A simple helper for safely returning the first element of a potentially empty iterator
  '''
  try:
    return next(iter(it))
  except StopIteration:
    return None
# ...
def extract_transform():
  # ...
  taxonomies = {}
  # https://github.com/nih-cfde/specifications-and-documentation/blob/master/draft-C2M2_internal_CFDE_CV_tables/subject_granularity.tsv#L2
  cfde_subject_role_organism = C2M2.subject_role(
    id='cfde_subject_role:0',
    name='single organism',
    description="The organism represented by a subject in the 'single organism' granularity category",
  )
  yield cfde_subject_role_organism
  # ...
  for dataset in lincs_fetchdata_iter():
    # ...
    anatomies = set()
    #
    for stat_name, stats in all_stats.items():
      # ...
      if subject:
        # ...
        # In order to capture anatomy at the biosample level, we need to catch
        #  the anatomy on the subject
        if stat_name == 'cellline':
          # in the case of cell lines, we'd have a taxonomy
          lincs_taxon = lincs_organism_lookup.get(stats.get('organism'))
          if lincs_taxon and lincs_taxon.id not in taxonomies:
            taxon = C2M2.ncbi_taxonomy(
              id=lincs_taxon.id,
              clade=lincs_taxon.clade,
              name=lincs_taxon.name,
            )
            taxonomies[lincs_taxon.id] = taxon
            yield taxon
          elif lincs_taxon:
            taxon = taxonomies[lincs_taxon.id]
          else:
            taxon = None
          #
          if taxon:
            # associate the subject with the taxon
            yield C2M2.subject_role_taxonomy(
              subject_id_namespace=subject.id_namespace,
              subject_id=subject.id,
              role_id=subject_role_organism.id,
              taxonomy_id=taxon.id,
            )
          # in the case of cell lines, we'd have an anatomy
          if subject_id in lincs_anatomy_lookup:
            anatomies.add(lincs_cellline_anatomy(lincs_anatomy_lookup[subject_id]))
          else:
            print(f"WARNING: {subject_id} not in celllines")
    # ...
    biosample = C2M2.biosample(
      id_namespace=ns,
      local_id=biosample_id,
      project_id_namespace=project.id_namespace,
      project=project.id,
      # Lookup assay name to get OBI
      assay_type=lincs_assay_obi_lookup.get(dataset.get('assayname'), ''),
      # NOTE: we have several anatomies at this point and are forced to choose one
      # this will require improvements to either the model or to our conversion
      # perhaps we could instead have several biosamples for each file corresponding
      # to each subject. This will be left for future directions
      anatomy=first_or_none(anatomies),
    )
```

Here we show how we were able to capture an anatomy, taxonomies on cell lines, and assays on biosamples. While not complete nor perfect, this provides the much needed interoperation layer with the other DCCs. With this type of annotation, we can look at files across different DCCs by assay, anatomy, or subjects by taxonomy. It improves the findability of these files even if the model does not perfectly capture the real structure of the original page. The CFDE is meant to catalog and provide federated search to all of the DCCs, directing users to the DCC's pages, not to replace the catalogs already in place.


### Step 4: Running and validating our extraction and transformation

Our script is now ready to be run, tested, and refactored. During this phase it is ideal to cache network requests if hitting API endpoints. Every run of the script will re-construct the entire data package and run through the various checks, reporting any errors that occur.

```bash
python3 extract_transform.py output
```


### Step 5: Pushing our validated C2M2 datapackage

A client for facilitating the ingestion of your data into the CFDE portal exists [here](https://github.com/fair-research/deriva-flow-client/tree/client-dev). Once installed, the output directory we produced with the `etl.py` script can be sent to DERIVA, a discovery engine.

```bash
# install the DERIVA loader script
pip install "git+https://github.com/fair-research/deriva-flow-client.git@client-dev"

# output here is the directory with the output of the etl.py script
cfde run output

# check the status of the ingestion
cfde status
```

This tool facilitates authentication, manual preview verification when loaded on the server side (you will get an email), followed by CFDE verification and ultimate incorporation of your data into the unified portal.


## Conclusion

Taking advantage of this tooling will simplify the process of ETL script development given that most things will be caught with dataclass assertions and datapackage validation. Nonetheless, this enforces minimal compliance with the C2M2 standard. For maximal compliance, it is essential that you review the most up to date [C2M2 documentation](https://cfde-published-documentation.readthedocs-hosted.com/en/latest/spec-and-docs/C2M2-usage-guides-and-technical-documents/000-INTRODUCTION/) and it may also be useful to review and perform [FAIR assessments](https://nih-cfde.github.io/the-fair-cookbook/recipes/Compliance/fairshake.html) which include more elaborate assertions for compliance with FAIRness beyond the C2M2.

## Reference

### <a name="fair-repo"></a><a name="fair-repo-report"></a><a name="fair-repo-assessments"></a>FAIR Repo

The CFDE FAIR repository is currently private given that it contains details about DCCs that have not yet been verified.
Please submit a request to <https://www.nih-cfde.org/contact/> if you need access to the repository.

If you have access to the repository, you can access it [here](https://github.com/nih-cfde/FAIR). It contains C2M2 conversion scripts much like the one described here for several DCC's publicly facing metadata, organized into directories with each DCC name.
