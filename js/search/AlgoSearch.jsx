import algoliasearch from "algoliasearch/lite"
import AlgoLogo from "./AlgoLogo.jsx"
import { InstantSearch } from "react-instantsearch";
import { Autocomplete } from "./Autocomplete.jsx";
import { getAlgoliaResults } from '@algolia/autocomplete-js';
import { ResultItem } from "./ResultItem.jsx";

const searchClient = algoliasearch(
  "PWK5X2R2GD",
  "75cb7755dd0c05b3f3629e7a6793a2a3"
)

const future = {
  preserveSharedStateOnUnmount: false
}

const AlgoSearch = () => (
  <InstantSearch searchClient={searchClient} indexName={__ALGOLIA_INDEX__} future={future}>
    <label
      htmlFor="autocomplete-0-label"
      className="form__label white screen-reader-text"
      >
      Search the documentation
    </label>
    <Autocomplete
      detachedMediaQuery='none'
      getSources={({ query }) => [
        {
          sourceId: 'docs',
          getItemInputValue({ item }) {
            return item.name;
          },
          getItemUrl({ item }) {
            return item.relpermalink;
          },
          getItems() {
            return getAlgoliaResults({
              searchClient,
              queries: [
                {
                  indexName: __ALGOLIA_INDEX__,
                  query,
                  params: {
                    hitsPerPage: 10,
                  },
                },
              ],
            });
          },
          templates: {
            item({ item, components }) {
              return <ResultItem hit={item} components={components} />;
            },
            footer(){
              return <div class="logo">
              <AlgoLogo />
            </div>
            }
          },
        },
        
      ]}
      /* for navigating search bar with keyboard */
      navigator={{
        navigate({ itemUrl }) {
          window.location.assign(itemUrl);
        },
        navigateNewTab({ itemUrl }) {
          const windowReference = window.open(itemUrl, '_blank', 'noopener');
          if (windowReference) {
            windowReference.focus();
          }
        },
        navigateNewWindow({ itemUrl }) {
          window.open(itemUrl, '_blank', 'noopener');
        },
      }}
    />
  </InstantSearch>
)

export default AlgoSearch
