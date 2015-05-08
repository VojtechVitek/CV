all: CV_Vojtech_Vitek_EN.pdf

# Requires boot2docker
# Builds PDF from Latex file in Docker container
CV_Vojtech_Vitek_EN.pdf: CV_Vojtech_Vitek_EN.tex
	#rsync -av --progress ./ docker@192.168.59.103:/tmp/
	scp -r * docker@192.168.59.103:/tmp/
	ssh docker@192.168.59.103 docker run -it -a stdout -w /tmp -v /tmp:/tmp leodido/texlive:latest pdflatex -file-line-error -halt-on-error -interaction=errorstopmode CV_Vojtech_Vitek_EN.tex <<< ""
	scp docker@192.168.59.103:/tmp/CV_Vojtech_Vitek_EN.pdf ./
