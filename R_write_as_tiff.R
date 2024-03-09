library(rgdal)


# Your rasterLayer or SpatialGridDataFrame object
for (i in 2001:2023)
{
  filename <- paste0('peaks',i,'.dat')
rasterObj <- readGDAL(filename)
# Save with compression
outfile <- paste0('peaks',i,'.tif')

writeGDAL(rasterObj, outfile, options = "COMPRESS=LZW")
}