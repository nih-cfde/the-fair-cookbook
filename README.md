# The FAIR Cookbook

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

## Modifying things

- `content/**/*`: The actual pages rendered as HTML but can be written in `*.md` or `*.ipynb`
- `_toc.yml`: Configure the relative level of content as seen in the sidebar
