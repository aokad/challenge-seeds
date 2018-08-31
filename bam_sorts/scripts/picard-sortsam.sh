#!/bin/bash

set -eux

java -jar picard.jar SortSam \
R=${REFERENCE}/GRCh37.fa \
I=${INPUT_SAM} \
O=${OUTPUT_DIR}/${OUTPUT_NAME}

<< COMMENTOUT

--input-recursive REFERENCE	s3://genomon-bucket/_GRCh37/reference/GRCh37
--input INPUT_SAM	s3://aokad-ana-bucket/challenge/bamsort-20180831/bam/5929_tumor.sam
--output-recursive OUTPUT_DIR	s3://aokad-ana-bucket/challenge/bamsort-20180831/picard-2.18.11/
--env OUTPUT_NAME	5929_tumor.sorted.bam

# java -jar picard.jar SortSam --help
USAGE: SortSam [options]

Documentation: http://broadinstitute.github.io/picard/command-line-overview.html#SortSam

This tool sorts the input SAM or BAM file by coordinate, queryname (QNAME), or some other property of the SAM record.
The SortOrder of a SAM/BAM file is found in the SAM file header tag @HD in the field labeled SO.
For a coordinate sorted SAM/BAM file, read alignments are sorted first by the reference sequence name (RNAME) field
using the reference sequence dictionary (@SQ tag).  Alignments within these subgroups are secondarily sorted using the
left-most mapping position of the read (POS).  Subsequent to this sorting scheme, alignments are listed arbitrarily.

For queryname-sorted alignments, all alignments are grouped using the queryname field but the alignments are not
necessarily sorted within these groups.  Reads having the same queryname are derived from the same template.



Usage example:

java -jar picard.jar SortSam \
I=input.bam \
O=sorted.bam \
SORT_ORDER=coordinate

Version: 2.18.11-SNAPSHOT


Options:

--help
-h                            Displays options specific to this tool.

--stdhelp
-H                            Displays options specific to this tool AND options common to all Picard command line
                              tools.

--version                     Displays program version.

INPUT=File
I=File                        Input BAM or SAM file to sort.  Required.

OUTPUT=File
O=File                        Sorted BAM or SAM output file.  Required.

SORT_ORDER=SortOrder
SO=SortOrder                  Sort order of output file.   Required. Possible values: {
                              queryname (Sorts according to the readname. This will place read-pairs and other derived
                              reads (secondary and supplementary) adjacent to each other. Note that the readnames are
                              compared lexicographically, even though they may include numbers. In paired reads, Read1
                              sorts before Read2.)
                              coordinate (Sorts primarily according to the SEQ and POS fields of the record. The
                              sequence will sorted according to the order in the sequence dictionary, taken from from
                              the header of the file. Within each reference sequence, the reads are sorted by the
                              position. Unmapped reads whose mates are mapped will be placed near their mates. Unmapped
                              read-pairs are placed after all the mapped reads and their mates.)
                              duplicate (Sorts the reads so that duplicates reads are adjacent. Required that the
                              mate-cigar (MC) tag is present. The resulting will be sorted by library, unclipped 5-prime
                              position, orientation, and mate's unclipped 5-prime position.)
                              }
COMMENTOUT
