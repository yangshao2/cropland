var allpoints = ee.FeatureCollection("users/yshao/sen0123p");

var points = allpoints.map(function(feature){
    var num = ee.Number.parse(feature.get('Id'));
    return feature.set('Id', num);
  });

var roi = points.filter(ee.Filter.eq('Id',2646));
print(roi)


var dataset = ee.ImageCollection("MODIS/006/MOD09Q1")
                  .filterBounds(roi)     
                  .filter(ee.Filter.date('2001-01-01', '2023-12-31'));
                  

// Function to calculate NDVI from an image
var calculateNDVI = function(image) {
  var ndvi = image.normalizedDifference(['sur_refl_b02', 'sur_refl_b01']).rename('NDVI');
  return image.addBands(ndvi);
};

// Map the function over the dataset to apply NDVI calculation to each image
var NDVIs = dataset.map(calculateNDVI);

var NDVIs = NDVIs.select('NDVI')



//Map.addLayer(NDVIs, colorizedVis, 'NDVI');
Map.addLayer(roi, {}, 'a_point');

//extract NDVI values (2001-2021) for this point location
var ndvi_timeseries = ui.Chart.image.series(NDVIs, roi)
  .setChartType('ScatterChart')
  .setOptions({
   title: 'MODIS NDVI Time Series at ROI',
   trendlines: {0: {
                color: 'CC0000'
   }},
   lineWidth: 1,
   pointSize: 3,
  });
print(ndvi_timeseries);


