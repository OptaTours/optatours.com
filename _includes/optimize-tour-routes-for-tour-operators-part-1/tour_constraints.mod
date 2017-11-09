# Spawn enough TourRunnings to meet or exceed client demand (No client left behind).
s.t. TourDemand_con {timeblock in TimeBlocks, tour in Tours}:
    MaxClientCount * X[tour, timeblock] - Bookings[tour, timeblock] >= 0;

# TourRunnings require a Tour Guide (We're not in the business of self-guided tours).
s.t. GuideDemand_Con {timeblock in TimeBlocks, tour in Tours}:
    (sum{guide in Guides} Y[tour, guide, timeblock]) - X[tour, timeblock] = 0;

# Tour Guides will only be on TourRunnings if the Tour Guide is available to work (Tour Guides like vacation too).
s.t. GuideAvailability_Con {timeblock in TimeBlocks, guide in Guides}:
    (sum{tour in Tours} Y[tour, guide, timeblock]) - GuideAvailabilities[guide, timeblock] <= 0;