# CFDE FAIR Cookbook

The [Common Fund Data Ecosystem (CFDE)](https://nih-cfde.org) aims to assist the [Common Fund (CF)](https://commonfund.nih.gov/) Data Coordination Centers (DCC) with the process of making the digital objects that the host and produce better adhere to the [Findable, Accessible, Interoperable, and Reusable (FAIR) principles](https://www.nature.com/articles/sdata201618).

This FAIR cookbook provides introductory materials about various aspects of FAIRness, including practical guides that show how to enhance digital objects by adhering them to community accepted standards. This includes, for example, documenting and implementing tools with the OpenAPI standards, structuring metadata in DATS format, providing schema.org specification on data and tool hosting websites, and converting datasets from DATS to frictionless for CFDE ingestion.

CFDE FAIR cookbook recipes are provided with executable code and example data to guide DCCs through the various ways FAIRness improvements can be achieved. The cookbook is open source and encourages contributions from the community to improve its quality and enrich its depth and coverage.  

The cookbook also describes how to perform FAIR assessment of the digital objects hosted by each DCC with FAIRshake. The vision is that FAIR scores will improve after the DCC will follow the recipes to improve the FAIRness of their resources and this will be reflected in improved FAIR evaluation. 

## Getting started

To get started, you may be interested in the following links.
Here are a few links of interest:

* **[Quickstart](features/features)** is a quick demo and overview of Jupyter Book.

* **[The Jupyter Book Guide](guide/01_overview)**
  will step you through the process of configuring and building your own Jupyter Book.

* **[The Jupyter Book template repo](https://github.com/jupyter/jupyter-book)** is the template
  repository you'll use as a start for your Jupyter Book.

* **A demo of the Jupyter Book** can be browsed via the sidebar to the left.

## Installation

Here's a brief rundown of how to create your own Jupyter Book using this site. For a more
complete guide, see [the Jupyter Book guide](guide/01_overview).

* Fork the Jupyter Book template repo
* Replace the demo notebooks in `content/` with your own notebooks and markdown files.
* Create a Table of Contents yaml file by editing `_data/toc.yaml`.
* Generate the Jekyll markdown for your notebooks by running `scripts/generate_book.py`
* Push your changes to GitHub (or wherever you host your site)!

## Acknowledgements

Jupyter Book was originally created by [Sam Lau][sam] and [Chris Holdgraf][chris]
with support of the **UC Berkeley Data Science Education Program and the Berkeley
Institute for Data Science**.

[sam]: http://www.samlau.me/
[chris]: https://predictablynoisy.com
