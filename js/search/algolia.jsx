import * as React from 'react'
import { createRoot } from 'react-dom/client'
import AlgoSearch from './AlgoSearch.jsx'

const root = createRoot(document.querySelector('#algoliasearch'));
root.render(<AlgoSearch />);
