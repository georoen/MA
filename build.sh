#readme="README.md"
#stardot="stardot/README.md"
#raspi="raspberry/README.md raspberry/system_settings.md raspberry/setup_configuration.md"
#setup1="1_setup/README.md"
#setup2="2_setup/README.md 2_setup/Solar.md"

echo Compiling...
echo README
pandoc -s --latex-engine=lualatex -o docs_Hardware.pdf README.md

echo Stardot
cd stardot
pandoc -s --latex-engine=lualatex -o docs_Hardware.pdf README.md

echo Raspberry
cd ../raspberry
pandoc -s --latex-engine=lualatex -o docs_Hardware.pdf README.md system_settings.md setup_configuration.md

echo 1 Setup
cd ../1_setup
pandoc -s --latex-engine=lualatex -o docs_Hardware.pdf README.md

echo 2 Setup
cd ../2_setup
pandoc -s --latex-engine=lualatex -o docs_Hardware.pdf README.md

echo Merging...
cd ../
pdfjoin -o docs_Hardware.pdf docs_Hardware.pdf stardot/docs_Hardware.pdf raspberry/docs_Hardware.pdf 1_setup/docs_Hardware.pdf 2_setup/docs_Hardware.pdf
# Two Page Layout
#pdfnup -o docs_Hardware.pdf docs_Hardware.pdf

echo Cleaning directory.
rm stardot/docs_Hardware.pdf raspberry/docs_Hardware.pdf 1_setup/docs_Hardware.pdf 2_setup/docs_Hardware.pdf
