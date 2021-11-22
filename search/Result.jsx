import React, { useState } from 'react'
import { Highlight, connectAutoComplete } from 'react-instantsearch-dom'
import AutoSuggest from 'react-autosuggest'
import AlgoLogo from './AlgoLogo.jsx'

const Result = (props) => {
  const [value, setValue] = useState('')

  const onChange = (event, { newValue }) => {
    setValue(newValue)
  }

  const onSuggestionsFetchRequested = ({ value }) => {
    props.refine(value)
  }
  const renderSuggestionsContainer = ({ containerProps, children }) => {
    return (
      <div {...containerProps}>
        {children}
        <AlgoLogo />
      </div>
    )
  }

  const renderSuggestion = (hit) => {
    //console.log(hit)
    return (
      <a href={hit.relpermalink} className="hitlink lh-tight">
        <span className="hitlink__title">
          <Highlight attribute="title" hit={hit} tagName="mark" />
        </span>
        <span className="hitlink__extra">
          {hit.summary ? (
            <span className="db text-note near-black mbxs">{hit.summary}</span>
          ) : null}
        </span>
      </a>
    )
  }

  const inputProps = {
    placeholder: 'Search the docs',
    onChange: onChange,
    value
  }

  return (
    <>
      <AutoSuggest
        renderSuggestionsContainer={renderSuggestionsContainer}
        suggestions={props.hits}
        onSuggestionsFetchRequested={onSuggestionsFetchRequested}
        renderSuggestion={renderSuggestion}
        inputProps={inputProps}
      />
    </>
  )
}

export default connectAutoComplete(Result)
