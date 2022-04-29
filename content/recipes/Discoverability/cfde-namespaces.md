# Conceptual Description of the Level 2 C2M2

**Authors**: [Rick Wagner](https://orcid.org/0000-0003-1291-5876)

**Maintainers**: [Rick Wagner](https://orcid.org/0000-0003-1291-5876)

**Version**: 0.1

**License**: [CC0 1.0 Universal (CC0 1.0) Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/deed.en)

---

## Objectives

Resources (files, subjects, biosamples, etc.) are uniquely
named in the context of the C2M2 using a namespace and an local name
(the id column of the entity tables). When
combined, the namespace and local name form a unique name for the
resource through the CFDE. In principle, this could be done using 
only a full URI for the resource. In practice, the use of namespaces
is a mechanism to allow DCCs to name their resources in a simple
manner without collision. The Common Fund Data Ecosystem Coordinating Center (CFDE CC) defines a process for DCCs to
define their own namespaces in a manner that avoids collions, without
requiring CFDE CC involvement. DCCs are welcome to engage the CFDE CC
with questions before investing significant effort in creating their [ETL](https://docs.nih-cfde.org/en/latest/CFDE-glossary/#extract-transform-load-process-etl) process.

## Namespaces

The namespace must be a valid URI (not necessarily resolvable) that is
under the control of the DCC or a trusted naming authority, and may
contain an intial path information. Examples of valid namespaces
 * `https://project-a.example.org/`
 * `https://project-a.example.org/samples/`
 * `tag:project-a.example.org,2020:/`
 * `tag:project-a.example.org,2020:samples#`

The namespace itself does not need (nor should) have any
semantic meaning on its own, though the namespaces table in the C2M2 may contain
descriptive text. Nor does the namespace define relationships between
resources, such as project membership or type. Files, biosamples,
subjects, and collections declare what project they are associated
with. The relationship between entities, such as a file produced from
a biosample, is defined separately from what project or namespace
those entities are associated with.

## Syntax

The local name of a resource is concatenated with the namespace to form the full resource name. To ensure
this, the namespace must be a valid URI and may include a trailing separation character, such as `?` or `#`. The local name of a resource may have any syntax, so long as when concatenate with the namespace the full names is also a valid URI.

Given the local name `8675/REAMDE` and the previous namespace
examples, the full resouces names would be:
 * `https://project-a.example.org/8675/REAMDE`
 * `https://project-a.example.org/samples/8675/REAMDE`
 * `tag:project-a.example.org,2020:/8675/REAMDE`
 * `tag:project-a.example.org,2020:samples#8675/REAMDE`
 
## Validation

There are tools for validating and introspecting URIs, like the [Python rfc3986 package](https://pypi.org/project/rfc3986/). Using our examples above, we can valid the namespaces, the full names, and look at the breakdown of the elements.

```python
import rfc3986

# https://project-a.example.org/
rfc3986.is_valid_uri('https://project-a.example.org/')
True
rfc3986.uri_reference('https://project-a.example.org/')
URIReference(scheme='https', authority='project-a.example.org', path='/', query=None, fragment=None)

# https://project-a.example.org/samples/
rfc3986.is_valid_uri('https://project-a.example.org/samples/')
True
rfc3986.uri_reference('https://project-a.example.org/samples/')
URIReference(scheme='https', authority='project-a.example.org', path='/samples/', query=None, fragment=None)

# tag:project-a.example.org,2020:/
rfc3986.is_valid_uri('tag:project-a.example.org,2020:/')
True
rfc3986.uri_reference('tag:project-a.example.org,2020:/')
URIReference(scheme='tag', authority=None, path='project-a.example.org,2020:/', query=None, fragment=None)

# tag:project-a.example.org,2020:samples#
rfc3986.is_valid_uri('tag:project-a.example.org,2020:samples#')
True
rfc3986.uri_reference('tag:project-a.example.org,2020:samples#')
URIReference(scheme='tag', authority=None, path='project-a.example.org,2020:samples', query=None, fragment='')

# https://project-a.example.org/8675/REAMDE
rfc3986.is_valid_uri('https://project-a.example.org/8675/REAMDE')
True
rfc3986.uri_reference('https://project-a.example.org/8675/REAMDE')
URIReference(scheme='https', authority='project-a.example.org', path='/8675/REAMDE', query=None, fragment=None)

# https://project-a.example.org/samples/8675/REAMDE
rfc3986.is_valid_uri('https://project-a.example.org/samples/8675/REAMDE')
True
rfc3986.uri_reference('https://project-a.example.org/samples/8675/REAMDE')
URIReference(scheme='https', authority='project-a.example.org', path='/samples/8675/REAMDE', query=None, fragment=None)

# tag:project-a.example.org,2020:/8675/REAMDE
rfc3986.is_valid_uri('tag:project-a.example.org,2020:/8675/REAMDE')
True
rfc3986.uri_reference('tag:project-a.example.org,2020:/8675/REAMDE')
URIReference(scheme='tag', authority=None, path='project-a.example.org,2020:/8675/REAMDE', query=None, fragment=None)

# tag:project-a.example.org,2020:samples#8675/REAMDE
rfc3986.is_valid_uri('tag:project-a.example.org,2020:samples#8675/REAMDE')
True
rfc3986.uri_reference('tag:project-a.example.org,2020:samples#8675/REAMDE')
URIReference(scheme='tag', authority=None, path='project-a.example.org,2020:samples', query=None, fragment='8675/REAMDE')
```

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

---
 
## Conclusions

This section provides a concise overview of the mechanism to declaring a `namespace` associated with a DCC in the context of the CFDE project. It is an important `harmonization` process, which aims to avoid collisions between identifiers, while enhancing `interoperability` and `findability`. It also represents a key process in mapping data into the C2M2 model, thereby getting ready for a full ETL process from a DCC to the CFDE model and future indexing in the CDFE Deriva system.

> ##  What to read next?
> * [CFDE selected terminologies](../Semantics/cfde-terminologies.md)


