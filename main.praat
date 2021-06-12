clearinfo

wd$ = "./"

if not fileReadable: wd$
    exitScript: "Folder does not exist: " + wd$
endif

inputDir$ = wd$ + "data/"
readFilesListPath$ = wd$ + "already-processed.tsv"

pathColumn$ = "path"
if fileReadable: readFilesListPath$
    appendInfoLine: "Reading in list of already-read files"
    readFiles = Read Table from tab-separated file: readFilesListPath$
else
    appendInfoLine: "Creating empty list of already-read files"
    tableName$ = "readFilesTable"
    numRows = 0
    readFiles = Create Table with column names: tableName$, numRows, pathColumn$
endif

fileList = Create Strings as file list: "fileList", inputDir$
numFiles = Get number of strings
for fileNum from 1 to numFiles
    selectObject: fileList
    fileName$ = Get string: fileNum

    selectObject: readFiles
    alreadyProcessed = Search column: pathColumn$, fileName$

    if alreadyProcessed > 0
        appendInfoLine: "Already processed, skipping: " + fileName$
    else
        appendInfoLine: "Processing file: " + fileName$

        # Do your thing

        selectObject: readFiles
        Append row
        lastRow = Get number of rows
        Set string value: lastRow, pathColumn$, fileName$
    endif
endfor

selectObject: readFiles
totalRows = Get number of rows
if totalRows > 0
    appendInfoLine: "Saving list of already-read files to " + readFilesListPath$
    Save as tab-separated file: readFilesListPath$
else
    appendInfoLine: "Not saving already-read files, list was empty"
endif

# Comment these out if you want a look at the Table and Strings list
removeObject: readFiles
removeObject: fileList