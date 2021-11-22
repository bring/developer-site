import React from 'react'
import algoliasearch from 'algoliasearch/lite'
import { InstantSearch } from 'react-instantsearch-dom'
import Result from './Result.jsx'

const searchClient = algoliasearch(
  'A02N867TLD',
  '2c068e52ffd93cf15c2e7dd5bc317fd7'
)

const AlgoSearch = () => {
  return (
    <InstantSearch searchClient={searchClient} indexName="devsite">
      <Result />
    </InstantSearch>
  )
}

export default AlgoSearch
