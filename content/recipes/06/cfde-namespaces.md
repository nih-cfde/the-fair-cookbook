---
pdf_options:
  format: Letter
---

# CFDE Resource Naming

Resources (files, subjects, biosamples, etc.) are uniquely
named in the context of the C2M2 using a namespace and an local name
(the id column of the entity tables). When
combined, the namespace and local name form a unique name for the
resource through the CFDE. In principle, this could be done using a
only a full URI for the resource. In practice, the use of namespaces
is a mechanism to allow DCCs to name their resources in a simple
manner without collision. The CFDE CC defines a process for DCCs to
define their own namespaces in a manner that avoids collions, without
requiring CFDE CC involvement. DCCs are welcome to engage the CFDE CC
with questions before investing significant effort in creating their ETL process.

## Namespaces

The namespace must be a valid URI (not necessarily resolvable) that is
under the control of the DCC or a trusted naming authority, and may
contain an intial path information. Examples of valid namespaces
 * `https://project-a.example.org`
 * `https://project-a.example.org/samples`
 * `tag:project-a.example.org,2020:`
 * `tag:project-a.example.org,2020:samples`

The namespace itself does not need (nor should) have any
semantic meaning on its own, though the namespaces table in the C2M2 may contain
descriptive text. Nor does the namespace define relationships between
resources, such as project membership or type. Files, biosamples,
subjects, and collections declare what project they are associated
with. The relationship between entities, such as a file produced from
a biosample, is defined separately from what project or namespace
those entities are associated with.

## Syntax

The local name of a resource is concatenated with the namespace using the `/`
character as a seperator to form the full resource name. To ensure
this, the namespace must be a valid URI, without a trailing `/`. Similarily,
th local name of a resource must be a valid path, but may not begin with a
`/`.

Given the local name `8675/REAMDE` and the previous namespace
examples, the full resouces names would be:
 * `https://project-a.example.org/8675/REAMDE`
 * `https://project-a.example.org/samples/8675/REAMDE`
 * `tag:project-a.example.org,2020:/8675/REAMDE`
 * `tag:project-a.example.org,2020:samples/8675/REAMDE`

## Namespace Selection

There are two recommended ways to choose a namespace, [tag URIs](https://en.wikipedia.org/wiki/Tag_URI_scheme)
or HTTPS and an FQDN. Tag URIs and HTTPS URLs using an FQDN allow DCCs
to define their own namespaces, while splitting a persitent identifier
permits enternal use of the full resource name.

Tag URIs have a simple syntax with the scheme "`tag:`", the entity
defining the URI, and the local name:
  `tag:<naming authority>:<local name>`
The `<naming authority>` may be an FQDN and a date that FQDN was managed
by the DCC. E.g., for Example.org's Project A, their namespace may be
  `tag:project-a.example.org,2020:`

HTTPS URLs are similar to XML namespace, where the DCC must have control of the FQDN,
but the URI does not need to be a resolvable URL. Example.org could
use this to declare a namespace for their samples from the Project A study.
  `https://project-a.example.org/samples`

## Declaration

Namespaces are declared in the `id_namespace` table

| Column Name |  Type |        Description |
|------------ | ----- | ------------------ |
| id |  URI | A globally unique ID representing this namespace. Used as a foreign key by entities. |
| name | slug | A short, human-readable, machine-read-friendly label for this namespace. | 
| description | string| A human-readable description of this namespace. |

Example

```
{
  "id":          "tag:project-a.example.org,2020:samples",
  "name":        "Samples from the Example.org Project A study",
  "description": "The sample identifiers sample were derived from the
                 Example.org Project A accession numbers."
}
```

The descriptive text (name and description) should related to the
namespce and the local names of the resources.
