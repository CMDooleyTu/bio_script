#get gtf and create .bed file of all "genes"

# ~~~~~ ENSEMBL GRCz11 chr ~~~~~ #

Danio_rerio.GRCz11.100.chr.gtf.gz:
	wget ftp://ftp.ensembl.org/pub/release-100/gtf/danio_rerio/Danio_rerio.GRCz11.100.chr.gtf.gz

# remove comment lines
# extract only 'gene' entries
# add 'chr' to first entry, change 'chrMT' to 'chrM'
Danio_rerio.GRCz11.100.chr.gtf: Danio_rerio.GRCz11.100.chr.gtf.gz
	zcat Danio_rerio.GRCz11.100.chr.gtf.gz | grep -Ev '^#' | grep -w 'gene' | sed -e 's/^/chr/' -e 's/^chrMT/chrM/' > Danio_rerio.GRCz11.100.chr.gtf

# convert to .bed
#awk command to deal with otherwise first line error with transcript_id
Danio_rerio.GRCz11.100.chr.bed: Danio_rerio.GRCz11.100.chr.gtf
	#gtf2bed < Danio_rerio.GRCz11.100.chr.gtf > Danio_rerio.GRCz11.100.chr.bed
	awk '{ if ($0 ~ "transcript_id") print $0; else print $0" transcript_id \"\";"; }' Danio_rerio.GRCz11.100.chr.gtf | gtf2bed - > Danio_rerio.GRCz11.100.chr.bed

# ~~~~~ ENSEMBL GRCz11  ~~~~~ #
# generate the Ensembl hg19 annotations .bed file
Danio_rerio.GRCz11.100.gtf.gz:
	wget ftp://ftp.ensembl.org/pub/release-100/gtf/danio_rerio/Danio_rerio.GRCz11.100.gtf.gz

# remove comment lines
# extract only 'gene' entries
# add 'chr' to first entry, change 'chrMT' to 'chrM'
Danio_rerio.GRCz11.100.chr.gtf: Danio_rerio.GRCz11.100.chr.gtf.gz
	zcat Danio_rerio.GRCz11.100.gtf.gz | grep -Ev '^#' | grep -w 'gene' | sed -e 's/^/chr/' -e 's/^chrMT/chrM/' > Danio_rerio.GRCz11.100.gtf

# convert to .bed
#awk command to deal with otherwise first line error with transcript_id
Danio_rerio.GRCz11.100.chr.bed: Danio_rerio.GRCz11.100.chr.gtf
	awk '{ if ($0 ~ "transcript_id") print $0; else print $0" transcript_id \"\";"; }' Danio_rerio.GRCz11.100.gtf | gtf2bed - > Danio_rerio.GRCz11.100.bed


#error in formatting gtf file for bed conversion 
#potential awk workaround

awk '{ if ($0 ~ "transcript_id") print $0; else print $0" transcript_id \"\";"; }' input.gtf | gtf2bed - > output.bed

Danio_rerio.GRCz11.100.chr.bed: Danio_rerio.GRCz11.100.chr.gtf
	gtf2bed < Danio_rerio.GRCz11.100.chr.gtf > Danio_rerio.GRCz11.100.chr.bed


awk '{ if ($0 ~ "transcript_id") print $0; else print $0" transcript_id \"\";"; }' Danio_rerio.GRCz11.100.chr.gtf | gtf2bed - > Danio_rerio.GRCz11.100.chr.bed


Danio_rerio.GRCz11.100.chr.bed: Danio_rerio.GRCz11.100.chr.gtf
	awk '{ if ($0 ~ "transcript_id") print $0; else print $0" transcript_id \"\";"; }' Danio_rerio.GRCz11.100.chr.gtf | gtf2bed - > Danio_rerio.GRCz11.100.chr.bed





# ~~~~~ ENSEMBL GRCz11  ~~~~~ #
# generate the Ensembl hg19 annotations .bed file
Danio_rerio.GRCz11.100.gtf.gz:
	wget ftp://ftp.ensembl.org/pub/release-100/gtf/danio_rerio/Danio_rerio.GRCz11.100.gtf.gz

# remove comment lines
# extract only 'gene' entries
# add 'chr' to first entry, change 'chrMT' to 'chrM'
Danio_rerio.GRCz11.100.chr.gtf: Danio_rerio.GRCz11.100.chr.gtf.gz
	zcat Danio_rerio.GRCz11.100.gtf.gz | grep -Ev '^#' | grep -w 'gene' | sed -e 's/^/chr/' -e 's/^chrMT/chrM/' > Danio_rerio.GRCz11.100.gtf

# convert to .bed
Danio_rerio.GRCz11.100.chr.bed: Danio_rerio.GRCz11.100.chr.gtf
	gtf2bed < Danio_rerio.GRCz11.100.gtf > Danio_rerio.GRCz11.100.bed


awk '{ if ($0 ~ "transcript_id") print $0; else print $0" transcript_id \"\";"; }' Danio_rerio.GRCz11.100.gtf | gtf2bed - > Danio_rerio.GRCz11.100.bed