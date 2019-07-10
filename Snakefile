# Reference Genome
REFDIR = "/home/ubuntu/snakemake/saccharomyces_cerevisia/ref"
REF = "/home/ubuntu/snakemake/saccharomyces_cerevisia/ref/Saccharomyces_cerevisiae.R64-1-1.dna.toplevel.fa"
REFURL = "ftp://ftp.ensembl.org/pub/release-97/fasta/saccharomyces_cerevisiae/dna/Saccharomyces_cerevisiae.R64-1-1.dna_rm.toplevel.fa.gz"
SNPEFF_DB = "Saccharomyces_cerevisiae_yjm996"

# FASTQ
FASTQDIR = "/home/ubuntu/snakemake/saccharomyces_cerevisia/fastq"
EXPERIMENT="SRR7175545"
FASTQURL="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR717/005/"

include: "initialize/Snakefile"
include: "preprocess/Snakefile"
include: "callVariantsRealigned/Snakefile"
include: "callVariantsRecalibrated/Snakefile"
include: "bqsr/Snakefile"
include: "annotation/Snakefile"

rule all:
  input:  
    "output/initialized",
    "output/preprocessed",
    "output/realigned",
    "output/bqsr",
    "output/recaled",
    "output/annotated"

rule clean:
  shell: "cd output && rm -f *.pdf *.sam *.bai *.bam *.vcf *.idx *.txt *.list *.record"
