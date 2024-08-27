export function ResultItem({ hit, components }) {
  return (
    <a href={hit.relpermalink} className="hitlink lh-tight">
        {hit.section && (hit.section !== "API" || hit.parent) && (
        <span className="mb-badge">
          {hit.section !== "API" && hit.section}
          {hit.parent && `${hit.parent}`}
        </span>
        )}
        <span className="hitlink__title">
          <components.Highlight attribute="title" hit={hit} tagName="mark" />
        </span>
        {hit.introduction && (
        <span className="hitlink__extra text-note" title={hit.introduction}>
          {hit.introduction}
        </span>
        )}
    </a>
  );
}
