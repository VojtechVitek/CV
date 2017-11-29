all: CV_Vojtech_Vitek_EN.pdf

# Builds PDF from Latex file in Docker container
CV_Vojtech_Vitek_EN.pdf: CV_Vojtech_Vitek_EN.tex
	docker run -i -w /tmp -v "$(PWD)":/tmp leodido/texlive:latest pdflatex -file-line-error -halt-on-error -interaction=errorstopmode CV_Vojtech_Vitek_EN.tex <<< ""
