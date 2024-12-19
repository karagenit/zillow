# Apartments

Zillow missing features:
- hide large apartment complexes
- filter by walk score and other params

Tried editing the URL param for hiding large complexes but it didn't work.

```
https://www.zillow.com/homes/for_rent/?searchQueryState={"isMapVisible":true,"mapBounds":{"west":-77.08456537521572,"east":-77.03984758651943,"south":38.83129148648382,"north":38.86047064887117},"mapZoom":15,"filterState":{"sort":{"value":"personalizedsort"},"fsba":{"value":false},"fsbo":{"value":false},"nc":{"value":false},"cmsn":{"value":false},"auc":{"value":false},"fore":{"value":false},"pmf":{"value":false},"pf":{"value":false},"fr":{"value":true}},"isListVisible":true,"pagination":{},"usersSearchTerm":"","listPriceActive":true}

https://www.zillow.com/homes/for_rent/?searchQueryState={"isMapVisible":true,"mapBounds":{"west":-77.08456537521572,"east":-77.03984758651943,"south":38.83129148648382,"north":38.86047064887117},"mapZoom":15,"filterState":{"sort":{"value":"personalizedsort"},"fsba":{"value":false},"fsbo":{"value":false},"nc":{"value":false},"cmsn":{"value":false},"auc":{"value":false},"fore":{"value":false},"pmf":{"value":false},"pf":{"value":false},"fr":{"value":true},"fmfb":{"value”:false}},”isListVisible":true,"pagination":{},"usersSearchTerm":"","listPriceActive":true}
```

## Search 1

[Arlington VA, $3000 limit, 1BD+](https://www.zillow.com/arlington-va/rentals/?searchQueryState=%7B%22isMapVisible%22%3Atrue%2C%22mapBounds%22%3A%7B%22west%22%3A-77.41436979568691%2C%22east%22%3A-76.8204214314291%2C%22south%22%3A38.608612491954304%2C%22north%22%3A39.075501228961194%7D%2C%22mapZoom%22%3A11%2C%22usersSearchTerm%22%3A%22Arlington%20VA%22%2C%22regionSelection%22%3A%5B%7B%22regionId%22%3A30258%2C%22regionType%22%3A6%7D%5D%2C%22filterState%22%3A%7B%22fr%22%3A%7B%22value%22%3Atrue%7D%2C%22fsba%22%3A%7B%22value%22%3Afalse%7D%2C%22fsbo%22%3A%7B%22value%22%3Afalse%7D%2C%22nc%22%3A%7B%22value%22%3Afalse%7D%2C%22cmsn%22%3A%7B%22value%22%3Afalse%7D%2C%22auc%22%3A%7B%22value%22%3Afalse%7D%2C%22fore%22%3A%7B%22value%22%3Afalse%7D%2C%22price%22%3A%7B%22min%22%3Anull%2C%22max%22%3A594961%7D%2C%22mp%22%3A%7B%22min%22%3Anull%2C%22max%22%3A3000%7D%2C%22mf%22%3A%7B%22value%22%3Afalse%7D%2C%22land%22%3A%7B%22value%22%3Afalse%7D%2C%22manu%22%3A%7B%22value%22%3Afalse%7D%2C%22sqft%22%3A%7B%22min%22%3A750%2C%22max%22%3Anull%7D%2C%22beds%22%3A%7B%22min%22%3A1%7D%7D%2C%22isListVisible%22%3Atrue%2C%22pagination%22%3A%7B%7D%7D)

Says 727 available. 

Inspect element. Main page response. Has a really huge page w/ some json payloads. "cat1" -> "searchResults" -> "listResults"

