#
# Think
# Do they care about your objectives?
# Do they care about your schooling?
# Do they care about your hobby bullshit?
#

# Running `make` alone will run `all` target. By defautl, this performs:
#  - Cleaning out the old README.md
#  - Concatenating a new markdown version
#  - Creating a PDF version
#  - Copying the README.md to the `docs/` directory for use with GitHub Pages 
all: clean pdf publish
	echo "Markdown version created and copied to docs/ folder. PDF version created."


pdf: README.md
	pandoc -r markdown_github -o resume-`date +%Y-%m-%d`.pdf \
	README.md -V geometry:"top=1.5cm, bottom=1.5cm, left=1.5cm, right=1.5cm"

publish: README.md
	cp README.md docs/README.md

README.md: 
	cat \
	snippets/contact-header-personal.md \
	snippets/links.md \
	snippets/about-me.md \
	snippets/qualifications.md \
	objectives/general.md \
	snippets/employers-short.md \
	snippets/education.md \
	>> README.md

#	objectives/infosec.md \
# 	snippets/skills-by-experience-short.md \

# Old stuff:

# all: html pdf docx rtf

# pdf: resume.pdf
# resume.pdf: resume.md
# 	pandoc --standalone --template style_chmduquesne.tex \
# 	--from markdown --to context \
# 	-V papersize=A4 \
# 	-o resume.tex resume.md; \
# 	context resume.tex

# html: resume.html
# resume.html: style_chmduquesne.css resume.md
# 	pandoc --standalone -H style_chmduquesne.css \
#         --from markdown --to html \
#         -o resume.html resume.md

# docx: resume.docx
# resume.docx: resume.md
# 	pandoc -s -S resume.md -o resume.docx

# rtf: resume.rtf
# resume.rtf: resume.md
# 	pandoc -s -S resume.md -o resume.rtf

clean:
	rm -f README.md
	# rm resume*.pdf
	# rm resume.html
	# rm resume.tex
	# rm resume.tuc
	# rm resume.log
	# rm resume.docx
	# rm resume.rtf
