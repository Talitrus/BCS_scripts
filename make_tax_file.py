#make_tax_file.py
#import eutils.client
import csv
import sys
# first argument should be Blast results, second argument should be SAP results
with open(sys.argv[1]) as tsv:
    for line in csv.reader(tsv, dialect="excel-tab"):
	print line
