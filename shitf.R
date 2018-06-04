library(XML)

#library(data.table)

#file<-fread("./shitdata.csv",select=c(37))

#dat<-xmlTreeParse("./shitdata2.xlsx",useInternal=TRUE)
#rootNOde<-xmlRoot(dat)
#xmlName(rootNOde)
#library(xlsx)
#ri<-18:23
#ci<-7:15
#dat<-read.xlsx("./shitdata2.xlsx",sheetIndex = 1,colIndex = ci ,rowIndex = ri)
fileURL<-"./Frestaurants.xml"
doc<-xmlTreeParse(fileURL,useInternal=TRUE)
rootNode<-xmlRoot(doc)
xmlName(rootNode)