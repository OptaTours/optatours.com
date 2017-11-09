minimize TourOperationsCost:
    sum{timeblock in TimeBlocks} (
        (sum{tour in Tours} X[tour, timeblock] * TourCost)
        +
        (
            sum{tour in Tours}
                sum{guide in Guides}
                    Y[tour, guide, timeblock] * GuideCost
        )
    )
    ;