param TourCost = 50;
param GuideCost = 100;
param MaxClientCount = 23;

set TimeBlocks;

set Guides;
param GuideAvailabilities{Guides, TimeBlocks} binary;

set Tours;
param Bookings{Tours, TimeBlocks} integer >= 0;

var X{Tours, TimeBlocks} integer >= 0; # Number of TourRunnings for each TimeBlock
var Y{Tours, Guides, TimeBlocks} binary; # Tour Guide Assignments