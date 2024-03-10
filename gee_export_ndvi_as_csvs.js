var points = ee.FeatureCollection("users/yshao/sen0123p");


var dataset = ee.ImageCollection("MODIS/006/MOD09Q1")
                  .filterBounds(points)     
                  .filter(ee.Filter.date('2001-01-01', '2023-12-31'));
                  

// Function to calculate NDVI from an image
var calculateNDVI = function(image) {
  var ndvi = image.normalizedDifference(['sur_refl_b02', 'sur_refl_b01']).rename('NDVI');
  return image.addBands(ndvi);
};

// Map the function over the dataset to apply NDVI calculation to each image
var NDVIs = dataset.map(calculateNDVI);

var NDVIs = NDVIs.select('NDVI')



// Function to map over the ImageCollection
var extractNdvi = function(image) {
  return image.reduceRegions({
    collection: points,
    reducer: ee.Reducer.first().setOutputs(['NDVI']), // Use first() to get the value of NDVI for each point
    scale: 250  // Adjust according to the resolution of your NDVI data
  }).map(function(feature) {
    return feature.set('date', image.date().format('YYYY-MM-dd'));
  });
};

var ndviSeries = NDVIs.map(extractNdvi).flatten();


Export.table.toDrive({
  collection: ndviSeries,
  description: 'NDVI_Time_Series',
  folder: 'ndvi_csvs',
  fileNamePrefix: 'ndvi_time_series',
  fileFormat: 'CSV'
});



