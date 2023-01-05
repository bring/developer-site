import React, { useState } from "react"
import { Highlight, connectAutoComplete } from "react-instantsearch-dom"
import AutoSuggest from "react-autosuggest"
import AlgoLogo from "./AlgoLogo.jsx"

const Result = (props) => {
  const [value, setValue] = useState("")

  const onChange = (_event, { newValue }) => setValue(newValue)
  const onFetch = ({ value }) => props.refine(value)
  const onClear = () => props.refine("")
  const onNavigate = (_event, { suggestion }) =>
    (window.location.href = suggestion.relpermalink)

  const renderSuggestionsContainer = ({ containerProps, children }) => (
    <div {...containerProps}>
      {children}
      <AlgoLogo />
    </div>
  )

  const renderSuggestion = (hit) => (
    <a href={hit.relpermalink} className="hitlink lh-tight">
      {hit.section && (
        <span className="mb-badge">
          {hit.section}
          {hit.parent && ` – ${hit.parent}`}
        </span>
      )}
      <span className="hitlink__title">
        <Highlight attribute="title" hit={hit} tagName="mark" />
      </span>
      {hit.introduction && (
        <span className="hitlink__extra text-note" title={hit.introduction}>
          {hit.introduction}
        </span>
      )}
    </a>
  )

  const inputProps = {
    onChange,
    value,
    id: "autosuggestneedslabel"
  }

  return (
    <>
      <label
        htmlFor="autosuggestneedslabel"
        class="form__label white screen-reader-text"
      >
        Search the documentation
      </label>
      <AutoSuggest
        renderSuggestionsContainer={renderSuggestionsContainer}
        suggestions={props.hits}
        onSuggestionsFetchRequested={onFetch}
        onSuggestionsClearRequested={onClear}
        renderSuggestion={renderSuggestion}
        inputProps={inputProps}
        getSuggestionValue={() => value}
        onSuggestionSelected={onNavigate}
      />
    </>
  )
}

export default connectAutoComplete(Result)
