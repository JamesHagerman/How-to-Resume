# Build directions

1. Modify Markdown snippets
2. Modify `Makefile` to pick and order snippets
3. Commit and push changes to git repo. GitHub Actions Workflow will generate a formated PDF
OR
4. Locally, run `make` to combine snippets into a single Markdown file and generate a formatted PDF


## Build details

Running `make` will pull together the snippets and objectives and stitch together a resume Markdown file. It will then pass it through Pandoc to build a PDF.

Modify `Makefile`, `snippets/*`, or `objectives/*` to change the content included in the generated resume.

### Installing and using Pandoc:

Use the following to install pandoc (Linux):

`sudo apt-get install pandoc texlive`

Then use the following `pandoc` commandline to build a pdf:

`pandoc -r markdown_github -o resume-non-github.pdf README.md -V geometry:"top=2cm, bottom=1.5cm, left=1cm, right=1cm"`

