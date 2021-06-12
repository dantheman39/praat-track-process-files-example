# Praat sample keeping track of files that have already been processed

A colleague asked for an example of how to keep track of which files
have already been processed when analyzing data with Praat. Here's one
way to do that.

This script reads or creates a tab-separated file
("already-processed.tsv"), creating a "Table with column names" Praat
object. This loops through files in the "data" folder, and if the
file name is not in the Table, it appends it to the table.

# How to run

In the Praat Object window, toward the top, click Praat > Open Praat script,and open the script. Then in the script window that opens, go to Run > Run.

### Version of Praat used

Written with Praat 6.0.37 run on Ubuntu.
