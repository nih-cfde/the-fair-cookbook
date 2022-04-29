# The FAIR Cookbook

<https://fairshake.cloud/the-fair-cookbook/>  
<https://docs.nih-cfde.org/en/latest/the-fair-cookbook/intro/>  
<https://nih-cfde.github.io/the-fair-cookbook/>

## Running Locally

```bash
# Install necessary dependencies
pip install -r requirements.txt
# Book output goes to _build/html
jupyter-book build .
```

## Publishing to gh-pages
```bash
ghp-import -n -p -f _build/html
```

## Deploying with docker
```bash
TAG=cookbook
jupyter-book build .
docker build -t $TAG .
docker run -p 80:80 -it $TAG
```

## Build a pdf
```bash
jupyter-book build . --builder pdflatex
```

## Modifying things

- `content/**/*`: The actual pages rendered as HTML but can be written in `*.md` or `*.ipynb`
- `_toc.yml`: Configure the relative level of content as seen in the sidebar
