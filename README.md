# RNA-seq-analysis

Reference paper: Differential gene and transcript expression analysis of RNA-seq experiments with TopHat and Cufflinks.

Human reference genome downloaded from: https://ccb.jhu.edu/software/tophat/igenomes.shtml



Step 1. Align the RNA-seq reads to genome
> tophat -G genes.gtf -o output_dictionary genome sample1_1.fq sample1_2.fq

Step 2. Assemble expressed genes and transcripts

(assemble transcripts for each sample):
> cufflinks -o output_dictionary sample1/accepted_hits.bam

(create a file called assemblies.txt that lists the assembly file for each sample. The file should contain the following lines:)
> ./sample1/transcripts.gtf
  ./sample2/transcripts.gtf
  ./sample3/transcripts.gtf
  .
  .
  .
  .
  
 (Run Cuffmerge on all your assemblies to create a single merged transcriptome annotation):
 > cuffmerge -g genes.gtf -s genome.fa assemblies.txt
 
 Step 3. Identify differentially expressed genes and transcripts
 > cuffdiff -o diff_out -b genome.fa -L sample1,sample2 -u merged_asm/merged.gtf ./sample1/accepted_hits.bam,./sample2/accepted_hits.bam ./sample3/accepted_hits.bam,./sample4/accepted_hits.bam
 




