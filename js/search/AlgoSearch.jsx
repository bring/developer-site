import algoliasearch from "algoliasearch/lite"
import { InstantSearch } from "react-instantsearch-dom"
import Result from "./Result.jsx"

const algoliaClient = algoliasearch(
  "PWK5X2R2GD",
  "75cb7755dd0c05b3f3629e7a6793a2a3"
)

const emptyAlgoliaResponse = () => ({
  hits: [],
  nbHits: 0,
  nbPages: 0,
  page: 0,
  processingTimeMS: 0
})

const searchClient = {
  ...algoliaClient,
  search(requests) {
    if (requests.every(({ params }) => !params.query)) {
      return Promise.resolve({
        results: requests.map(emptyAlgoliaResponse)
      })
    }

    return algoliaClient.search(requests)
  }
}

const AlgoSearch = () => (
  <InstantSearch searchClient={searchClient} indexName={__ALGOLIA_INDEX__}>
    <Result />
  </InstantSearch>
)

export default AlgoSearch
