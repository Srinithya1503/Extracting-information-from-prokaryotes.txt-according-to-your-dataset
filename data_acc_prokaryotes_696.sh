#!/bin/bash

# Set the input and output file names
input_file="input_accessions_dataset_for_prokaryotes.txt"
prokaryote_file="prokaryotes.txt"
output_file="data_acc_prokaryotes_696.tsv"

# Initialize an empty array to hold accessions numbers
declare -a accessions

# Read the accession numbers into the array, excluding the header
while IFS= read -r line; do
    # Skip the header
    if [[ "$line" != \#* ]]; then
        # Trim whitespace and add to the array
        accessions+=("$(echo "$line" | xargs)")
    fi
done < "$input_file"

# Prepare the output file with headers
echo -e "Organism/Name\tTaxID\tBioProject Accession\tSize (Mb)\tGC%\tReplicons\tGenes\tProteins\tRelease Date\tCenter\tAssembly Accession\tFTP_path\tPubMedID" > "$output_file"

# Loop through each organism name in the array and search in the prokaryote file
for accession in "${accessions[@]}"; do
  #Use grep to find the exact match for the accession number and extract the relevant columns 
   grep -F "$accession" "$prokaryote_file" | awk -F'\t' -v acc="$accession" '
    $19 == acc { print $1"\t"$2"\t"$3"\t"$7"\t"$8"\t"$9"\t"$11"\t"$12"\t"$13"\t"$16"\t"$19"\t"$21"\t"$22 }' >> "$output_file" 
done
   
   
