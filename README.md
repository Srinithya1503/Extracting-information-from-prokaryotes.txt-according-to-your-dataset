# Extracting-genomic-information-from-prokaryotes.txt-according-to-your-dataset
if you are in the situation like the below, you can use the strategy as follows:
input file: your input file should have only the assembly accession number of your genomic raw dataset.
parsing file/ reference file: Download the prokaryotes.txt file from (https://ftp.ncbi.nlm.nih.gov/genomes/GENOME_REPORTS/). 
script file: using shell script commands, you can extract the basic genomic information of your dataset.

NOTE:
certain species might have updated assembly accession number in prokaryotes.txt or in your raw dataset. You can append the information for these entries from NCBI genome website.
Make sure you do all the post file proccessing like appending the information of their taxonomy, taxid, strain name.
