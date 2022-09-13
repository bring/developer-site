import React from 'react'
import algoliasearch from 'algoliasearch/lite'
import { InstantSearch } from 'react-instantsearch-dom'
import Result from './Result.jsx'

const searchClient = algoliasearch(
  'PWK5X2R2GD',
  '75cb7755dd0c05b3f3629e7a6793a2a3'
)

const AlgoSearch = () => (
  <InstantSearch searchClient={searchClient} indexName={process.env.ALGOLIA_INDEX || "devsite_qa"}>
    <Result />
  </InstantSearch>
)

export default AlgoSearch
